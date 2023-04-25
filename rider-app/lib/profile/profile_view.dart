import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:client_shared/theme/theme.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../main/bloc/jwt_cubit.dart';
import '../main/bloc/rider_profile_cubit.dart';
import '../query_result_view.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

// ignore: must_be_immutable
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  Gender? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Query(
                options: QueryOptions(
                    document: GET_RIDER_QUERY_DOCUMENT,
                    fetchPolicy: FetchPolicy.noCache),
                builder: (QueryResult result,
                    {Future<QueryResult?> Function()? refetch,
                    FetchMore? fetchMore}) {
                  if (result.hasException || result.isLoading) {
                    return QueryResultView(result);
                  }
                  final rider = GetRider$Query.fromJson(result.data!).rider!;
                  if (rider.firstName != null &&
                      firstNameController.value == null) {}
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RidyBackButton(text: S.of(context).action_back),
                          const Spacer(),
                          PopupMenuButton(itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child:
                                    Text(S.of(context).action_delete_account),
                                onTap: () {
                                  Future.delayed(
                                      const Duration(seconds: 0),
                                      () => showDialog(
                                          context: context,
                                          builder: (BuildContext ncontext) {
                                            return AlertDialog(
                                              title: Text(S
                                                  .of(context)
                                                  .message_delete_account_title),
                                              content: Text(S
                                                  .of(context)
                                                  .message_delete_account_body),
                                              actions: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Mutation(
                                                          options: MutationOptions(
                                                              document:
                                                                  DELETE_USER_MUTATION_DOCUMENT),
                                                          builder: (RunMutation
                                                                  runMutation,
                                                              QueryResult?
                                                                  result) {
                                                            return TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  await runMutation(
                                                                          {})
                                                                      .networkResult;
                                                                  await Hive.box(
                                                                          'user')
                                                                      .delete(
                                                                          'jwt');
                                                                  await Hive.box(
                                                                          'user')
                                                                      .delete(
                                                                          'jwt');
                                                                  context
                                                                      .read<
                                                                          RiderProfileCubit>()
                                                                      .updateProfile(
                                                                          null);
                                                                  context
                                                                      .read<
                                                                          JWTCubit>()
                                                                      .logOut();
                                                                  await Hive.box(
                                                                          'user')
                                                                      .delete(
                                                                          'jwt');
                                                                  context
                                                                      .read<
                                                                          RiderProfileCubit>()
                                                                      .updateProfile(
                                                                          null);
                                                                  context
                                                                      .read<
                                                                          JWTCubit>()
                                                                      .logOut();
                                                                  Navigator.popUntil(
                                                                      context,
                                                                      (route) =>
                                                                          route
                                                                              .isFirst);
                                                                },
                                                                child: Text(
                                                                  S
                                                                      .of(context)
                                                                      .action_delete_account,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffb20d0e)),
                                                                ));
                                                          }),
                                                    ),
                                                    const Spacer(),
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
                                                        child: Text(
                                                          S
                                                              .of(context)
                                                              .action_cancel,
                                                          textAlign:
                                                              TextAlign.end,
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            );
                                          }));
                                },
                              )
                            ];
                          })
                        ],
                      ),
                      SingleChildScrollView(
                          child: Column(children: [
                        const SizedBox(height: 16),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: UserAvatarView(
                                urlPrefix: serverUrl,
                                url: rider.media?.address,
                                cornerRadius: 10,
                                size: 50,
                              ),
                            ),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: CustomTheme.primaryColors.shade300,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.add,
                                    color: CustomTheme.neutralColors.shade500,
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "+${rider.mobileNumber}",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        CupertinoButton(
                            minSize: 0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 0),
                            child: Text(S.of(context).action_add_photo),
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(type: FileType.image);

                              if (result != null &&
                                  result.files.single.path != null) {
                                await uploadFile(result.files.single.path!);
                                refetch!();
                              }
                            }),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: firstNameController
                                ..text = rider.firstName ?? "",
                              decoration: InputDecoration(
                                  labelText: S.of(context).profile_firstname,
                                  fillColor:
                                      CustomTheme.primaryColors.shade100),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: lastNameController
                                ..text = rider.lastName ?? "",
                              decoration: InputDecoration(
                                  fillColor: CustomTheme.primaryColors.shade100,
                                  labelText: S.of(context).profile_lastname),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: emailController
                                ..text = rider.email ?? "",
                              decoration: InputDecoration(
                                  fillColor: CustomTheme.primaryColors.shade100,
                                  labelText: S.of(context).profile_email),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<Gender>(
                                value: rider.gender,
                                decoration: InputDecoration(
                                    fillColor:
                                        CustomTheme.primaryColors.shade100,
                                    labelText: S.of(context).profile_gender),
                                icon: const Icon(Ionicons.chevron_down),
                                items: <DropdownMenuItem<Gender>>[
                                  DropdownMenuItem(
                                      value: Gender.male,
                                      child:
                                          Text(S.of(context).enum_gender_male)),
                                  DropdownMenuItem(
                                      value: Gender.female,
                                      child: Text(
                                          S.of(context).enum_gender_female)),
                                  DropdownMenuItem(
                                      value: Gender.unknown,
                                      child: Text(
                                          S.of(context).enum_gender_unknown))
                                ],
                                onChanged: (Gender? value) => gender = value),
                          ]),
                        ),
                      ])),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                              child: Mutation(
                                  options: MutationOptions(
                                      document:
                                          UPDATE_PROFILE_MUTATION_DOCUMENT),
                                  builder: (RunMutation runMutation,
                                      QueryResult? result) {
                                    return ElevatedButton(
                                      child: Text(S.of(context).action_save),
                                      onPressed: () async {
                                        if (_formKey.currentState?.validate() !=
                                            true) return;
                                        final args = UpdateProfileArguments(
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                            email: emailController.text,
                                            gender: gender);
                                        await runMutation(args.toJson())
                                            .networkResult;
                                        refetch!();
                                      },
                                    );
                                  }))
                        ],
                      )
                    ],
                  );
                })));
  }

  uploadFile(String path) async {
    var postUri = Uri.parse("${serverUrl}upload_profile");
    var request = http.MultipartRequest("POST", postUri);
    request.headers['Authorization'] =
        'Bearer ${Hive.box('user').get('jwt').toString()}';
    request.files.add(await http.MultipartFile.fromPath('file', path));
    await request.send();
    // var response = await http.Response.fromStream(streamedResponse);
    // var json = jsonDecode(response.body);
    // setState(() {});
    // json['address'];
  }
}
