import 'graphql/generated/graphql_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

abstract class MainEvent {}

class DriverUpdated extends MainEvent {
  BasicProfileMixin driver;

  DriverUpdated(this.driver);
}

class VersionStatusEvent extends MainEvent {
  VersionStatus status;
  VersionStatusEvent(this.status);
}

class AvailableOrdersUpdated extends MainEvent {
  List<dynamic> orders;

  AvailableOrdersUpdated(this.orders);
}

class AvailabledOrderAdded extends MainEvent {
  Map<String, dynamic> order;

  AvailabledOrderAdded(this.order);
}

class AvailableOrderRemoved extends MainEvent {
  Map<String, dynamic> order;

  AvailableOrderRemoved(this.order);
}

class SelectedOrderChanged extends MainEvent {
  int index;

  SelectedOrderChanged(this.index);
}

class CurrentOrderUpdated extends MainEvent {
  Map<String, dynamic> order;

  CurrentOrderUpdated(this.order);
}

abstract class MainState {
  BasicProfileMixin? driver;
  List<MarkerData> markers;

  MainState(this.driver, this.markers);
}

class StatusUnregistered extends MainState {
  StatusUnregistered(driver) : super(driver, []);
}

class StatusOffline extends MainState {
  StatusOffline(BasicProfileMixin? driver) : super(driver, []);
}

class RequireUpdateState extends MainState {
  RequireUpdateState() : super(null, []);
}

class StatusOnline extends MainState {
  List<AvailableOrderMixin> orders;
  AvailableOrderMixin? selectedOrder;

  StatusOnline({driver, required this.orders, this.selectedOrder})
      : super(
            driver,
            selectedOrder != null
                ? selectedOrder.points
                    .asMap()
                    .entries
                    .map((e) => MarkerData(
                        id: e.value.lat.toString(),
                        position: LatLng(e.value.lat, e.value.lng),
                        address: selectedOrder.addresses[e.key]))
                    .toList()
                : []);
}

class StatusInService extends MainState {
  LatLng? currentLocation;

  StatusInService(driver, {this.currentLocation}) : super(driver, []) {
    if (this.driver?.currentOrders.isNotEmpty ?? false) {
      final order = this.driver?.currentOrders.first;
      if (order!.status == OrderStatus.driverAccepted ||
          order.status == OrderStatus.arrived) {
        markers = [
          MarkerData(
              id: order.points[0].lat.toString(),
              position: LatLng(order.points[0].lat, order.points[0].lng),
              address: order.addresses[0])
        ];
      }
      if (order.status == OrderStatus.started) {
        markers = order.points
            .skip(1)
            .toList()
            .asMap()
            .entries
            .map<MarkerData>((e) => MarkerData(
                id: order.points[e.key].lat.toString(),
                position:
                    LatLng(order.points[e.key].lat, order.points[e.key].lng),
                address: order.addresses[e.key]))
            .toList();
      }
    }
  }
}

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(StatusOffline(null)) {
    on<VersionStatusEvent>(((event, emit) => emit(RequireUpdateState())));

    on<DriverUpdated>((event, emit) {
      switch (event.driver.status) {
        case DriverStatus.online:
          emit(StatusOnline(driver: event.driver, orders: []));
          break;

        case DriverStatus.inService:
          emit(StatusInService(event.driver));
          break;

        case DriverStatus.offline:
          emit(StatusOffline(event.driver));
          break;

        case DriverStatus.blocked:
        case DriverStatus.waitingDocuments:
        case DriverStatus.pendingApproval:
        case DriverStatus.softReject:
        case DriverStatus.hardReject:
        case DriverStatus.artemisUnknown:
          emit(StatusUnregistered(event.driver));
      }
    });

    on<AvailableOrdersUpdated>((event, emit) {
      if (state is! StatusOnline) {
        return;
      }
      // if ((listEquals((state as StatusOnline).orders.map((e) => e.id).toList(),
      //         event.orders.map((e) => e.id).toList())) &&
      //     event.location?.latitude ==
      //         (state as StatusOnline).currentLocation?.latitude) {
      //   return;
      // }
      List<AvailableOrderMixin> orders = event.orders
          .map<AvailableOrders$Query$Order>(
              (orderObj) => AvailableOrders$Query$Order.fromJson(orderObj))
          .toList();
      final sumOldIds = (state as StatusOnline).orders.fold<int>(
          0, (previousValue, element) => previousValue + int.parse(element.id));
      final sumNewIds = orders.fold<int>(
          0, (value, element) => value + int.parse(element.id));
      if (sumNewIds != sumOldIds) {
        emit(StatusOnline(
            driver: state.driver,
            orders: orders,
            selectedOrder: orders.isNotEmpty ? orders.first : null));
      }
    });

    on<AvailabledOrderAdded>((event, emit) {
      if (state is StatusOnline) {
        if ((state as StatusOnline).orders.indexWhere(
                (element) => element.id == event.order['orderCreated']['id']) ==
            -1) {
          final AvailableOrderMixin created =
              AvailableOrders$Query$Order.fromJson(
                  event.order['orderCreated'] as Map<String, dynamic>);
          (state as StatusOnline).orders.add(created);
          emit(StatusOnline(
              driver: state.driver,
              orders: (state as StatusOnline).orders,
              selectedOrder: (state as StatusOnline).orders.length == 1
                  ? (state as StatusOnline).orders.first
                  : (state as StatusOnline).selectedOrder));
        }
      }
    });

    on<AvailableOrderRemoved>((event, emit) {
      if (state is StatusOnline) {
        final updated =
            OrderRemoved$Subscription.fromJson(event.order).orderRemoved;
        if ((state as StatusOnline)
                .orders
                .indexWhere((element) => element.id == updated.id) >
            -1) {
          (state as StatusOnline)
              .orders
              .removeWhere((element) => element.id == updated.id);
          emit(StatusOnline(
              driver: state.driver,
              orders: (state as StatusOnline).orders,
              selectedOrder: (state as StatusOnline).selectedOrder));
        }
      }
    });

    on<SelectedOrderChanged>((event, emit) {
      if (state is StatusOnline) {
        emit(StatusOnline(
            driver: state.driver,
            orders: (state as StatusOnline).orders,
            selectedOrder: (state as StatusOnline).orders[event.index]));
      }
    });

    on<CurrentOrderUpdated>((event, emit) {
      final endedStatuses = [
        OrderStatus.riderCanceled,
        OrderStatus.driverCanceled,
        OrderStatus.finished,
        OrderStatus.waitingForReview
      ];
      final order = BasicProfileMixin$Order.fromJson(event.order);
      if (endedStatuses.contains(order.status)) {
        state.driver!.status = DriverStatus.online;
        state.driver!.currentOrders = [];
        emit(StatusOnline(driver: state.driver, orders: []));
      } else {
        if (state.driver!.currentOrders.isEmpty) {
          state.driver!.currentOrders.add(order);
        } else {
          state.driver!.currentOrders = [order];
        }
        emit(StatusInService(state.driver));
      }
    });
  }
}

class MarkerData {
  String id;
  LatLng position;
  String address;

  MarkerData({required this.id, required this.position, required this.address});
}
