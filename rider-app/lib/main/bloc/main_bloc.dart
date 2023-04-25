import 'dart:typed_data';

import 'package:client_shared/components/marker_new.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:latlong2/latlong.dart';
import 'package:ridy/location_selection/location_selection_parent_view.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import 'package:collection/collection.dart';

// Events
abstract class MainBlocEvent {}

class MapMoved extends MainBlocEvent {
  LatLng latlng;

  MapMoved(this.latlng);
}

class ResetState extends MainBlocEvent {}

class DriverLocationUpdatedEvent extends MainBlocEvent {
  PointMixin location;

  DriverLocationUpdatedEvent(this.location);
}

class ShowPreview extends MainBlocEvent {
  List<FullLocation> points;
  List<String> selectedOptions;
  String? couponCode;

  ShowPreview(
      {required this.points, required this.selectedOptions, this.couponCode});
}

class SelectService extends MainBlocEvent {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service service;

  SelectService(this.service);
}

class ShowPreviewDirections extends MainBlocEvent {
  List<GetFare$Query$CalculateFareDTO$Point> directions;

  ShowPreviewDirections({required this.directions});
}

class SelectBookingTime extends MainBlocEvent {
  DateTime time;

  SelectBookingTime(this.time);
}

class ProfileUpdated extends MainBlocEvent {
  GetCurrentOrder$Query$Rider profile;
  PointMixin? driverLocation;

  ProfileUpdated({required this.profile, this.driverLocation});
}

class VersionStatusEvent extends MainBlocEvent {
  VersionStatus status;
  VersionStatusEvent(this.status);
}

class CurrentOrderUpdated extends MainBlocEvent {
  CurrentOrderMixin order;
  PointMixin? driverLocation;

  CurrentOrderUpdated(this.order, {this.driverLocation});
}

class SetDriversLocations extends MainBlocEvent {
  List<LatLng> driversLocations;

  SetDriversLocations(this.driversLocations);
}

// States
abstract class MainBlocState {
  List<MarkerDataInterface> markers;
  bool isInteractive;
  int bookedOrdersCount;

  MainBlocState(
      {required this.isInteractive,
      required this.markers,
      this.bookedOrdersCount = 0});
}

class RequireUpdateState extends MainBlocState {
  RequireUpdateState() : super(isInteractive: false, markers: []);
}

class SelectingPoints extends MainBlocState {
  List<FullLocation> points = [];
  List<LatLng> driverLocations = [];
  bool loadDrivers;
  int bookingsCount = 0;

  SelectingPoints(this.points, this.driverLocations, this.loadDrivers,
      {this.bookingsCount = 0})
      : super(
            isInteractive: true,
            markers: driverLocations
                .mapIndexed((index, e) =>
                    MarkerDataDriver(id: index.toString(), position: e))
                .toList());
}

class OrderPreview extends MainBlocState {
  List<FullLocation> points = [];
  List<String> selectedOptions = [];
  String? couponCode;
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service? selectedService;
  List<LatLng>? directions;

  OrderPreview(
      {required this.points,
      required this.selectedOptions,
      this.selectedService,
      required this.directions,
      this.couponCode})
      : super(
            isInteractive: false,
            markers: points
                .mapIndexed((index, element) => MarkerDataPosition(
                    id: index.toString(),
                    position: element.latlng,
                    address: element.address))
                .toList());
}

class StateWithActiveOrder extends MainBlocState {
  CurrentOrderMixin currentOrder;
  List<FullLocation> locations;
  List<MarkerDataInterface> visibleMarkers;

  StateWithActiveOrder(this.currentOrder,
      {required this.locations, required this.visibleMarkers})
      : super(isInteractive: false, markers: visibleMarkers);
}

class OrderLooking extends StateWithActiveOrder {
  CurrentOrderMixin order;

  OrderLooking(this.order)
      : super(order,
            locations: order.addresses
                .mapIndexed((index, e) => FullLocation(
                    latlng: order.points[index].toLatLng(),
                    address: order.addresses[index],
                    title: "title"))
                .toList(),
            visibleMarkers: order.points
                .mapIndexed((index, element) => MarkerDataPosition(
                    id: index.toString(),
                    position: element.toLatLng(),
                    address: order.addresses[index]))
                .toList());
}

class OrderInProgress extends StateWithActiveOrder {
  CurrentOrderMixin order;
  LatLng? driverLocation;

