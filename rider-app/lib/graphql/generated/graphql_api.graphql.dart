// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import '../scalars/timestamp.dart';
import '../scalars/connection_cursor.dart';
part 'graphql_api.graphql.g.dart';

mixin ChatRiderMixin {
  late String id;
  String? firstName;
  String? lastName;
  late String mobileNumber;
  ChatRiderMixin$Media? media;
}
mixin ChatDriverMixin {
  late String id;
  String? firstName;
  String? lastName;
  late String mobileNumber;
  ChatDriverMixin$Media? media;
}
mixin ChatMessageMixin {
  late String id;
  late String content;
  late bool sentByDriver;
}
mixin HistoryOrderItemMixin {
  late List<HistoryOrderItemMixin$OrderEdge> edges;
  late HistoryOrderItemMixin$PageInfo pageInfo;
}
mixin PointMixin {
  late double lat;
  late double lng;
}
mixin CurrentOrderMixin {
  late String id;
  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;
  late List<CurrentOrderMixin$Point> points;
  CurrentOrderMixin$Driver? driver;
  late CurrentOrderMixin$Service service;
  List<CurrentOrderMixin$Point>? directions;
  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;
  late double paidAmount;
  late double costAfterCoupon;
  late double costBest;
  late String currency;
  late List<String> addresses;
  late int waitMinutes;
  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? startTimestamp;
  late int durationBest;
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order$Rider extends JsonSerializable
    with EquatableMixin, ChatRiderMixin {
  GetMessages$Query$Order$Rider();

  factory GetMessages$Query$Order$Rider.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$Order$RiderFromJson(json);

  @override
  List<Object?> get props => [id, firstName, lastName, mobileNumber, media];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$Order$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order$Driver extends JsonSerializable
    with EquatableMixin, ChatDriverMixin {
  GetMessages$Query$Order$Driver();

  factory GetMessages$Query$Order$Driver.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$Order$DriverFromJson(json);

  @override
  List<Object?> get props => [id, firstName, lastName, mobileNumber, media];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order$OrderMessage extends JsonSerializable
    with EquatableMixin, ChatMessageMixin {
  GetMessages$Query$Order$OrderMessage();

  factory GetMessages$Query$Order$OrderMessage.fromJson(
          Map<String, dynamic> json) =>
      _$GetMessages$Query$Order$OrderMessageFromJson(json);

  @override
  List<Object?> get props => [id, content, sentByDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMessages$Query$Order$OrderMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Order extends JsonSerializable with EquatableMixin {
  GetMessages$Query$Order();

  factory GetMessages$Query$Order.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$OrderFromJson(json);

  late String id;

  late GetMessages$Query$Order$Rider rider;

  GetMessages$Query$Order$Driver? driver;

  late List<GetMessages$Query$Order$OrderMessage> conversations;

  @override
  List<Object?> get props => [id, rider, driver, conversations];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query extends JsonSerializable with EquatableMixin {
  GetMessages$Query();

  factory GetMessages$Query.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$QueryFromJson(json);

  late GetMessages$Query$Order currentOrder;

  @override
  List<Object?> get props => [currentOrder];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChatRiderMixin$Media extends JsonSerializable with EquatableMixin {
  ChatRiderMixin$Media();

  factory ChatRiderMixin$Media.fromJson(Map<String, dynamic> json) =>
      _$ChatRiderMixin$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$ChatRiderMixin$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChatDriverMixin$Media extends JsonSerializable with EquatableMixin {
  ChatDriverMixin$Media();

  factory ChatDriverMixin$Media.fromJson(Map<String, dynamic> json) =>
      _$ChatDriverMixin$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$ChatDriverMixin$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation$OrderMessage extends JsonSerializable
    with EquatableMixin, ChatMessageMixin {
  SendMessage$Mutation$OrderMessage();

  factory SendMessage$Mutation$OrderMessage.fromJson(
          Map<String, dynamic> json) =>
      _$SendMessage$Mutation$OrderMessageFromJson(json);

  @override
  List<Object?> get props => [id, content, sentByDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$SendMessage$Mutation$OrderMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation extends JsonSerializable with EquatableMixin {
  SendMessage$Mutation();

  factory SendMessage$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SendMessage$MutationFromJson(json);

  late SendMessage$Mutation$OrderMessage createOneOrderMessage;

  @override
  List<Object?> get props => [createOneOrderMessage];
  @override
  Map<String, dynamic> toJson() => _$SendMessage$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewMessageReceived$Subscription$OrderMessage extends JsonSerializable
    with EquatableMixin, ChatMessageMixin {
  NewMessageReceived$Subscription$OrderMessage();

  factory NewMessageReceived$Subscription$OrderMessage.fromJson(
          Map<String, dynamic> json) =>
      _$NewMessageReceived$Subscription$OrderMessageFromJson(json);

  @override
  List<Object?> get props => [id, content, sentByDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$NewMessageReceived$Subscription$OrderMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewMessageReceived$Subscription extends JsonSerializable
    with EquatableMixin {
  NewMessageReceived$Subscription();

  factory NewMessageReceived$Subscription.fromJson(Map<String, dynamic> json) =>
      _$NewMessageReceived$SubscriptionFromJson(json);

  late NewMessageReceived$Subscription$OrderMessage newMessageReceived;

  @override
  List<Object?> get props => [newMessageReceived];
  @override
  Map<String, dynamic> toJson() =>
      _$NewMessageReceived$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Reservations$Query$OrderConnection$OrderEdge$Order
    extends JsonSerializable with EquatableMixin {
  Reservations$Query$OrderConnection$OrderEdge$Order();

  factory Reservations$Query$OrderConnection$OrderEdge$Order.fromJson(
          Map<String, dynamic> json) =>
      _$Reservations$Query$OrderConnection$OrderEdge$OrderFromJson(json);

  late String id;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime expectedTimestamp;

  late List<String> addresses;

  @override
  List<Object?> get props => [id, expectedTimestamp, addresses];
  @override
  Map<String, dynamic> toJson() =>
      _$Reservations$Query$OrderConnection$OrderEdge$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Reservations$Query$OrderConnection$OrderEdge extends JsonSerializable
    with EquatableMixin {
  Reservations$Query$OrderConnection$OrderEdge();

  factory Reservations$Query$OrderConnection$OrderEdge.fromJson(
          Map<String, dynamic> json) =>
      _$Reservations$Query$OrderConnection$OrderEdgeFromJson(json);

  late Reservations$Query$OrderConnection$OrderEdge$Order node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$Reservations$Query$OrderConnection$OrderEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Reservations$Query$OrderConnection extends JsonSerializable
    with EquatableMixin {
  Reservations$Query$OrderConnection();

  factory Reservations$Query$OrderConnection.fromJson(
          Map<String, dynamic> json) =>
      _$Reservations$Query$OrderConnectionFromJson(json);

  late List<Reservations$Query$OrderConnection$OrderEdge> edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$Reservations$Query$OrderConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Reservations$Query extends JsonSerializable with EquatableMixin {
  Reservations$Query();

  factory Reservations$Query.fromJson(Map<String, dynamic> json) =>
      _$Reservations$QueryFromJson(json);

  late Reservations$Query$OrderConnection orders;

  @override
  List<Object?> get props => [orders];
  @override
  Map<String, dynamic> toJson() => _$Reservations$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
    extends JsonSerializable with EquatableMixin {
  GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement();

  factory GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement.fromJson(
          Map<String, dynamic> json) =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementFromJson(
          json);

  late String id;

  late String title;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime startAt;

  late String description;

  String? url;

  @override
  List<Object?> get props => [id, title, startAt, description, url];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
    extends JsonSerializable with EquatableMixin {
  GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge();

  factory GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge.fromJson(
          Map<String, dynamic> json) =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeFromJson(
          json);

  late GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
      node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query$AnnouncementConnection extends JsonSerializable
    with EquatableMixin {
  GetAnnouncements$Query$AnnouncementConnection();

  factory GetAnnouncements$Query$AnnouncementConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GetAnnouncements$Query$AnnouncementConnectionFromJson(json);

  late List<GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge>
      edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAnnouncements$Query$AnnouncementConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAnnouncements$Query extends JsonSerializable with EquatableMixin {
  GetAnnouncements$Query();

  factory GetAnnouncements$Query.fromJson(Map<String, dynamic> json) =>
      _$GetAnnouncements$QueryFromJson(json);

  late GetAnnouncements$Query$AnnouncementConnection announcements;

  @override
  List<Object?> get props => [announcements];
  @override
  Map<String, dynamic> toJson() => _$GetAnnouncements$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRider$Query$Rider$Media extends JsonSerializable with EquatableMixin {
  GetRider$Query$Rider$Media();

  factory GetRider$Query$Rider$Media.fromJson(Map<String, dynamic> json) =>
      _$GetRider$Query$Rider$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$GetRider$Query$Rider$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRider$Query$Rider extends JsonSerializable with EquatableMixin {
  GetRider$Query$Rider();

  factory GetRider$Query$Rider.fromJson(Map<String, dynamic> json) =>
      _$GetRider$Query$RiderFromJson(json);

  late String id;

  late String mobileNumber;

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? email;

  GetRider$Query$Rider$Media? media;

  @override
  List<Object?> get props =>
      [id, mobileNumber, firstName, lastName, gender, email, media];
  @override
  Map<String, dynamic> toJson() => _$GetRider$Query$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRider$Query extends JsonSerializable with EquatableMixin {
  GetRider$Query();

  factory GetRider$Query.fromJson(Map<String, dynamic> json) =>
      _$GetRider$QueryFromJson(json);

  GetRider$Query$Rider? rider;

  @override
  List<Object?> get props => [rider];
  @override
  Map<String, dynamic> toJson() => _$GetRider$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation$Rider extends JsonSerializable
    with EquatableMixin {
  UpdateProfile$Mutation$Rider();

  factory UpdateProfile$Mutation$Rider.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$Mutation$RiderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$Mutation$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation extends JsonSerializable with EquatableMixin {
  UpdateProfile$Mutation();

  factory UpdateProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$MutationFromJson(json);

  late UpdateProfile$Mutation$Rider updateOneRider;

  @override
  List<Object?> get props => [updateOneRider];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation$Rider extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation$Rider();

  factory DeleteUser$Mutation$Rider.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$Mutation$RiderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$Mutation$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation();

  factory DeleteUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$MutationFromJson(json);

  late DeleteUser$Mutation$Rider deleteUser;

  @override
  List<Object?> get props => [deleteUser];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAddresses$Query$RiderAddress$Point extends JsonSerializable
    with EquatableMixin {
  GetAddresses$Query$RiderAddress$Point();

  factory GetAddresses$Query$RiderAddress$Point.fromJson(
          Map<String, dynamic> json) =>
      _$GetAddresses$Query$RiderAddress$PointFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAddresses$Query$RiderAddress$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAddresses$Query$RiderAddress extends JsonSerializable
    with EquatableMixin {
  GetAddresses$Query$RiderAddress();

  factory GetAddresses$Query$RiderAddress.fromJson(Map<String, dynamic> json) =>
      _$GetAddresses$Query$RiderAddressFromJson(json);

  late String id;

  late String title;

  @JsonKey(unknownEnumValue: RiderAddressType.artemisUnknown)
  late RiderAddressType type;

  late String details;

  late GetAddresses$Query$RiderAddress$Point location;

  @override
  List<Object?> get props => [id, title, type, details, location];
  @override
  Map<String, dynamic> toJson() =>
      _$GetAddresses$Query$RiderAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAddresses$Query extends JsonSerializable with EquatableMixin {
  GetAddresses$Query();

  factory GetAddresses$Query.fromJson(Map<String, dynamic> json) =>
      _$GetAddresses$QueryFromJson(json);

  late List<GetAddresses$Query$RiderAddress> riderAddresses;

  @override
  List<Object?> get props => [riderAddresses];
  @override
  Map<String, dynamic> toJson() => _$GetAddresses$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateAddress$Mutation$RiderAddress extends JsonSerializable
    with EquatableMixin {
  CreateAddress$Mutation$RiderAddress();

  factory CreateAddress$Mutation$RiderAddress.fromJson(
          Map<String, dynamic> json) =>
      _$CreateAddress$Mutation$RiderAddressFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$CreateAddress$Mutation$RiderAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateAddress$Mutation extends JsonSerializable with EquatableMixin {
  CreateAddress$Mutation();

  factory CreateAddress$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateAddress$MutationFromJson(json);

  late CreateAddress$Mutation$RiderAddress createOneRiderAddress;

  @override
  List<Object?> get props => [createOneRiderAddress];
  @override
  Map<String, dynamic> toJson() => _$CreateAddress$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateRiderAddressInput extends JsonSerializable with EquatableMixin {
  CreateRiderAddressInput({
    required this.title,
    required this.details,
    required this.location,
    this.type,
  });

  factory CreateRiderAddressInput.fromJson(Map<String, dynamic> json) =>
      _$CreateRiderAddressInputFromJson(json);

  late String title;

  late String details;

  late PointInput location;

  @JsonKey(unknownEnumValue: RiderAddressType.artemisUnknown)
  RiderAddressType? type;

  @override
  List<Object?> get props => [title, details, location, type];
  @override
  Map<String, dynamic> toJson() => _$CreateRiderAddressInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PointInput extends JsonSerializable with EquatableMixin {
  PointInput({
    required this.lat,
    required this.lng,
  });

  factory PointInput.fromJson(Map<String, dynamic> json) =>
      _$PointInputFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$PointInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateAddress$Mutation$RiderAddress extends JsonSerializable
    with EquatableMixin {
  UpdateAddress$Mutation$RiderAddress();

  factory UpdateAddress$Mutation$RiderAddress.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAddress$Mutation$RiderAddressFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateAddress$Mutation$RiderAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateAddress$Mutation extends JsonSerializable with EquatableMixin {
  UpdateAddress$Mutation();

  factory UpdateAddress$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddress$MutationFromJson(json);

  late UpdateAddress$Mutation$RiderAddress updateOneRiderAddress;

  @override
  List<Object?> get props => [updateOneRiderAddress];
  @override
  Map<String, dynamic> toJson() => _$UpdateAddress$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteAddress$Mutation$RiderAddressDeleteResponse extends JsonSerializable
    with EquatableMixin {
  DeleteAddress$Mutation$RiderAddressDeleteResponse();

  factory DeleteAddress$Mutation$RiderAddressDeleteResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAddress$Mutation$RiderAddressDeleteResponseFromJson(json);

  String? id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$DeleteAddress$Mutation$RiderAddressDeleteResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteAddress$Mutation extends JsonSerializable with EquatableMixin {
  DeleteAddress$Mutation();

  factory DeleteAddress$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddress$MutationFromJson(json);

  late DeleteAddress$Mutation$RiderAddressDeleteResponse deleteOneRiderAddress;

  @override
  List<Object?> get props => [deleteOneRiderAddress];
  @override
  Map<String, dynamic> toJson() => _$DeleteAddress$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHistory$Query$OrderConnection extends JsonSerializable
    with EquatableMixin, HistoryOrderItemMixin {
  GetHistory$Query$OrderConnection();

  factory GetHistory$Query$OrderConnection.fromJson(
          Map<String, dynamic> json) =>
      _$GetHistory$Query$OrderConnectionFromJson(json);

  @override
  List<Object?> get props => [edges, pageInfo];
  @override
  Map<String, dynamic> toJson() =>
      _$GetHistory$Query$OrderConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHistory$Query extends JsonSerializable with EquatableMixin {
  GetHistory$Query();

  factory GetHistory$Query.fromJson(Map<String, dynamic> json) =>
      _$GetHistory$QueryFromJson(json);

  late GetHistory$Query$OrderConnection orders;

  @override
  List<Object?> get props => [orders];
  @override
  Map<String, dynamic> toJson() => _$GetHistory$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order$Service$Media
    extends JsonSerializable with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order$Service$Media();

  factory HistoryOrderItemMixin$OrderEdge$Order$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order$Service extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order$Service();

  factory HistoryOrderItemMixin$OrderEdge$Order$Service.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$Order$ServiceFromJson(json);

  late HistoryOrderItemMixin$OrderEdge$Order$Service$Media media;

  late String name;

  @override
  List<Object?> get props => [media, name];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$Order$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order();

  factory HistoryOrderItemMixin$OrderEdge$Order.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$OrderFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime createdOn;

  late List<String> addresses;

  late String currency;

  late double costAfterCoupon;

  late HistoryOrderItemMixin$OrderEdge$Order$Service service;

  @override
  List<Object?> get props =>
      [id, status, createdOn, addresses, currency, costAfterCoupon, service];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdge$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge();

  factory HistoryOrderItemMixin$OrderEdge.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdgeFromJson(json);

  late HistoryOrderItemMixin$OrderEdge$Order node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$HistoryOrderItemMixin$OrderEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$PageInfo extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$PageInfo();

  factory HistoryOrderItemMixin$PageInfo.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$PageInfoFromJson(json);

  bool? hasNextPage;

  @JsonKey(
      fromJson: fromGraphQLConnectionCursorNullableToDartStringNullable,
      toJson: fromDartStringNullableToGraphQLConnectionCursorNullable)
  String? endCursor;

  @JsonKey(
      fromJson: fromGraphQLConnectionCursorNullableToDartStringNullable,
      toJson: fromDartStringNullableToGraphQLConnectionCursorNullable)
  String? startCursor;

  bool? hasPreviousPage;

  @override
  List<Object?> get props =>
      [hasNextPage, endCursor, startCursor, hasPreviousPage];
  @override
  Map<String, dynamic> toJson() => _$HistoryOrderItemMixin$PageInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  GetOrderDetails$Query$Order$Point();

  factory GetOrderDetails$Query$Order$Point.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$Driver$Media extends JsonSerializable
    with EquatableMixin {
  GetOrderDetails$Query$Order$Driver$Media();

  factory GetOrderDetails$Query$Order$Driver$Media.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$Driver$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  GetOrderDetails$Query$Order$Driver$CarModel();

  factory GetOrderDetails$Query$Order$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$Driver extends JsonSerializable
    with EquatableMixin {
  GetOrderDetails$Query$Order$Driver();

  factory GetOrderDetails$Query$Order$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$DriverFromJson(json);

  String? firstName;

  String? lastName;

  int? rating;

  String? carPlate;

  GetOrderDetails$Query$Order$Driver$Media? media;

  GetOrderDetails$Query$Order$Driver$CarModel? car;

  @override
  List<Object?> get props =>
      [firstName, lastName, rating, carPlate, media, car];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$Service$Media extends JsonSerializable
    with EquatableMixin {
  GetOrderDetails$Query$Order$Service$Media();

  factory GetOrderDetails$Query$Order$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$Service extends JsonSerializable
    with EquatableMixin {
  GetOrderDetails$Query$Order$Service();

  factory GetOrderDetails$Query$Order$Service.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$ServiceFromJson(json);

  late String name;

  late GetOrderDetails$Query$Order$Service$Media media;

  @override
  List<Object?> get props => [name, media];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$PaymentGateway$Media extends JsonSerializable
    with EquatableMixin {
  GetOrderDetails$Query$Order$PaymentGateway$Media();

  factory GetOrderDetails$Query$Order$PaymentGateway$Media.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$PaymentGateway$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$PaymentGateway$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order$PaymentGateway extends JsonSerializable
    with EquatableMixin {
  GetOrderDetails$Query$Order$PaymentGateway();

  factory GetOrderDetails$Query$Order$PaymentGateway.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$Order$PaymentGatewayFromJson(json);

  late String title;

  GetOrderDetails$Query$Order$PaymentGateway$Media? media;

  @override
  List<Object?> get props => [title, media];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrderDetails$Query$Order$PaymentGatewayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query$Order extends JsonSerializable with EquatableMixin {
  GetOrderDetails$Query$Order();

  factory GetOrderDetails$Query$Order.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$OrderFromJson(json);

  late List<GetOrderDetails$Query$Order$Point> points;

  late List<String> addresses;

  late double costAfterCoupon;

  late String currency;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? startTimestamp;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? finishTimestamp;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime expectedTimestamp;

  GetOrderDetails$Query$Order$Driver? driver;

  late GetOrderDetails$Query$Order$Service service;

  GetOrderDetails$Query$Order$PaymentGateway? paymentGateway;

  @override
  List<Object?> get props => [
        points,
        addresses,
        costAfterCoupon,
        currency,
        startTimestamp,
        finishTimestamp,
        expectedTimestamp,
        driver,
        service,
        paymentGateway
      ];
  @override
  Map<String, dynamic> toJson() => _$GetOrderDetails$Query$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetails$Query extends JsonSerializable with EquatableMixin {
  GetOrderDetails$Query();

  factory GetOrderDetails$Query.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetails$QueryFromJson(json);

  GetOrderDetails$Query$Order? order;

  @override
  List<Object?> get props => [order];
  @override
  Map<String, dynamic> toJson() => _$GetOrderDetails$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelBooking$Mutation$Order extends JsonSerializable
    with EquatableMixin {
  CancelBooking$Mutation$Order();

  factory CancelBooking$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$CancelBooking$Mutation$OrderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$CancelBooking$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelBooking$Mutation extends JsonSerializable with EquatableMixin {
  CancelBooking$Mutation();

  factory CancelBooking$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CancelBooking$MutationFromJson(json);

  late CancelBooking$Mutation$Order cancelBooking;

  @override
  List<Object?> get props => [cancelBooking];
  @override
  Map<String, dynamic> toJson() => _$CancelBooking$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitComplaint$Mutation$Complaint extends JsonSerializable
    with EquatableMixin {
  SubmitComplaint$Mutation$Complaint();

  factory SubmitComplaint$Mutation$Complaint.fromJson(
          Map<String, dynamic> json) =>
      _$SubmitComplaint$Mutation$ComplaintFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$SubmitComplaint$Mutation$ComplaintToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitComplaint$Mutation extends JsonSerializable with EquatableMixin {
  SubmitComplaint$Mutation();

  factory SubmitComplaint$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SubmitComplaint$MutationFromJson(json);

  late SubmitComplaint$Mutation$Complaint createOneComplaint;

  @override
  List<Object?> get props => [createOneComplaint];
  @override
  Map<String, dynamic> toJson() => _$SubmitComplaint$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderWallet extends JsonSerializable with EquatableMixin {
  Wallet$Query$RiderWallet();

  factory Wallet$Query$RiderWallet.fromJson(Map<String, dynamic> json) =>
      _$Wallet$Query$RiderWalletFromJson(json);

  late String id;

  late double balance;

  late String currency;

  @override
  List<Object?> get props => [id, balance, currency];
  @override
  Map<String, dynamic> toJson() => _$Wallet$Query$RiderWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
    extends JsonSerializable with EquatableMixin {
  Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion();

  factory Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionFromJson(
          json);

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime createdAt;

  late double amount;

  late String currency;

  String? refrenceNumber;

  @JsonKey(unknownEnumValue: RiderDeductTransactionType.artemisUnknown)
  RiderDeductTransactionType? deductType;

  @JsonKey(unknownEnumValue: TransactionAction.artemisUnknown)
  late TransactionAction action;

  @JsonKey(unknownEnumValue: RiderRechargeTransactionType.artemisUnknown)
  RiderRechargeTransactionType? rechargeType;

  @override
  List<Object?> get props => [
        createdAt,
        amount,
        currency,
        refrenceNumber,
        deductType,
        action,
        rechargeType
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderTransacionConnection$RiderTransacionEdge
    extends JsonSerializable with EquatableMixin {
  Wallet$Query$RiderTransacionConnection$RiderTransacionEdge();

  factory Wallet$Query$RiderTransacionConnection$RiderTransacionEdge.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeFromJson(
          json);

  late Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
      node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$RiderTransacionConnection extends JsonSerializable
    with EquatableMixin {
  Wallet$Query$RiderTransacionConnection();

  factory Wallet$Query$RiderTransacionConnection.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$RiderTransacionConnectionFromJson(json);

  late List<Wallet$Query$RiderTransacionConnection$RiderTransacionEdge> edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$RiderTransacionConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query extends JsonSerializable with EquatableMixin {
  Wallet$Query();

  factory Wallet$Query.fromJson(Map<String, dynamic> json) =>
      _$Wallet$QueryFromJson(json);

  late List<Wallet$Query$RiderWallet> riderWallets;

  late Wallet$Query$RiderTransacionConnection riderTransacions;

  @override
  List<Object?> get props => [riderWallets, riderTransacions];
  @override
  Map<String, dynamic> toJson() => _$Wallet$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentGateways$Query$PaymentGateway$Media extends JsonSerializable
    with EquatableMixin {
  PaymentGateways$Query$PaymentGateway$Media();

  factory PaymentGateways$Query$PaymentGateway$Media.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentGateways$Query$PaymentGateway$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$PaymentGateways$Query$PaymentGateway$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentGateways$Query$PaymentGateway extends JsonSerializable
    with EquatableMixin {
  PaymentGateways$Query$PaymentGateway();

  factory PaymentGateways$Query$PaymentGateway.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentGateways$Query$PaymentGatewayFromJson(json);

  late String id;

  late String title;

  @JsonKey(unknownEnumValue: PaymentGatewayType.artemisUnknown)
  late PaymentGatewayType type;

  String? publicKey;

  PaymentGateways$Query$PaymentGateway$Media? media;

  @override
  List<Object?> get props => [id, title, type, publicKey, media];
  @override
  Map<String, dynamic> toJson() =>
      _$PaymentGateways$Query$PaymentGatewayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentGateways$Query extends JsonSerializable with EquatableMixin {
  PaymentGateways$Query();

  factory PaymentGateways$Query.fromJson(Map<String, dynamic> json) =>
      _$PaymentGateways$QueryFromJson(json);

  late List<PaymentGateways$Query$PaymentGateway> paymentGateways;

  @override
  List<Object?> get props => [paymentGateways];
  @override
  Map<String, dynamic> toJson() => _$PaymentGateways$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PayForRide$Query$PaymentGateway$Media extends JsonSerializable
    with EquatableMixin {
  PayForRide$Query$PaymentGateway$Media();

  factory PayForRide$Query$PaymentGateway$Media.fromJson(
          Map<String, dynamic> json) =>
      _$PayForRide$Query$PaymentGateway$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$PayForRide$Query$PaymentGateway$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PayForRide$Query$PaymentGateway extends JsonSerializable
    with EquatableMixin {
  PayForRide$Query$PaymentGateway();

  factory PayForRide$Query$PaymentGateway.fromJson(Map<String, dynamic> json) =>
      _$PayForRide$Query$PaymentGatewayFromJson(json);

  late String id;

  late String title;

  @JsonKey(unknownEnumValue: PaymentGatewayType.artemisUnknown)
  late PaymentGatewayType type;

  String? publicKey;

  PayForRide$Query$PaymentGateway$Media? media;

  @override
  List<Object?> get props => [id, title, type, publicKey, media];
  @override
  Map<String, dynamic> toJson() =>
      _$PayForRide$Query$PaymentGatewayToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PayForRide$Query$RiderWallet extends JsonSerializable
    with EquatableMixin {
  PayForRide$Query$RiderWallet();

  factory PayForRide$Query$RiderWallet.fromJson(Map<String, dynamic> json) =>
      _$PayForRide$Query$RiderWalletFromJson(json);

  late String id;

  late double balance;

  late String currency;

  @override
  List<Object?> get props => [id, balance, currency];
  @override
  Map<String, dynamic> toJson() => _$PayForRide$Query$RiderWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PayForRide$Query extends JsonSerializable with EquatableMixin {
  PayForRide$Query();

  factory PayForRide$Query.fromJson(Map<String, dynamic> json) =>
      _$PayForRide$QueryFromJson(json);

  late List<PayForRide$Query$PaymentGateway> paymentGateways;

  late List<PayForRide$Query$RiderWallet> riderWallets;

  @override
  List<Object?> get props => [paymentGateways, riderWallets];
  @override
  Map<String, dynamic> toJson() => _$PayForRide$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PayRide$Mutation$TopUpWalletResponse extends JsonSerializable
    with EquatableMixin {
  PayRide$Mutation$TopUpWalletResponse();

  factory PayRide$Mutation$TopUpWalletResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PayRide$Mutation$TopUpWalletResponseFromJson(json);

  @JsonKey(unknownEnumValue: TopUpWalletStatus.artemisUnknown)
  late TopUpWalletStatus status;

  late String url;

  @override
  List<Object?> get props => [status, url];
  @override
  Map<String, dynamic> toJson() =>
      _$PayRide$Mutation$TopUpWalletResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PayRide$Mutation$Order extends JsonSerializable with EquatableMixin {
  PayRide$Mutation$Order();

  factory PayRide$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$PayRide$Mutation$OrderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$PayRide$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PayRide$Mutation extends JsonSerializable with EquatableMixin {
  PayRide$Mutation();

  factory PayRide$Mutation.fromJson(Map<String, dynamic> json) =>
      _$PayRide$MutationFromJson(json);

  late PayRide$Mutation$TopUpWalletResponse topUpWallet;

  late PayRide$Mutation$Order updateOneOrder;

  @override
  List<Object?> get props => [topUpWallet, updateOneOrder];
  @override
  Map<String, dynamic> toJson() => _$PayRide$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TopUpWalletInput extends JsonSerializable with EquatableMixin {
  TopUpWalletInput({
    required this.gatewayId,
    required this.amount,
    required this.currency,
    this.token,
    this.pin,
    this.otp,
    this.transactionId,
    this.orderNumber,
  });

  factory TopUpWalletInput.fromJson(Map<String, dynamic> json) =>
      _$TopUpWalletInputFromJson(json);

  late String gatewayId;

  late double amount;

  late String currency;

  String? token;

  double? pin;

  double? otp;

  String? transactionId;

  String? orderNumber;

  @override
  List<Object?> get props => [
        gatewayId,
        amount,
        currency,
        token,
        pin,
        otp,
        transactionId,
        orderNumber
      ];
  @override
  Map<String, dynamic> toJson() => _$TopUpWalletInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TopUpWallet$Mutation$TopUpWalletResponse extends JsonSerializable
    with EquatableMixin {
  TopUpWallet$Mutation$TopUpWalletResponse();

  factory TopUpWallet$Mutation$TopUpWalletResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TopUpWallet$Mutation$TopUpWalletResponseFromJson(json);

  @JsonKey(unknownEnumValue: TopUpWalletStatus.artemisUnknown)
  late TopUpWalletStatus status;

  late String url;

  @override
  List<Object?> get props => [status, url];
  @override
  Map<String, dynamic> toJson() =>
      _$TopUpWallet$Mutation$TopUpWalletResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TopUpWallet$Mutation extends JsonSerializable with EquatableMixin {
  TopUpWallet$Mutation();

  factory TopUpWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$TopUpWallet$MutationFromJson(json);

  late TopUpWallet$Mutation$TopUpWalletResponse topUpWallet;

  @override
  List<Object?> get props => [topUpWallet];
  @override
  Map<String, dynamic> toJson() => _$TopUpWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Rider$Media extends JsonSerializable
    with EquatableMixin {
  GetCurrentOrder$Query$Rider$Media();

  factory GetCurrentOrder$Query$Rider$Media.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Rider$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Rider$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Rider$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  GetCurrentOrder$Query$Rider$Order();

  factory GetCurrentOrder$Query$Rider$Order.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Rider$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Rider$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate
    extends JsonSerializable with EquatableMixin {
  GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate();

  factory GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregateFromJson(
          json);

  int? id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregateToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Rider$BookedOrders extends JsonSerializable
    with EquatableMixin {
  GetCurrentOrder$Query$Rider$BookedOrders();

  factory GetCurrentOrder$Query$Rider$BookedOrders.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Rider$BookedOrdersFromJson(json);

  GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate? count;

  @override
  List<Object?> get props => [count];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Rider$BookedOrdersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Rider extends JsonSerializable with EquatableMixin {
  GetCurrentOrder$Query$Rider();

  factory GetCurrentOrder$Query$Rider.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$RiderFromJson(json);

  late String id;

  late String mobileNumber;

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? email;

  GetCurrentOrder$Query$Rider$Media? media;

  late List<GetCurrentOrder$Query$Rider$Order> orders;

  late List<GetCurrentOrder$Query$Rider$BookedOrders> bookedOrders;

  @override
  List<Object?> get props => [
        id,
        mobileNumber,
        firstName,
        lastName,
        gender,
        email,
        media,
        orders,
        bookedOrders
      ];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrder$Query$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  GetCurrentOrder$Query$Point();

  factory GetCurrentOrder$Query$Point.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrder$Query$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query extends JsonSerializable with EquatableMixin {
  GetCurrentOrder$Query();

  factory GetCurrentOrder$Query.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrder$QueryFromJson(json);

  GetCurrentOrder$Query$Rider? rider;

  @JsonKey(unknownEnumValue: VersionStatus.artemisUnknown)
  late VersionStatus requireUpdate;

  GetCurrentOrder$Query$Point? getCurrentOrderDriverLocation;

  @override
  List<Object?> get props =>
      [rider, requireUpdate, getCurrentOrderDriverLocation];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrder$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  CurrentOrderMixin$Point();

  factory CurrentOrderMixin$Point.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$Media();

  factory CurrentOrderMixin$Driver$Media.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$CarModel();

  factory CurrentOrderMixin$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$CarColor extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$CarColor();

  factory CurrentOrderMixin$Driver$CarColor.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$CarColorFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Driver$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Driver();

  factory CurrentOrderMixin$Driver.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$DriverFromJson(json);

  String? firstName;

  String? lastName;

  CurrentOrderMixin$Driver$Media? media;

  late String mobileNumber;

  String? carPlate;

  CurrentOrderMixin$Driver$CarModel? car;

  CurrentOrderMixin$Driver$CarColor? carColor;

  int? rating;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        media,
        mobileNumber,
        carPlate,
        car,
        carColor,
        rating
      ];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Service$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Service$Media();

  factory CurrentOrderMixin$Service$Media.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Service extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Service();

  factory CurrentOrderMixin$Service.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$ServiceFromJson(json);

  late CurrentOrderMixin$Service$Media media;

  late String name;

  late int prepayPercent;

  late double cancellationTotalFee;

  @override
  List<Object?> get props => [media, name, prepayPercent, cancellationTotalFee];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  CreateOrder$Mutation$Order();

  factory CreateOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation$Rider extends JsonSerializable with EquatableMixin {
  CreateOrder$Mutation$Rider();

  factory CreateOrder$Mutation$Rider.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$Mutation$RiderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$Mutation$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation extends JsonSerializable with EquatableMixin {
  CreateOrder$Mutation();

  factory CreateOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$MutationFromJson(json);

  late CreateOrder$Mutation$Order createOrder;

  late CreateOrder$Mutation$Rider updateOneRider;

  @override
  List<Object?> get props => [createOrder, updateOneRider];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderInput extends JsonSerializable with EquatableMixin {
  CreateOrderInput({
    required this.serviceId,
    required this.intervalMinutes,
    required this.points,
    required this.addresses,
    this.twoWay,
    this.optionIds,
    this.couponCode,
  });

  factory CreateOrderInput.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderInputFromJson(json);

  late int serviceId;

  late int intervalMinutes;

  late List<PointInput> points;

  late List<String> addresses;

  bool? twoWay;

  List<String>? optionIds;

  String? couponCode;

  @override
  List<Object?> get props => [
        serviceId,
        intervalMinutes,
        points,
        addresses,
        twoWay,
        optionIds,
        couponCode
      ];
  @override
  Map<String, dynamic> toJson() => _$CreateOrderInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  CancelOrder$Mutation$Order();

  factory CancelOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$CancelOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$CancelOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelOrder$Mutation extends JsonSerializable with EquatableMixin {
  CancelOrder$Mutation();

  factory CancelOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CancelOrder$MutationFromJson(json);

  late CancelOrder$Mutation$Order cancelOrder;

  @override
  List<Object?> get props => [cancelOrder];
  @override
  Map<String, dynamic> toJson() => _$CancelOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  UpdateOrder$Mutation$Order();

  factory UpdateOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrder$Mutation extends JsonSerializable with EquatableMixin {
  UpdateOrder$Mutation();

  factory UpdateOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrder$MutationFromJson(json);

  late UpdateOrder$Mutation$Order updateOneOrder;

  @override
  List<Object?> get props => [updateOneOrder];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderInput extends JsonSerializable with EquatableMixin {
  UpdateOrderInput({
    this.waitMinutes,
    this.status,
    this.tipAmount,
    this.couponCode,
  });

  factory UpdateOrderInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderInputFromJson(json);

  int? waitMinutes;

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  OrderStatus? status;

  double? tipAmount;

  String? couponCode;

  @override
  List<Object?> get props => [waitMinutes, status, tipAmount, couponCode];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  UpdatedOrder$Subscription$Order$Point();

  factory UpdatedOrder$Subscription$Order$Point.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$Media extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$Media();

  factory UpdatedOrder$Subscription$Order$Driver$Media.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$CarModel();

  factory UpdatedOrder$Subscription$Order$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$CarColor extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$CarColor();

  factory UpdatedOrder$Subscription$Order$Driver$CarColor.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$CarColorFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver();

  factory UpdatedOrder$Subscription$Order$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$DriverFromJson(json);

  String? firstName;

  String? lastName;

  UpdatedOrder$Subscription$Order$Driver$Media? media;

  late String mobileNumber;

  String? carPlate;

  UpdatedOrder$Subscription$Order$Driver$CarModel? car;

  UpdatedOrder$Subscription$Order$Driver$CarColor? carColor;

  int? rating;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        media,
        mobileNumber,
        carPlate,
        car,
        carColor,
        rating
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Service$Media extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Service$Media();

  factory UpdatedOrder$Subscription$Order$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Service extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Service();

  factory UpdatedOrder$Subscription$Order$Service.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$ServiceFromJson(json);

  late UpdatedOrder$Subscription$Order$Service$Media media;

  late String name;

  late int prepayPercent;

  late double cancellationTotalFee;

  @override
  List<Object?> get props => [media, name, prepayPercent, cancellationTotalFee];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order();

  factory UpdatedOrder$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$OrderFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;

  late List<UpdatedOrder$Subscription$Order$Point> points;

  UpdatedOrder$Subscription$Order$Driver? driver;

  List<UpdatedOrder$Subscription$Order$Point>? directions;

  late UpdatedOrder$Subscription$Order$Service service;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;

  late double paidAmount;

  late double costAfterCoupon;

  late int durationBest;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? startTimestamp;

  late double costBest;

  late String currency;

  late List<String> addresses;

  late int waitMinutes;

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        directions,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        durationBest,
        startTimestamp,
        costBest,
        currency,
        addresses,
        waitMinutes
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription extends JsonSerializable with EquatableMixin {
  UpdatedOrder$Subscription();

  factory UpdatedOrder$Subscription.fromJson(Map<String, dynamic> json) =>
      _$UpdatedOrder$SubscriptionFromJson(json);

  late UpdatedOrder$Subscription$Order orderUpdated;

  @override
  List<Object?> get props => [orderUpdated];
  @override
  Map<String, dynamic> toJson() => _$UpdatedOrder$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdated$Subscription$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  DriverLocationUpdated$Subscription$Point();

  factory DriverLocationUpdated$Subscription$Point.fromJson(
          Map<String, dynamic> json) =>
      _$DriverLocationUpdated$Subscription$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$DriverLocationUpdated$Subscription$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdated$Subscription extends JsonSerializable
    with EquatableMixin {
  DriverLocationUpdated$Subscription();

  factory DriverLocationUpdated$Subscription.fromJson(
          Map<String, dynamic> json) =>
      _$DriverLocationUpdated$SubscriptionFromJson(json);

  late DriverLocationUpdated$Subscription$Point driverLocationUpdated;

  @override
  List<Object?> get props => [driverLocationUpdated];
  @override
  Map<String, dynamic> toJson() =>
      _$DriverLocationUpdated$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedback$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  SubmitFeedback$Mutation$Order();

  factory SubmitFeedback$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedback$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedback$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedback$Mutation extends JsonSerializable with EquatableMixin {
  SubmitFeedback$Mutation();

  factory SubmitFeedback$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedback$MutationFromJson(json);

  late SubmitFeedback$Mutation$Order submitReview;

  @override
  List<Object?> get props => [submitReview];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedback$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocation$Query$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  GetDriversLocation$Query$Point();

  factory GetDriversLocation$Query$Point.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocation$Query$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocation$Query$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocation$Query extends JsonSerializable with EquatableMixin {
  GetDriversLocation$Query();

  factory GetDriversLocation$Query.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocation$QueryFromJson(json);

  late List<GetDriversLocation$Query$Point> getDriversLocation;

  @override
  List<Object?> get props => [getDriversLocation];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocation$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReviewParameters$Query$FeedbackParameter extends JsonSerializable
    with EquatableMixin {
  GetReviewParameters$Query$FeedbackParameter();

  factory GetReviewParameters$Query$FeedbackParameter.fromJson(
          Map<String, dynamic> json) =>
      _$GetReviewParameters$Query$FeedbackParameterFromJson(json);

  late String id;

  late String title;

  late bool isGood;

  @override
  List<Object?> get props => [id, title, isGood];
  @override
  Map<String, dynamic> toJson() =>
      _$GetReviewParameters$Query$FeedbackParameterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReviewParameters$Query extends JsonSerializable with EquatableMixin {
  GetReviewParameters$Query();

  factory GetReviewParameters$Query.fromJson(Map<String, dynamic> json) =>
      _$GetReviewParameters$QueryFromJson(json);

  late List<GetReviewParameters$Query$FeedbackParameter> feedbackParameters;

  @override
  List<Object?> get props => [feedbackParameters];
  @override
  Map<String, dynamic> toJson() => _$GetReviewParameters$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$Point extends JsonSerializable
    with EquatableMixin {
  GetFare$Query$CalculateFareDTO$Point();

  factory GetFare$Query$CalculateFareDTO$Point.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$PointFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
    extends JsonSerializable with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaFromJson(
          json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
    extends JsonSerializable with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionFromJson(
          json);

  late String id;

  late String name;

  @JsonKey(unknownEnumValue: ServiceOptionType.artemisUnknown)
  late ServiceOptionType type;

  double? additionalFee;

  @JsonKey(unknownEnumValue: ServiceOptionIcon.artemisUnknown)
  late ServiceOptionIcon icon;

  @override
  List<Object?> get props => [id, name, type, additionalFee, icon];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory$Service
    extends JsonSerializable with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory$Service.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceFromJson(json);

  late String id;

  late String name;

  String? description;

  int? personCapacity;

  late int prepayPercent;

  late bool twoWayAvailable;

  late GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media media;

  late List<
          GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption>
      options;

  late double cost;

  double? costAfterCoupon;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        personCapacity,
        prepayPercent,
        twoWayAvailable,
        media,
        options,
        cost,
        costAfterCoupon
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory extends JsonSerializable
    with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategoryFromJson(json);

  late String id;

  late String name;

  late List<GetFare$Query$CalculateFareDTO$ServiceCategory$Service> services;

  @override
  List<Object?> get props => [id, name, services];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO extends JsonSerializable
    with EquatableMixin {
  GetFare$Query$CalculateFareDTO();

  factory GetFare$Query$CalculateFareDTO.fromJson(Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTOFromJson(json);

  late double distance;

  late double duration;

  late String currency;

  late List<GetFare$Query$CalculateFareDTO$Point> directions;

  late List<GetFare$Query$CalculateFareDTO$ServiceCategory> services;

  @JsonKey(unknownEnumValue: CalculateFareError.artemisUnknown)
  CalculateFareError? error;

  @override
  List<Object?> get props =>
      [distance, duration, currency, directions, services, error];
  @override
  Map<String, dynamic> toJson() => _$GetFare$Query$CalculateFareDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query extends JsonSerializable with EquatableMixin {
  GetFare$Query();

  factory GetFare$Query.fromJson(Map<String, dynamic> json) =>
      _$GetFare$QueryFromJson(json);

  late GetFare$Query$CalculateFareDTO getFare;

  @override
  List<Object?> get props => [getFare];
  @override
  Map<String, dynamic> toJson() => _$GetFare$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApplyCoupon$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  ApplyCoupon$Mutation$Order();

  factory ApplyCoupon$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$ApplyCoupon$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$ApplyCoupon$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApplyCoupon$Mutation extends JsonSerializable with EquatableMixin {
  ApplyCoupon$Mutation();

  factory ApplyCoupon$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ApplyCoupon$MutationFromJson(json);

  late ApplyCoupon$Mutation$Order applyCoupon;

  @override
  List<Object?> get props => [applyCoupon];
  @override
  Map<String, dynamic> toJson() => _$ApplyCoupon$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendSOS$Mutation$Sos extends JsonSerializable with EquatableMixin {
  SendSOS$Mutation$Sos();

  factory SendSOS$Mutation$Sos.fromJson(Map<String, dynamic> json) =>
      _$SendSOS$Mutation$SosFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$SendSOS$Mutation$SosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendSOS$Mutation extends JsonSerializable with EquatableMixin {
  SendSOS$Mutation();

  factory SendSOS$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SendSOS$MutationFromJson(json);

  late SendSOS$Mutation$Sos sosSignal;

  @override
  List<Object?> get props => [sosSignal];
  @override
  Map<String, dynamic> toJson() => _$SendSOS$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation$Login extends JsonSerializable with EquatableMixin {
  Login$Mutation$Login();

  factory Login$Mutation$Login.fromJson(Map<String, dynamic> json) =>
      _$Login$Mutation$LoginFromJson(json);

  late String jwtToken;

  @override
  List<Object?> get props => [jwtToken];
  @override
  Map<String, dynamic> toJson() => _$Login$Mutation$LoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation extends JsonSerializable with EquatableMixin {
  Login$Mutation();

  factory Login$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationFromJson(json);

  late Login$Mutation$Login login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

enum Gender {
  @JsonValue('Male')
  male,
  @JsonValue('Female')
  female,
  @JsonValue('Unknown')
  unknown,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum RiderAddressType {
  @JsonValue('Home')
  home,
  @JsonValue('Work')
  work,
  @JsonValue('Partner')
  partner,
  @JsonValue('Gym')
  gym,
  @JsonValue('Parent')
  parent,
  @JsonValue('Cafe')
  cafe,
  @JsonValue('Park')
  park,
  @JsonValue('Other')
  other,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum OrderStatus {
  @JsonValue('Requested')
  requested,
  @JsonValue('NotFound')
  notFound,
  @JsonValue('NoCloseFound')
  noCloseFound,
  @JsonValue('Found')
  found,
  @JsonValue('DriverAccepted')
  driverAccepted,
  @JsonValue('Arrived')
  arrived,
  @JsonValue('WaitingForPrePay')
  waitingForPrePay,
  @JsonValue('DriverCanceled')
  driverCanceled,
  @JsonValue('RiderCanceled')
  riderCanceled,
  @JsonValue('Started')
  started,
  @JsonValue('WaitingForPostPay')
  waitingForPostPay,
  @JsonValue('WaitingForReview')
  waitingForReview,
  @JsonValue('Finished')
  finished,
  @JsonValue('Booked')
  booked,
  @JsonValue('Expired')
  expired,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum RiderDeductTransactionType {
  @JsonValue('OrderFee')
  orderFee,
  @JsonValue('Withdraw')
  withdraw,
  @JsonValue('Correction')
  correction,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum TransactionAction {
  @JsonValue('Recharge')
  recharge,
  @JsonValue('Deduct')
  deduct,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum RiderRechargeTransactionType {
  @JsonValue('BankTransfer')
  bankTransfer,
  @JsonValue('Gift')
  gift,
  @JsonValue('Correction')
  correction,
  @JsonValue('InAppPayment')
  inAppPayment,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum PaymentGatewayType {
  @JsonValue('Stripe')
  stripe,
  @JsonValue('BrainTree')
  brainTree,
  @JsonValue('PayPal')
  payPal,
  @JsonValue('Paytm')
  paytm,
  @JsonValue('Razorpay')
  razorpay,
  @JsonValue('Paystack')
  paystack,
  @JsonValue('PayU')
  payU,
  @JsonValue('Instamojo')
  instamojo,
  @JsonValue('Flutterwave')
  flutterwave,
  @JsonValue('PayGate')
  payGate,
  @JsonValue('MIPS')
  mips,
  @JsonValue('MercadoPago')
  mercadoPago,
  @JsonValue('AmazonPaymentServices')
  amazonPaymentServices,
  @JsonValue('MyTMoney')
  myTMoney,
  @JsonValue('WayForPay')
  wayForPay,
  @JsonValue('MyFatoorah')
  myFatoorah,
  @JsonValue('SberBank')
  sberBank,
  @JsonValue('CustomLink')
  customLink,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum TopUpWalletStatus {
  @JsonValue('OK')
  ok,
  @JsonValue('Redirect')
  redirect,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum VersionStatus {
  @JsonValue('Latest')
  latest,
  @JsonValue('MandatoryUpdate')
  mandatoryUpdate,
  @JsonValue('OptionalUpdate')
  optionalUpdate,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum ServiceOptionType {
  @JsonValue('Free')
  free,
  @JsonValue('Paid')
  paid,
  @JsonValue('TwoWay')
  twoWay,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum ServiceOptionIcon {
  @JsonValue('Pet')
  pet,
  @JsonValue('TwoWay')
  twoWay,
  @JsonValue('Luggage')
  luggage,
  @JsonValue('PackageDelivery')
  packageDelivery,
  @JsonValue('Shopping')
  shopping,
  @JsonValue('Custom1')
  custom1,
  @JsonValue('Custom2')
  custom2,
  @JsonValue('Custom3')
  custom3,
  @JsonValue('Custom4')
  custom4,
  @JsonValue('Custom5')
  custom5,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum CalculateFareError {
  @JsonValue('RegionUnsupported')
  regionUnsupported,
  @JsonValue('NoServiceInRegion')
  noServiceInRegion,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

final GET_MESSAGES_QUERY_DOCUMENT_OPERATION_NAME = 'GetMessages';
final GET_MESSAGES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMessages'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'currentOrder'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rider'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'ChatRider'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'ChatDriver'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'conversations'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'sorting'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'field'),
                    value: EnumValueNode(name: NameNode(value: 'id')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'direction'),
                    value: EnumValueNode(name: NameNode(value: 'DESC')),
                  ),
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'ChatMessage'),
                directives: [],
              )
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'ChatRider'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Rider'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'firstName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'mobileNumber'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'media'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'ChatDriver'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Driver'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'firstName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'mobileNumber'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'media'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'ChatMessage'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'OrderMessage'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sentByDriver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetMessagesQuery
    extends GraphQLQuery<GetMessages$Query, JsonSerializable> {
  GetMessagesQuery();

  @override
  final DocumentNode document = GET_MESSAGES_QUERY_DOCUMENT;

  @override
  final String operationName = GET_MESSAGES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetMessages$Query parse(Map<String, dynamic> json) =>
      GetMessages$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SendMessageArguments extends JsonSerializable with EquatableMixin {
  SendMessageArguments({
    required this.requestId,
    required this.content,
  });

  @override
  factory SendMessageArguments.fromJson(Map<String, dynamic> json) =>
      _$SendMessageArgumentsFromJson(json);

  late String requestId;

  late String content;

  @override
  List<Object?> get props => [requestId, content];
  @override
  Map<String, dynamic> toJson() => _$SendMessageArgumentsToJson(this);
}

final SEND_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME = 'SendMessage';
final SEND_MESSAGE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SendMessage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'requestId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createOneOrderMessage'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'orderMessage'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'requestId'),
                    value: VariableNode(name: NameNode(value: 'requestId')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'content'),
                    value: VariableNode(name: NameNode(value: 'content')),
                  ),
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'ChatMessage'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'ChatMessage'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'OrderMessage'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sentByDriver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class SendMessageMutation
    extends GraphQLQuery<SendMessage$Mutation, SendMessageArguments> {
  SendMessageMutation({required this.variables});

  @override
  final DocumentNode document = SEND_MESSAGE_MUTATION_DOCUMENT;

  @override
  final String operationName = SEND_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SendMessageArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SendMessage$Mutation parse(Map<String, dynamic> json) =>
      SendMessage$Mutation.fromJson(json);
}

final NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME =
    'NewMessageReceived';
final NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'NewMessageReceived'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'newMessageReceived'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'ChatMessage'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'ChatMessage'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'OrderMessage'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sentByDriver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class NewMessageReceivedSubscription
    extends GraphQLQuery<NewMessageReceived$Subscription, JsonSerializable> {
  NewMessageReceivedSubscription();

  @override
  final DocumentNode document = NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  NewMessageReceived$Subscription parse(Map<String, dynamic> json) =>
      NewMessageReceived$Subscription.fromJson(json);
}

final RESERVATIONS_QUERY_DOCUMENT_OPERATION_NAME = 'Reservations';
final RESERVATIONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Reservations'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orders'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'filter'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'eq'),
                    value: EnumValueNode(name: NameNode(value: 'Booked')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'expectedTimestamp'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'addresses'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class ReservationsQuery
    extends GraphQLQuery<Reservations$Query, JsonSerializable> {
  ReservationsQuery();

  @override
  final DocumentNode document = RESERVATIONS_QUERY_DOCUMENT;

  @override
  final String operationName = RESERVATIONS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  Reservations$Query parse(Map<String, dynamic> json) =>
      Reservations$Query.fromJson(json);
}

final GET_ANNOUNCEMENTS_QUERY_DOCUMENT_OPERATION_NAME = 'GetAnnouncements';
final GET_ANNOUNCEMENTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAnnouncements'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'announcements'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'paging'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'startAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'description'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class GetAnnouncementsQuery
    extends GraphQLQuery<GetAnnouncements$Query, JsonSerializable> {
  GetAnnouncementsQuery();

  @override
  final DocumentNode document = GET_ANNOUNCEMENTS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_ANNOUNCEMENTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetAnnouncements$Query parse(Map<String, dynamic> json) =>
      GetAnnouncements$Query.fromJson(json);
}

final GET_RIDER_QUERY_DOCUMENT_OPERATION_NAME = 'GetRider';
final GET_RIDER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetRider'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'rider'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: IntValueNode(value: '1'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetRiderQuery extends GraphQLQuery<GetRider$Query, JsonSerializable> {
  GetRiderQuery();

  @override
  final DocumentNode document = GET_RIDER_QUERY_DOCUMENT;

  @override
  final String operationName = GET_RIDER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetRider$Query parse(Map<String, dynamic> json) =>
      GetRider$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileArguments extends JsonSerializable with EquatableMixin {
  UpdateProfileArguments({
    required this.firstName,
    required this.lastName,
    this.gender,
    this.email,
  });

  @override
  factory UpdateProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileArgumentsFromJson(json);

  late String firstName;

  late String lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  final Gender? gender;

  final String? email;

  @override
  List<Object?> get props => [firstName, lastName, gender, email];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfileArgumentsToJson(this);
}

final UPDATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME = 'UpdateProfile';
final UPDATE_PROFILE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firstName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lastName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'gender')),
        type: NamedTypeNode(
          name: NameNode(value: 'Gender'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneRider'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: StringValueNode(
                  value: '1',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'firstName'),
                    value: VariableNode(name: NameNode(value: 'firstName')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'lastName'),
                    value: VariableNode(name: NameNode(value: 'lastName')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'gender'),
                    value: VariableNode(name: NameNode(value: 'gender')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'email'),
                    value: VariableNode(name: NameNode(value: 'email')),
                  ),
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class UpdateProfileMutation
    extends GraphQLQuery<UpdateProfile$Mutation, UpdateProfileArguments> {
  UpdateProfileMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_PROFILE_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateProfile$Mutation parse(Map<String, dynamic> json) =>
      UpdateProfile$Mutation.fromJson(json);
}

final DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'DeleteUser';
final DELETE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteUser'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteUser'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class DeleteUserMutation
    extends GraphQLQuery<DeleteUser$Mutation, JsonSerializable> {
  DeleteUserMutation();

  @override
  final DocumentNode document = DELETE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  DeleteUser$Mutation parse(Map<String, dynamic> json) =>
      DeleteUser$Mutation.fromJson(json);
}

final GET_ADDRESSES_QUERY_DOCUMENT_OPERATION_NAME = 'GetAddresses';
final GET_ADDRESSES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAddresses'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'riderAddresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'lat'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lng'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetAddressesQuery
    extends GraphQLQuery<GetAddresses$Query, JsonSerializable> {
  GetAddressesQuery();

  @override
  final DocumentNode document = GET_ADDRESSES_QUERY_DOCUMENT;

  @override
  final String operationName = GET_ADDRESSES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetAddresses$Query parse(Map<String, dynamic> json) =>
      GetAddresses$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateAddressArguments extends JsonSerializable with EquatableMixin {
  CreateAddressArguments({required this.input});

  @override
  factory CreateAddressArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressArgumentsFromJson(json);

  late CreateRiderAddressInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateAddressArgumentsToJson(this);
}

final CREATE_ADDRESS_MUTATION_DOCUMENT_OPERATION_NAME = 'CreateAddress';
final CREATE_ADDRESS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateAddress'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateRiderAddressInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createOneRiderAddress'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'riderAddress'),
                value: VariableNode(name: NameNode(value: 'input')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class CreateAddressMutation
    extends GraphQLQuery<CreateAddress$Mutation, CreateAddressArguments> {
  CreateAddressMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_ADDRESS_MUTATION_DOCUMENT;

  @override
  final String operationName = CREATE_ADDRESS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateAddressArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateAddress$Mutation parse(Map<String, dynamic> json) =>
      CreateAddress$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateAddressArguments extends JsonSerializable with EquatableMixin {
  UpdateAddressArguments({
    required this.id,
    required this.update,
  });

  @override
  factory UpdateAddressArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressArgumentsFromJson(json);

  late String id;

  late CreateRiderAddressInput update;

  @override
  List<Object?> get props => [id, update];
  @override
  Map<String, dynamic> toJson() => _$UpdateAddressArgumentsToJson(this);
}

final UPDATE_ADDRESS_MUTATION_DOCUMENT_OPERATION_NAME = 'UpdateAddress';
final UPDATE_ADDRESS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateAddress'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'update')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateRiderAddressInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneRiderAddress'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: VariableNode(name: NameNode(value: 'update')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class UpdateAddressMutation
    extends GraphQLQuery<UpdateAddress$Mutation, UpdateAddressArguments> {
  UpdateAddressMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_ADDRESS_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_ADDRESS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateAddressArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateAddress$Mutation parse(Map<String, dynamic> json) =>
      UpdateAddress$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteAddressArguments extends JsonSerializable with EquatableMixin {
  DeleteAddressArguments({required this.id});

  @override
  factory DeleteAddressArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteAddressArgumentsToJson(this);
}

final DELETE_ADDRESS_MUTATION_DOCUMENT_OPERATION_NAME = 'DeleteAddress';
final DELETE_ADDRESS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteAddress'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteOneRiderAddress'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class DeleteAddressMutation
    extends GraphQLQuery<DeleteAddress$Mutation, DeleteAddressArguments> {
  DeleteAddressMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_ADDRESS_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_ADDRESS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeleteAddressArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteAddress$Mutation parse(Map<String, dynamic> json) =>
      DeleteAddress$Mutation.fromJson(json);
}

final GET_HISTORY_QUERY_DOCUMENT_OPERATION_NAME = 'GetHistory';
final GET_HISTORY_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetHistory'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orders'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'sorting'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'field'),
                value: EnumValueNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'direction'),
                value: EnumValueNode(name: NameNode(value: 'DESC')),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'paging'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '20'),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'historyOrderItem'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'historyOrderItem'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'OrderConnection'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'edges'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'node'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdOn'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'addresses'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currency'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'costAfterCoupon'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'service'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'media'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      )
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'pageInfo'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'hasNextPage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'endCursor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'startCursor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'hasPreviousPage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
]);

class GetHistoryQuery extends GraphQLQuery<GetHistory$Query, JsonSerializable> {
  GetHistoryQuery();

  @override
  final DocumentNode document = GET_HISTORY_QUERY_DOCUMENT;

  @override
  final String operationName = GET_HISTORY_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetHistory$Query parse(Map<String, dynamic> json) =>
      GetHistory$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetOrderDetailsArguments extends JsonSerializable with EquatableMixin {
  GetOrderDetailsArguments({required this.id});

  @override
  factory GetOrderDetailsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetailsArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetOrderDetailsArgumentsToJson(this);
}

final GET_ORDER_DETAILS_QUERY_DOCUMENT_OPERATION_NAME = 'GetOrderDetails';
final GET_ORDER_DETAILS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetOrderDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'points'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'Point'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'addresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'costAfterCoupon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'startTimestamp'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'finishTimestamp'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'expectedTimestamp'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'firstName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lastName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rating'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'carPlate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'media'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'car'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'media'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'paymentGateway'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'media'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetOrderDetailsQuery
    extends GraphQLQuery<GetOrderDetails$Query, GetOrderDetailsArguments> {
  GetOrderDetailsQuery({required this.variables});

  @override
  final DocumentNode document = GET_ORDER_DETAILS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_ORDER_DETAILS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetOrderDetailsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetOrderDetails$Query parse(Map<String, dynamic> json) =>
      GetOrderDetails$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CancelBookingArguments extends JsonSerializable with EquatableMixin {
  CancelBookingArguments({required this.id});

  @override
  factory CancelBookingArguments.fromJson(Map<String, dynamic> json) =>
      _$CancelBookingArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$CancelBookingArgumentsToJson(this);
}

final CANCEL_BOOKING_MUTATION_DOCUMENT_OPERATION_NAME = 'CancelBooking';
final CANCEL_BOOKING_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CancelBooking'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'cancelBooking'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class CancelBookingMutation
    extends GraphQLQuery<CancelBooking$Mutation, CancelBookingArguments> {
  CancelBookingMutation({required this.variables});

  @override
  final DocumentNode document = CANCEL_BOOKING_MUTATION_DOCUMENT;

  @override
  final String operationName = CANCEL_BOOKING_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CancelBookingArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CancelBooking$Mutation parse(Map<String, dynamic> json) =>
      CancelBooking$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SubmitComplaintArguments extends JsonSerializable with EquatableMixin {
  SubmitComplaintArguments({
    required this.id,
    required this.subject,
    required this.content,
  });

  @override
  factory SubmitComplaintArguments.fromJson(Map<String, dynamic> json) =>
      _$SubmitComplaintArgumentsFromJson(json);

  late String id;

  late String subject;

  late String content;

  @override
  List<Object?> get props => [id, subject, content];
  @override
  Map<String, dynamic> toJson() => _$SubmitComplaintArgumentsToJson(this);
}

final SUBMIT_COMPLAINT_MUTATION_DOCUMENT_OPERATION_NAME = 'SubmitComplaint';
final SUBMIT_COMPLAINT_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitComplaint'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'subject')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createOneComplaint'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'complaint'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'requestId'),
                    value: VariableNode(name: NameNode(value: 'id')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'requestedByDriver'),
                    value: BooleanValueNode(value: false),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'subject'),
                    value: VariableNode(name: NameNode(value: 'subject')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'content'),
                    value: VariableNode(name: NameNode(value: 'content')),
                  ),
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class SubmitComplaintMutation
    extends GraphQLQuery<SubmitComplaint$Mutation, SubmitComplaintArguments> {
  SubmitComplaintMutation({required this.variables});

  @override
  final DocumentNode document = SUBMIT_COMPLAINT_MUTATION_DOCUMENT;

  @override
  final String operationName =
      SUBMIT_COMPLAINT_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SubmitComplaintArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SubmitComplaint$Mutation parse(Map<String, dynamic> json) =>
      SubmitComplaint$Mutation.fromJson(json);
}

final WALLET_QUERY_DOCUMENT_OPERATION_NAME = 'Wallet';
final WALLET_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Wallet'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'riderWallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'riderTransacions'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'sorting'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'field'),
                value: EnumValueNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'direction'),
                value: EnumValueNode(name: NameNode(value: 'DESC')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'amount'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'currency'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'refrenceNumber'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'deductType'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'action'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'rechargeType'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              )
            ]),
          )
        ]),
      ),
    ]),
  )
]);

class WalletQuery extends GraphQLQuery<Wallet$Query, JsonSerializable> {
  WalletQuery();

  @override
  final DocumentNode document = WALLET_QUERY_DOCUMENT;

  @override
  final String operationName = WALLET_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  Wallet$Query parse(Map<String, dynamic> json) => Wallet$Query.fromJson(json);
}

final PAYMENT_GATEWAYS_QUERY_DOCUMENT_OPERATION_NAME = 'PaymentGateways';
final PAYMENT_GATEWAYS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'PaymentGateways'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'paymentGateways'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'publicKey'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class PaymentGatewaysQuery
    extends GraphQLQuery<PaymentGateways$Query, JsonSerializable> {
  PaymentGatewaysQuery();

  @override
  final DocumentNode document = PAYMENT_GATEWAYS_QUERY_DOCUMENT;

  @override
  final String operationName = PAYMENT_GATEWAYS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  PaymentGateways$Query parse(Map<String, dynamic> json) =>
      PaymentGateways$Query.fromJson(json);
}

final PAY_FOR_RIDE_QUERY_DOCUMENT_OPERATION_NAME = 'PayForRide';
final PAY_FOR_RIDE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'PayForRide'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'paymentGateways'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'publicKey'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'riderWallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  )
]);

class PayForRideQuery extends GraphQLQuery<PayForRide$Query, JsonSerializable> {
  PayForRideQuery();

  @override
  final DocumentNode document = PAY_FOR_RIDE_QUERY_DOCUMENT;

  @override
  final String operationName = PAY_FOR_RIDE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  PayForRide$Query parse(Map<String, dynamic> json) =>
      PayForRide$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class PayRideArguments extends JsonSerializable with EquatableMixin {
  PayRideArguments({
    required this.input,
    required this.orderId,
    this.tipAmount,
    required this.shouldPreauth,
  });

  @override
  factory PayRideArguments.fromJson(Map<String, dynamic> json) =>
      _$PayRideArgumentsFromJson(json);

  late TopUpWalletInput input;

  late String orderId;

  final double? tipAmount;

  late bool shouldPreauth;

  @override
  List<Object?> get props => [input, orderId, tipAmount, shouldPreauth];
  @override
  Map<String, dynamic> toJson() => _$PayRideArgumentsToJson(this);
}

final PAY_RIDE_MUTATION_DOCUMENT_OPERATION_NAME = 'PayRide';
final PAY_RIDE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'PayRide'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'TopUpWalletInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'tipAmount')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'shouldPreauth')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'topUpWallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
          ArgumentNode(
            name: NameNode(value: 'shouldPreauth'),
            value: VariableNode(name: NameNode(value: 'shouldPreauth')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'updateOneOrder'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'orderId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'tipAmount'),
                    value: VariableNode(name: NameNode(value: 'tipAmount')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  )
]);

class PayRideMutation extends GraphQLQuery<PayRide$Mutation, PayRideArguments> {
  PayRideMutation({required this.variables});

  @override
  final DocumentNode document = PAY_RIDE_MUTATION_DOCUMENT;

  @override
  final String operationName = PAY_RIDE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final PayRideArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  PayRide$Mutation parse(Map<String, dynamic> json) =>
      PayRide$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class TopUpWalletArguments extends JsonSerializable with EquatableMixin {
  TopUpWalletArguments({required this.input});

  @override
  factory TopUpWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$TopUpWalletArgumentsFromJson(json);

  late TopUpWalletInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$TopUpWalletArgumentsToJson(this);
}

final TOP_UP_WALLET_MUTATION_DOCUMENT_OPERATION_NAME = 'TopUpWallet';
final TOP_UP_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'TopUpWallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'TopUpWalletInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'topUpWallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class TopUpWalletMutation
    extends GraphQLQuery<TopUpWallet$Mutation, TopUpWalletArguments> {
  TopUpWalletMutation({required this.variables});

  @override
  final DocumentNode document = TOP_UP_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName = TOP_UP_WALLET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final TopUpWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  TopUpWallet$Mutation parse(Map<String, dynamic> json) =>
      TopUpWallet$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrderArguments extends JsonSerializable with EquatableMixin {
  GetCurrentOrderArguments({required this.versionCode});

  @override
  factory GetCurrentOrderArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrderArgumentsFromJson(json);

  late int versionCode;

  @override
  List<Object?> get props => [versionCode];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrderArgumentsToJson(this);
}

final GET_CURRENT_ORDER_QUERY_DOCUMENT_OPERATION_NAME = 'GetCurrentOrder';
final GET_CURRENT_ORDER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCurrentOrder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'versionCode')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'rider'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: StringValueNode(
              value: '1',
              isBlock: false,
            ),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'orders'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'in'),
                        value: ListValueNode(values: [
                          EnumValueNode(name: NameNode(value: 'Requested')),
                          EnumValueNode(name: NameNode(value: 'Found')),
                          EnumValueNode(name: NameNode(value: 'NotFound')),
                          EnumValueNode(name: NameNode(value: 'NoCloseFound')),
                          EnumValueNode(
                              name: NameNode(value: 'DriverAccepted')),
                          EnumValueNode(name: NameNode(value: 'Arrived')),
                          EnumValueNode(name: NameNode(value: 'Started')),
                          EnumValueNode(
                              name: NameNode(value: 'WaitingForReview')),
                          EnumValueNode(
                              name: NameNode(value: 'WaitingForPostPay')),
                          EnumValueNode(
                              name: NameNode(value: 'WaitingForPrePay')),
                        ]),
                      )
                    ]),
                  )
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'CurrentOrder'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'ordersAggregate'),
            alias: NameNode(value: 'bookedOrders'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'eq'),
                        value: EnumValueNode(name: NameNode(value: 'Booked')),
                      )
                    ]),
                  )
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'count'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              )
            ]),
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'requireUpdate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'versionCode'),
            value: VariableNode(name: NameNode(value: 'versionCode')),
          )
        ],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'getCurrentOrderDriverLocation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carColor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'prepayPercent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetCurrentOrderQuery
    extends GraphQLQuery<GetCurrentOrder$Query, GetCurrentOrderArguments> {
  GetCurrentOrderQuery({required this.variables});

  @override
  final DocumentNode document = GET_CURRENT_ORDER_QUERY_DOCUMENT;

  @override
  final String operationName = GET_CURRENT_ORDER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetCurrentOrderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetCurrentOrder$Query parse(Map<String, dynamic> json) =>
      GetCurrentOrder$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderArguments extends JsonSerializable with EquatableMixin {
  CreateOrderArguments({
    required this.input,
    required this.notificationPlayerId,
  });

  @override
  factory CreateOrderArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderArgumentsFromJson(json);

  late CreateOrderInput input;

  late String notificationPlayerId;

  @override
  List<Object?> get props => [input, notificationPlayerId];
  @override
  Map<String, dynamic> toJson() => _$CreateOrderArgumentsToJson(this);
}

final CREATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME = 'CreateOrder';
final CREATE_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateOrder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateOrderInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'notificationPlayerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createOrder'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'updateOneRider'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: StringValueNode(
                  value: '1',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'notificationPlayerId'),
                    value: VariableNode(
                        name: NameNode(value: 'notificationPlayerId')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carColor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'prepayPercent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class CreateOrderMutation
    extends GraphQLQuery<CreateOrder$Mutation, CreateOrderArguments> {
  CreateOrderMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = CREATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateOrderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateOrder$Mutation parse(Map<String, dynamic> json) =>
      CreateOrder$Mutation.fromJson(json);
}

final CANCEL_ORDER_MUTATION_DOCUMENT_OPERATION_NAME = 'CancelOrder';
final CANCEL_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CancelOrder'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'cancelOrder'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carColor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'prepayPercent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class CancelOrderMutation
    extends GraphQLQuery<CancelOrder$Mutation, JsonSerializable> {
  CancelOrderMutation();

  @override
  final DocumentNode document = CANCEL_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = CANCEL_ORDER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  CancelOrder$Mutation parse(Map<String, dynamic> json) =>
      CancelOrder$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderArguments extends JsonSerializable with EquatableMixin {
  UpdateOrderArguments({
    required this.id,
    required this.update,
  });

  @override
  factory UpdateOrderArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderArgumentsFromJson(json);

  late String id;

  late UpdateOrderInput update;

  @override
  List<Object?> get props => [id, update];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderArgumentsToJson(this);
}

final UPDATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME = 'updateOrder';
final UPDATE_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateOrder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'update')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateOrderInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneOrder'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: VariableNode(name: NameNode(value: 'update')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carColor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'prepayPercent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class UpdateOrderMutation
    extends GraphQLQuery<UpdateOrder$Mutation, UpdateOrderArguments> {
  UpdateOrderMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateOrderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateOrder$Mutation parse(Map<String, dynamic> json) =>
      UpdateOrder$Mutation.fromJson(json);
}

final UPDATED_ORDER_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'UpdatedOrder';
final UPDATED_ORDER_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'UpdatedOrder'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orderUpdated'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'points'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'Point'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'firstName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lastName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'media'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'mobileNumber'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'carPlate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'car'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'carColor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'rating'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'directions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'Point'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'media'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'prepayPercent'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cancellationTotalFee'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'etaPickup'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'paidAmount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'costAfterCoupon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'durationBest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'startTimestamp'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'costBest'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'addresses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'waitMinutes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class UpdatedOrderSubscription
    extends GraphQLQuery<UpdatedOrder$Subscription, JsonSerializable> {
  UpdatedOrderSubscription();

  @override
  final DocumentNode document = UPDATED_ORDER_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      UPDATED_ORDER_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  UpdatedOrder$Subscription parse(Map<String, dynamic> json) =>
      UpdatedOrder$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdatedArguments extends JsonSerializable
    with EquatableMixin {
  DriverLocationUpdatedArguments({required this.driverId});

  @override
  factory DriverLocationUpdatedArguments.fromJson(Map<String, dynamic> json) =>
      _$DriverLocationUpdatedArgumentsFromJson(json);

  late String driverId;

  @override
  List<Object?> get props => [driverId];
  @override
  Map<String, dynamic> toJson() => _$DriverLocationUpdatedArgumentsToJson(this);
}

final DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME =
    'DriverLocationUpdated';
final DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'DriverLocationUpdated'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'driverLocationUpdated'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'driverId'),
            value: VariableNode(name: NameNode(value: 'driverId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class DriverLocationUpdatedSubscription extends GraphQLQuery<
    DriverLocationUpdated$Subscription, DriverLocationUpdatedArguments> {
  DriverLocationUpdatedSubscription({required this.variables});

  @override
  final DocumentNode document = DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  final DriverLocationUpdatedArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DriverLocationUpdated$Subscription parse(Map<String, dynamic> json) =>
      DriverLocationUpdated$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedbackArguments extends JsonSerializable with EquatableMixin {
  SubmitFeedbackArguments({
    required this.score,
    required this.description,
    required this.orderId,
    required this.parameterIds,
  });

  @override
  factory SubmitFeedbackArguments.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedbackArgumentsFromJson(json);

  late int score;

  late String description;

  late String orderId;

  late List<String> parameterIds;

  @override
  List<Object?> get props => [score, description, orderId, parameterIds];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedbackArgumentsToJson(this);
}

final SUBMIT_FEEDBACK_MUTATION_DOCUMENT_OPERATION_NAME = 'SubmitFeedback';
final SUBMIT_FEEDBACK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitFeedback'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'score')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'description')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'parameterIds')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ID'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'submitReview'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'review'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'score'),
                value: VariableNode(name: NameNode(value: 'score')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'description'),
                value: VariableNode(name: NameNode(value: 'description')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'requestId'),
                value: VariableNode(name: NameNode(value: 'orderId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'parameterIds'),
                value: VariableNode(name: NameNode(value: 'parameterIds')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carColor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'prepayPercent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class SubmitFeedbackMutation
    extends GraphQLQuery<SubmitFeedback$Mutation, SubmitFeedbackArguments> {
  SubmitFeedbackMutation({required this.variables});

  @override
  final DocumentNode document = SUBMIT_FEEDBACK_MUTATION_DOCUMENT;

  @override
  final String operationName = SUBMIT_FEEDBACK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SubmitFeedbackArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SubmitFeedback$Mutation parse(Map<String, dynamic> json) =>
      SubmitFeedback$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocationArguments extends JsonSerializable with EquatableMixin {
  GetDriversLocationArguments({this.point});

  @override
  factory GetDriversLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocationArgumentsFromJson(json);

  final PointInput? point;

  @override
  List<Object?> get props => [point];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocationArgumentsToJson(this);
}

final GET_DRIVERS_LOCATION_QUERY_DOCUMENT_OPERATION_NAME = 'GetDriversLocation';
final GET_DRIVERS_LOCATION_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetDriversLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'point')),
        type: NamedTypeNode(
          name: NameNode(value: 'PointInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getDriversLocation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'center'),
            value: VariableNode(name: NameNode(value: 'point')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetDriversLocationQuery extends GraphQLQuery<GetDriversLocation$Query,
    GetDriversLocationArguments> {
  GetDriversLocationQuery({required this.variables});

  @override
  final DocumentNode document = GET_DRIVERS_LOCATION_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_DRIVERS_LOCATION_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetDriversLocationArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetDriversLocation$Query parse(Map<String, dynamic> json) =>
      GetDriversLocation$Query.fromJson(json);
}

final GET_REVIEW_PARAMETERS_QUERY_DOCUMENT_OPERATION_NAME =
    'GetReviewParameters';
final GET_REVIEW_PARAMETERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetReviewParameters'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'feedbackParameters'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'isGood'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetReviewParametersQuery
    extends GraphQLQuery<GetReviewParameters$Query, JsonSerializable> {
  GetReviewParametersQuery();

  @override
  final DocumentNode document = GET_REVIEW_PARAMETERS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_REVIEW_PARAMETERS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetReviewParameters$Query parse(Map<String, dynamic> json) =>
      GetReviewParameters$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetFareArguments extends JsonSerializable with EquatableMixin {
  GetFareArguments({
    required this.points,
    this.couponCode,
    this.selectedOptionIds,
  });

  @override
  factory GetFareArguments.fromJson(Map<String, dynamic> json) =>
      _$GetFareArgumentsFromJson(json);

  late List<PointInput> points;

  final String? couponCode;

  final List<String>? selectedOptionIds;

  @override
  List<Object?> get props => [points, couponCode, selectedOptionIds];
  @override
  Map<String, dynamic> toJson() => _$GetFareArgumentsToJson(this);
}

final GET_FARE_QUERY_DOCUMENT_OPERATION_NAME = 'GetFare';
final GET_FARE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetFare'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'points')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'PointInput'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'couponCode')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'selectedOptionIds')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getFare'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'points'),
                value: VariableNode(name: NameNode(value: 'points')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'couponCode'),
                value: VariableNode(name: NameNode(value: 'couponCode')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'selectedOptionIds'),
                value: VariableNode(name: NameNode(value: 'selectedOptionIds')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'duration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'directions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'lat'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lng'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'services'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'services'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'description'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'personCapacity'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'prepayPercent'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'twoWayAvailable'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'media'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'address'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      )
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'options'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'type'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'additionalFee'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'icon'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'cost'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'costAfterCoupon'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'error'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetFareQuery extends GraphQLQuery<GetFare$Query, GetFareArguments> {
  GetFareQuery({required this.variables});

  @override
  final DocumentNode document = GET_FARE_QUERY_DOCUMENT;

  @override
  final String operationName = GET_FARE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetFareArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetFare$Query parse(Map<String, dynamic> json) =>
      GetFare$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ApplyCouponArguments extends JsonSerializable with EquatableMixin {
  ApplyCouponArguments({required this.code});

  @override
  factory ApplyCouponArguments.fromJson(Map<String, dynamic> json) =>
      _$ApplyCouponArgumentsFromJson(json);

  late String code;

  @override
  List<Object?> get props => [code];
  @override
  Map<String, dynamic> toJson() => _$ApplyCouponArgumentsToJson(this);
}

final APPLY_COUPON_MUTATION_DOCUMENT_OPERATION_NAME = 'ApplyCoupon';
final APPLY_COUPON_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ApplyCoupon'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'code')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'applyCoupon'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'code'),
            value: VariableNode(name: NameNode(value: 'code')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carColor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'prepayPercent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class ApplyCouponMutation
    extends GraphQLQuery<ApplyCoupon$Mutation, ApplyCouponArguments> {
  ApplyCouponMutation({required this.variables});

  @override
  final DocumentNode document = APPLY_COUPON_MUTATION_DOCUMENT;

  @override
  final String operationName = APPLY_COUPON_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ApplyCouponArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ApplyCoupon$Mutation parse(Map<String, dynamic> json) =>
      ApplyCoupon$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SendSOSArguments extends JsonSerializable with EquatableMixin {
  SendSOSArguments({
    required this.orderId,
    this.location,
  });

  @override
  factory SendSOSArguments.fromJson(Map<String, dynamic> json) =>
      _$SendSOSArgumentsFromJson(json);

  late String orderId;

  final PointInput? location;

  @override
  List<Object?> get props => [orderId, location];
  @override
  Map<String, dynamic> toJson() => _$SendSOSArgumentsToJson(this);
}

final SEND_S_O_S_MUTATION_DOCUMENT_OPERATION_NAME = 'SendSOS';
final SEND_S_O_S_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SendSOS'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'location')),
        type: NamedTypeNode(
          name: NameNode(value: 'PointInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'sosSignal'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'orderId'),
            value: VariableNode(name: NameNode(value: 'orderId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'location'),
            value: VariableNode(name: NameNode(value: 'location')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class SendSOSMutation extends GraphQLQuery<SendSOS$Mutation, SendSOSArguments> {
  SendSOSMutation({required this.variables});

  @override
  final DocumentNode document = SEND_S_O_S_MUTATION_DOCUMENT;

  @override
  final String operationName = SEND_S_O_S_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SendSOSArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SendSOS$Mutation parse(Map<String, dynamic> json) =>
      SendSOS$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LoginArguments extends JsonSerializable with EquatableMixin {
  LoginArguments({required this.firebaseToken});

  @override
  factory LoginArguments.fromJson(Map<String, dynamic> json) =>
      _$LoginArgumentsFromJson(json);

  late String firebaseToken;

  @override
  List<Object?> get props => [firebaseToken];
  @override
  Map<String, dynamic> toJson() => _$LoginArgumentsToJson(this);
}

final LOGIN_MUTATION_DOCUMENT_OPERATION_NAME = 'Login';
final LOGIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Login'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firebaseToken')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'firebaseToken'),
                value: VariableNode(name: NameNode(value: 'firebaseToken')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'jwtToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class LoginMutation extends GraphQLQuery<Login$Mutation, LoginArguments> {
  LoginMutation({required this.variables});

  @override
  final DocumentNode document = LOGIN_MUTATION_DOCUMENT;

  @override
  final String operationName = LOGIN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final LoginArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Login$Mutation parse(Map<String, dynamic> json) =>
      Login$Mutation.fromJson(json);
}
