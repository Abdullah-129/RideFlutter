import 'dart:async';

import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:country_codes/country_codes.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ridy/chat/chat_view.dart';
import 'package:ridy/current_location_cubit.dart';
import 'package:ridy/earnings/earnings_view.dart';
import 'package:ridy/map_providers/google_map_provider.dart';
import 'package:ridy/notice_bar.dart';
import 'package:ridy/profile/profile_view.dart';
import 'package:ridy/register/register_view.dart';
import 'package:ridy/unregistered_driver_messages_view.dart';

import 'announcements/announcements_view.dart';
import 'config.dart';
import 'drawer_view.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'main_bloc.dart';
import 'map_providers/open_street_map_provider.dart';
import 'order_status_card_view.dart';
import 'orders_carousel_view.dart';
import 'query_result_view.dart';
import 'trip-history/trip_history_list_view.dart';
import 'wallet/wallet_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'graphql/generated/graphql_api.dart';
import 'graphql_provider.dart';
import 'package:geolocator/geolocator.dart';

// ignore: avoid_void_async
void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await Hive.openBox('user');
  await CountryCodes.init();
  final locale = CountryCodes.detailsForLocale();
  if (locale.dialCode != null) {
    defaultCountryCode = locale.dialCode!;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, Box box, widget) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<MainBloc>(
                lazy: false, create: (context) => MainBloc()),
            BlocProvider<CurrentLocationCubit>(
                lazy: false, create: (context) => CurrentLocationCubit())
          ],
          child: MyGraphqlProvider(
            uri: "${serverUrl}graphql",
            subscriptionUri: "${wsUrl}graphql",
            jwt: box.get('jwt').toString(),
            child: MaterialApp(
                title: 'Ridy',
                navigatorObservers: [defaultLifecycleObserver],
                debugShowCheckedModeBanner: false,
                localizationsDelegates: S.localizationsDelegates,
                supportedLocales: S.supportedLocales,
                routes: {
                  'register': (context) => const RegisterView(),
                  'profile': (context) => const ProfileView(),
                  'trip-history': (context) => const TripHistoryListView(),
                  'announcements': (context) => const AnnouncementsView(),
                  'earnings': (context) => const EarningsView(),
                  'chat': (context) => const ChatView(),
                  'wallet': (context) => const WalletView(),
                },
                theme: CustomTheme.theme1,
                home: MyHomePage()),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Refetch? refetch;

  MyHomePage({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final mainBloc = context.read<MainBloc>();
    final locationCubit = context.read<CurrentLocationCubit>();
    return Scaffold(
        key: scaffoldKey,
        drawer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Drawer(
            backgroundColor: CustomTheme.primaryColors.shade100,
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return DrawerView(
                  driver: state.driver,
                );
              },
            ),
          ),
        ),
        body: ValueListenableBuilder(
            valueListenable: Hive.box('user').listenable(),
            builder: (context, Box box, widget) {
              if (box.get('jwt') == null) {
                return UnregisteredDriverMessagesView(
                  driver: null,
                  refetch: refetch,
                );
              }
              return LifecycleWrapper(
                  onLifecycleEvent: (event) {
                    if (event == LifecycleEvent.active && refetch != null) {
                      refetch!();
                      updateNotificationId(context);
                    }
                  },
                  child: FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        return Query(
                            options: QueryOptions(
                                document: ME_QUERY_DOCUMENT,
                                variables: MeArguments(
                                        versionCode: int.parse(
                                            snapshot.data?.buildNumber ??
                                                "999999"))
                                    .toJson(),
                                fetchPolicy: FetchPolicy.noCache),
                            builder: (QueryResult result,
                                {Refetch? refetch, FetchMore? fetchMore}) {
                              if (result.isLoading || result.hasException) {
                                return QueryResultView(result);
                              }
                              this.refetch = refetch;
                              final mquery = Me$Query.fromJson(result.data!);
                              if (mquery.requireUpdate ==
                                  VersionStatus.mandatoryUpdate) {
                                mainBloc.add(
                                    VersionStatusEvent(mquery.requireUpdate));
                              } else {
                                mainBloc.add(DriverUpdated(mquery.driver!));
                                locationCubit
                                    .setRadius(mquery.driver!.searchDistance);
                              }
                              return BlocConsumer<MainBloc, MainState>(
                                  listenWhen:
                                      (MainState previous, MainState next) {
                                if (previous is StatusUnregistered &&
                                    next is StatusUnregistered &&
                                    previous.driver?.status ==
                                        next.driver?.status) {
                                  return false;
                                }
                                if ((previous is StatusOnline) &&
                                    next is StatusOnline) {
                                  return false;
                                }
                                return true;
                              }, listener: (context, state) {
                                if (state is StatusOnline) {
                                  refetch!();
                                }
                              }, builder: (context, state) {
                                if (state is StatusUnregistered) {
                                  return UnregisteredDriverMessagesView(
                                      driver: state.driver, refetch: refetch);
                                }
                                return Stack(children: [
                                  if (mapProvider ==
                                          MapProvider.openStreetMap ||
                                      mapProvider == MapProvider.mapBox)
                                    OpenStreetMapProvider(),
                                  if (mapProvider == MapProvider.googleMap)
                                    GoogleMapProvider(),
                                  SafeArea(
                                    minimum: const EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _getMenuButton(),
                                        const Spacer(),
                                        _getWalletButton(context, state),
                                        if (state is! StatusInService)
                                          const Spacer(),
                                        _getOnlineOfflineButton(context, state)
                                      ],
                                    ),
                                  ),
                                  if (state is StatusOffline ||
                                      (state is StatusOnline &&
                                          state.orders.isEmpty))
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: NoticeBar(
                                          title: state is StatusOffline
                                              ? S
                                                  .of(context)
                                                  .status_offline_description
                                              : S
                                                  .of(context)
                                                  .status_online_description),
                                    ),
                                  if (state is StatusOnline)
                                    Positioned(
                                      bottom: 0,
                                      child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 350,
                                          child: OrdersCarouselView()),
                                    ),
                                  if (state is StatusInService &&
                                      state.driver!.currentOrders.isNotEmpty)
                                    Positioned(
                                      bottom: 0,
                                      child: Subscription(
                                          options: SubscriptionOptions(
                                              document:
                                                  ORDER_UPDATED_SUBSCRIPTION_DOCUMENT,
                                              fetchPolicy: FetchPolicy.noCache),
                                          builder: (QueryResult result) {
                                            if (result.data != null) {
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                refetch!();
                                              });
                                            }
                                            return SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: OrderStatusCardView(
                                                    order: state.driver!
                                                        .currentOrders.first));
                                          }),
                                    ),
                                ]);
                              });
                            });
                      }));
            }));
  }

  Widget _getOnlineOfflineButton(BuildContext context, MainState state) {
    final mainBloc = context.read<MainBloc>();

    return Mutation(
        options:
            MutationOptions(document: UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          return Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 3),
                  blurRadius: 15)
            ]),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: (state is StatusOffline)
                    ? FloatingActionButton.extended(
                        key: const Key('offline'),
                        heroTag: 'fabOffline',
                        extendedPadding:
                            const EdgeInsets.symmetric(horizontal: 36),
                        elevation: 0,
                        backgroundColor: CustomTheme.primaryColors,
                        foregroundColor: Colors.white,
                        onPressed: (result?.isLoading ?? false)
                            ? null
                            : () async {
                                final fcmId = await getFcmId(context);
                                final res = await runMutation(
                                        UpdateDriverStatusArguments(
                                                status: DriverStatus.online,
                                                fcmId: fcmId)
                                            .toJson())
                                    .networkResult;
                                final driver =
                                    UpdateDriverStatus$Mutation.fromJson(
                                        res!.data!);
                                mainBloc
                                    .add(DriverUpdated(driver.updateOneDriver));
                              },
                        label: Text(S.of(context).statusOffline,
                            style: Theme.of(context).textTheme.headlineSmall),
                        icon: const Icon(Ionicons.car_sport),
                      )
                    : ((state is StatusOnline)
                        ? FloatingActionButton.extended(
                            key: const Key('online'),
                            heroTag: 'fabOnline',
                            elevation: 0,
                            onPressed: (result?.isLoading ?? false)
                                ? null
                                : () async {
                                    final res = await runMutation(
                                            UpdateDriverStatusArguments(
                                                    status:
                                                        DriverStatus.offline)
                                                .toJson())
                                        .networkResult;
                                    final driver =
                                        UpdateDriverStatus$Mutation.fromJson(
                                            res!.data!);
                                    mainBloc.add(
                                        DriverUpdated(driver.updateOneDriver));
                                  },
                            label: Text(S.of(context).statusOnline,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: CustomTheme
                                            .primaryColors.shade600)),
                            backgroundColor: CustomTheme.primaryColors.shade200,
                            foregroundColor: CustomTheme.primaryColors.shade600,
                            icon: const Icon(Ionicons.power),
                          )
                        : const SizedBox())),
          );
        });
  }

  Widget _getMenuButton() {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x14000000), offset: Offset(3, 3), blurRadius: 25)
      ]),
      child: FloatingActionButton(
          heroTag: 'fabMenu',
          elevation: 0,
          mini: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          backgroundColor: CustomTheme.primaryColors.shade50,
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          )),
    );
  }

  Widget _getWalletButton(BuildContext context, MainState state) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x14000000), offset: Offset(0, 3), blurRadius: 15)
      ]),
      child: FloatingActionButton.extended(
          heroTag: 'fabIncome',
          onPressed: () => Navigator.pushNamed(context, 'earnings'),
          backgroundColor: CustomTheme.primaryColors.shade50,
          foregroundColor: CustomTheme.primaryColors,
          icon: const Icon(Ionicons.wallet),
          elevation: 0,
          label: Text(
              (state.driver?.wallets.length ?? 0) > 0
                  ? NumberFormat.simpleCurrency(
                          name: state.driver!.wallets.first.currency)
                      .format(state.driver!.wallets.first.balance)
                  : "-",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: CustomTheme.primaryColors))),
    );
  }

  Future<String?> getFcmId(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title:
                    Text(S.of(context).message_notification_permission_title),
                content: Text(S
                    .of(context)
                    .message_notification_permission_denined_message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(S.of(context).action_ok),
                  )
                ],
              ));
      return null;
    } else {
      messaging.onTokenRefresh.listen((event) {
        updateNotificationId(context);
      });
      return messaging.getToken(
        vapidKey: "",
      );
    }
  }

  void updateNotificationId(BuildContext context) async {
    final httpLink = HttpLink(
      "${serverUrl}graphql",
    );
    final authLink = AuthLink(
      getToken: () async => 'Bearer ${Hive.box('user').get('jwt')}',
    );
    Link link = authLink.concat(httpLink);
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
    final fcmId = await getFcmId(context);
    await client.mutate(MutationOptions(
        document: UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT,
        variables: {"fcmId": fcmId},
        fetchPolicy: FetchPolicy.noCache));
  }
}