  OrderInProgress(this.order, {this.driverLocation})
      : super(order, locations: [], visibleMarkers: []) {
    switch (order.status) {
      case OrderStatus.driverAccepted:
      case OrderStatus.arrived:
        markers = <MarkerDataInterface>[
          MarkerDataPosition(
              id: order.points[0].lat.toString(),
              position: LatLng(order.points[0].lat, order.points[0].lng),
              address: order.addresses[0])
        ];
        break;

      case OrderStatus.started:
        markers = order.points
            .sublist(1)
            .mapIndexed<MarkerDataInterface>((index, point) =>
                MarkerDataPosition(
                    id: point.lat.toString(),
                    position: LatLng(point.lat, point.lng),
                    address: order.addresses[index]))
            .toList();
        break;

      default:
    }
    if (driverLocation != null) {
      markers = markers.followedBy([
        MarkerDataDriver(
            id: driverLocation!.latitude.toString(), position: driverLocation!)
      ]).toList();
    }
  }
}

class OrderInvoice extends StateWithActiveOrder {
  CurrentOrderMixin order;

  OrderInvoice(this.order)
      : super(order,
            locations: [],
            visibleMarkers: order.points
                .mapIndexed((index, element) => MarkerDataPosition(
                    id: index.toString(),
                    position: element.toLatLng(),
                    address: order.addresses[index]))
                .toList());
}

class OrderReview extends StateWithActiveOrder {
  CurrentOrderMixin order;

  OrderReview(this.order)
      : super(order,
            locations: [],
            visibleMarkers: order.points
                .mapIndexed((index, element) => MarkerDataPosition(
                    id: index.toString(),
                    position: element.toLatLng(),
                    address: order.addresses[index]))
                .toList());
}

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(SelectingPoints([], [], true)) {
    on<VersionStatusEvent>(((event, emit) => emit(RequireUpdateState())));

    on<ResetState>((event, emit) => emit(SelectingPoints([], [], true)));

    on<ShowPreview>((event, emit) => emit(OrderPreview(
        points: event.points,
        selectedOptions: event.selectedOptions,
        couponCode: event.couponCode,
        directions: [])));

    on<SelectService>((event, emit) => emit(OrderPreview(
        points: (state as OrderPreview).points,
        selectedOptions: (state as OrderPreview).selectedOptions,
        couponCode: (state as OrderPreview).couponCode,
        selectedService: event.service,
        directions: (state as OrderPreview).directions)));

    on<ShowPreviewDirections>((event, emit) {
      emit(OrderPreview(
          points: (state as OrderPreview).points,
          selectedOptions: (state as OrderPreview).selectedOptions,
          couponCode: (state as OrderPreview).couponCode,
          selectedService: (state as OrderPreview).selectedService,
          directions:
              event.directions.map((e) => LatLng(e.lat, e.lng)).toList()));
    });

    on<ProfileUpdated>((event, emit) {
      LatLng? driverLocation = event.driverLocation?.toLatLng();
      if (driverLocation == null &&
          state is OrderInProgress &&
          (state as OrderInProgress).driverLocation != null) {
        driverLocation = (state as OrderInProgress).driverLocation;
      }
      int bookings = event.profile.bookedOrders.first.count?.id ?? 0;
      if (event.profile.orders.isEmpty && state is StateWithActiveOrder) {
        emit(SelectingPoints([], [], true, bookingsCount: bookings));
        return;
      }
      if (event.profile.orders.isEmpty &&
          (state is SelectingPoints || state is OrderPreview)) {
        return;
      }
      GetCurrentOrder$Query$Rider$Order order = event.profile.orders.first;
      switch (order.status) {
        case OrderStatus.requested:
        case OrderStatus.notFound:
        case OrderStatus.noCloseFound:
        case OrderStatus.found:
        case OrderStatus.booked:
          emit(OrderLooking(order));
          return;

        case OrderStatus.driverAccepted:
        case OrderStatus.arrived:
        case OrderStatus.started:
          emit(OrderInProgress(order, driverLocation: driverLocation));
          return;

        case OrderStatus.expired:
        case OrderStatus.finished:
        case OrderStatus.riderCanceled:
        case OrderStatus.driverCanceled:
        case OrderStatus.artemisUnknown:
          if (state is! SelectingPoints || state is! OrderPreview) {
            emit(SelectingPoints([], [], true, bookingsCount: bookings));
          }
          return;

        case OrderStatus.waitingForPostPay:
        case OrderStatus.waitingForPrePay:
          emit(OrderInvoice(order));
          return;

        case OrderStatus.waitingForReview:
          emit(OrderReview(order));
          return;
      }
    });

    on<CurrentOrderUpdated>(((event, emit) {
      LatLng? driverLocation = event.driverLocation?.toLatLng();

      if (driverLocation == null &&
          state is OrderInProgress &&
          (state as OrderInProgress).driverLocation != null) {
        driverLocation = (state as OrderInProgress).driverLocation;
      }
      if (state is StateWithActiveOrder) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _state = state as StateWithActiveOrder;
        if (_state.currentOrder.status == event.order.status &&
            _state.currentOrder.costAfterCoupon ==
                event.order.costAfterCoupon) {
          return;
        }
      }
      switch (event.order.status) {
        case OrderStatus.requested:
        case OrderStatus.notFound:
        case OrderStatus.noCloseFound:
        case OrderStatus.found:
        case OrderStatus.booked:
          emit(OrderLooking(event.order));
          return;

        case OrderStatus.driverAccepted:
        case OrderStatus.arrived:
        case OrderStatus.started:
          emit(OrderInProgress(event.order, driverLocation: driverLocation));
          return;

        case OrderStatus.expired:
        case OrderStatus.finished:
        case OrderStatus.riderCanceled:
        case OrderStatus.driverCanceled:
        case OrderStatus.artemisUnknown:
          emit(SelectingPoints([], [], true, bookingsCount: 0));
          return;

        case OrderStatus.waitingForPostPay:
        case OrderStatus.waitingForPrePay:
          emit(OrderInvoice(event.order));
          return;

        case OrderStatus.waitingForReview:
          emit(OrderReview(event.order));
          return;
      }
    }));

    on<DriverLocationUpdatedEvent>((event, emit) {
      if (state is OrderInProgress) {
        emit(OrderInProgress((state as OrderInProgress).currentOrder,
            driverLocation: LatLng(event.location.lat, event.location.lng)));
      }
    });
    on<SetDriversLocations>((event, emit) {
      if (state is SelectingPoints &&
          (state as SelectingPoints).driverLocations.length ==
              event.driversLocations.length) return;
      if (state is! SelectingPoints) return;
      emit(SelectingPoints(
          (state as SelectingPoints).points, event.driversLocations, false,
          bookingsCount: (state as SelectingPoints).bookingsCount));
    });
  }
}

abstract class MarkerDataInterface {
  String id;
  LatLng position;

  MarkerDataInterface({required this.id, required this.position});

  Marker toFlutterMapMarker();

  google.Marker toGoogleMarker(
      Uint8List carIconBytes, Uint8List positionIconBytes);
}

class MarkerDataPosition extends MarkerDataInterface {
  String address;

  MarkerDataPosition(
      {required this.address, required String id, required LatLng position})
      : super(id: id, position: position);

  @override
  google.Marker toGoogleMarker(
      Uint8List carIconBytes, Uint8List positionIconBytes) {
    return google.Marker(
        markerId: google.MarkerId(id),
        position: google.LatLng(position.latitude, position.longitude),
        icon: google.BitmapDescriptor.fromBytes(positionIconBytes));
  }

  @override
  Marker toFlutterMapMarker() {
    return Marker(
        width: 240,
        height: 63,
        point: position,
        anchorPos: AnchorPos.exactly(Anchor(120, 1)),
        builder: (context) => MarkerNew(address: address));
  }
}

class MarkerDataDriver extends MarkerDataInterface {
  String assetAddress = 'images/marker_taxi.png';

  MarkerDataDriver({required String id, required LatLng position})
      : super(id: id, position: position);

  @override
  google.Marker toGoogleMarker(
      Uint8List carIconBytes, Uint8List positionIconBytes) {
    return google.Marker(
        markerId: google.MarkerId(id),
        position: google.LatLng(position.latitude, position.longitude),
        icon: google.BitmapDescriptor.fromBytes(carIconBytes));
  }

  @override
  Marker toFlutterMapMarker() {
    return Marker(
        width: 48,
        height: 48,
        point: position,
        builder: (context) => Image.asset(assetAddress));
  }
}

extension RiderAddressToFullLocation on CurrentOrderMixin$Point {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}
