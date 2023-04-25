// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import '../scalars/timestamp.dart';
import '../scalars/datetime.dart';
import '../scalars/connection_cursor.dart';
part 'graphql_api.graphql.g.dart';

mixin ChatRiderMixin {
  late String id;
  String? firstName;
  String? lastName;
  ChatRiderMixin$Media? media;
}
mixin ChatDriverMixin {
  late String id;
  String? firstName;
  String? lastName;
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
mixin BasicProfileMixin {
  late String mobileNumber;
  String? firstName;
  String? lastName;
  int? searchDistance;
  BasicProfileMixin$Media? media;
  String? softRejectionNote;
  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  late DriverStatus status;
  late List<BasicProfileMixin$Order> currentOrders;
  late List<BasicProfileMixin$DriverWallet> wallets;
  late bool isWalletHidden;
}
mixin CurrentOrderMixin {
  late String id;
  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime createdOn;
  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime expectedTimestamp;
  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;
  late String currency;
  late double costBest;
  late double costAfterCoupon;
  late double paidAmount;
  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;
  late double tipAmount;
  List<CurrentOrderMixin$Point>? directions;
  late List<CurrentOrderMixin$Point> points;
  late CurrentOrderMixin$Service service;
  late List<CurrentOrderMixin$ServiceOption> options;
  late List<String> addresses;
  late CurrentOrderMixin$Rider rider;
}
mixin AvailableOrderMixin {
  late String id;
  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;
  late String currency;
  late double costBest;
  late List<String> addresses;
  late int distanceBest;
  late int durationBest;
  List<AvailableOrderMixin$Point>? directions;
  late List<AvailableOrderMixin$ServiceOption> options;
  late AvailableOrderMixin$Service service;
  late List<AvailableOrderMixin$Point> points;
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Driver$Order$Rider extends JsonSerializable
    with EquatableMixin, ChatRiderMixin {
  GetMessages$Query$Driver$Order$Rider();

  factory GetMessages$Query$Driver$Order$Rider.fromJson(
          Map<String, dynamic> json) =>
      _$GetMessages$Query$Driver$Order$RiderFromJson(json);

  late String mobileNumber;

  @override
  List<Object?> get props => [id, firstName, lastName, media, mobileNumber];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMessages$Query$Driver$Order$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Driver$Order$Driver extends JsonSerializable
    with EquatableMixin, ChatDriverMixin {
  GetMessages$Query$Driver$Order$Driver();

  factory GetMessages$Query$Driver$Order$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$GetMessages$Query$Driver$Order$DriverFromJson(json);

  @override
  List<Object?> get props => [id, firstName, lastName, media];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMessages$Query$Driver$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Driver$Order$OrderMessage extends JsonSerializable
    with EquatableMixin, ChatMessageMixin {
  GetMessages$Query$Driver$Order$OrderMessage();

  factory GetMessages$Query$Driver$Order$OrderMessage.fromJson(
          Map<String, dynamic> json) =>
      _$GetMessages$Query$Driver$Order$OrderMessageFromJson(json);

  @override
  List<Object?> get props => [id, content, sentByDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$GetMessages$Query$Driver$Order$OrderMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Driver$Order extends JsonSerializable
    with EquatableMixin {
  GetMessages$Query$Driver$Order();

  factory GetMessages$Query$Driver$Order.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$Driver$OrderFromJson(json);

  late String id;

  late GetMessages$Query$Driver$Order$Rider rider;

  late GetMessages$Query$Driver$Order$Driver driver;

  late List<GetMessages$Query$Driver$Order$OrderMessage> conversations;

  @override
  List<Object?> get props => [id, rider, driver, conversations];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$Driver$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Driver extends JsonSerializable with EquatableMixin {
  GetMessages$Query$Driver();

  factory GetMessages$Query$Driver.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$DriverFromJson(json);

  late List<GetMessages$Query$Driver$Order> currentOrders;

  @override
  List<Object?> get props => [currentOrders];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query extends JsonSerializable with EquatableMixin {
  GetMessages$Query();

  factory GetMessages$Query.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$QueryFromJson(json);

  GetMessages$Query$Driver? driver;

  @override
  List<Object?> get props => [driver];
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
class History$Query$OrderConnection extends JsonSerializable
    with EquatableMixin, HistoryOrderItemMixin {
  History$Query$OrderConnection();

  factory History$Query$OrderConnection.fromJson(Map<String, dynamic> json) =>
      _$History$Query$OrderConnectionFromJson(json);

  @override
  List<Object?> get props => [edges, pageInfo];
  @override
  Map<String, dynamic> toJson() => _$History$Query$OrderConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class History$Query extends JsonSerializable with EquatableMixin {
  History$Query();

  factory History$Query.fromJson(Map<String, dynamic> json) =>
      _$History$QueryFromJson(json);

  late History$Query$OrderConnection orders;

  @override
  List<Object?> get props => [orders];
  @override
  Map<String, dynamic> toJson() => _$History$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HistoryOrderItemMixin$OrderEdge$Order$Service extends JsonSerializable
    with EquatableMixin {
  HistoryOrderItemMixin$OrderEdge$Order$Service();

  factory HistoryOrderItemMixin$OrderEdge$Order$Service.fromJson(
          Map<String, dynamic> json) =>
      _$HistoryOrderItemMixin$OrderEdge$Order$ServiceFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
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

  late String currency;

  late double costAfterCoupon;

  late double providerShare;

  late HistoryOrderItemMixin$OrderEdge$Order$Service service;

  @override
  List<Object?> get props => [
        id,
        status,
        createdOn,
        currency,
        costAfterCoupon,
        providerShare,
        service
      ];
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
class GetOrderDetails$Query$Order extends JsonSerializable with EquatableMixin {
  GetOrderDetails$Query$Order();

  factory GetOrderDetails$Query$Order.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetails$Query$OrderFromJson(json);

  late List<GetOrderDetails$Query$Order$Point> points;

  late List<String> addresses;

  late double costBest;

  late String currency;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? startTimestamp;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? finishTimestamp;

  late int distanceBest;

  late int durationBest;

  double? paymentGatewayId;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime expectedTimestamp;

  @override
  List<Object?> get props => [
        points,
        addresses,
        costBest,
        currency,
        startTimestamp,
        finishTimestamp,
        distanceBest,
        durationBest,
        paymentGatewayId,
        expectedTimestamp
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
class Announcements$Query$Announcement extends JsonSerializable
    with EquatableMixin {
  Announcements$Query$Announcement();

  factory Announcements$Query$Announcement.fromJson(
          Map<String, dynamic> json) =>
      _$Announcements$Query$AnnouncementFromJson(json);

  late String title;

  late String description;

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime startAt;

  String? url;

  @override
  List<Object?> get props => [title, description, startAt, url];
  @override
  Map<String, dynamic> toJson() =>
      _$Announcements$Query$AnnouncementToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Announcements$Query extends JsonSerializable with EquatableMixin {
  Announcements$Query();

  factory Announcements$Query.fromJson(Map<String, dynamic> json) =>
      _$Announcements$QueryFromJson(json);

  late List<Announcements$Query$Announcement> announcements;

  @override
  List<Object?> get props => [announcements];
  @override
  Map<String, dynamic> toJson() => _$Announcements$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation$Driver extends JsonSerializable
    with EquatableMixin {
  UpdateProfile$Mutation$Driver();

  factory UpdateProfile$Mutation$Driver.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation extends JsonSerializable with EquatableMixin {
  UpdateProfile$Mutation();

  factory UpdateProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$MutationFromJson(json);

  late UpdateProfile$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverInput extends JsonSerializable with EquatableMixin {
  UpdateDriverInput({
    this.carProductionYear,
    this.carModelId,
    this.carId,
    this.carColorId,
    this.searchDistance,
    this.firstName,
    this.lastName,
    this.status,
    this.certificateNumber,
    this.email,
    this.carPlate,
    this.mediaId,
    this.gender,
    this.accountNumber,
    this.bankName,
    this.bankRoutingNumber,
    this.bankSwift,
    this.address,
    this.notificationPlayerId,
  });

  factory UpdateDriverInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverInputFromJson(json);

  int? carProductionYear;

  String? carModelId;

  String? carId;

  String? carColorId;

  int? searchDistance;

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  DriverStatus? status;

  String? certificateNumber;

  String? email;

  String? carPlate;

  double? mediaId;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? accountNumber;

  String? bankName;

  String? bankRoutingNumber;

  String? bankSwift;

  String? address;

  String? notificationPlayerId;

  @override
  List<Object?> get props => [
        carProductionYear,
        carModelId,
        carId,
        carColorId,
        searchDistance,
        firstName,
        lastName,
        status,
        certificateNumber,
        email,
        carPlate,
        mediaId,
        gender,
        accountNumber,
        bankName,
        bankRoutingNumber,
        bankSwift,
        address,
        notificationPlayerId
      ];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$Driver$Media extends JsonSerializable
    with EquatableMixin {
  GetDriver$Query$Driver$Media();

  factory GetDriver$Query$Driver$Media.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$Driver$MediaFromJson(json);

  late String id;

  late String address;

  @override
  List<Object?> get props => [id, address];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$Driver extends JsonSerializable with EquatableMixin {
  GetDriver$Query$Driver();

  factory GetDriver$Query$Driver.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$DriverFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  late DriverStatus status;

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? email;

  late String mobileNumber;

  String? accountNumber;

  String? bankName;

  String? bankRoutingNumber;

  String? address;

  late List<GetDriver$Query$Driver$Media> documents;

  String? bankSwift;

  GetDriver$Query$Driver$Media? media;

  String? carPlate;

  int? carProductionYear;

  String? certificateNumber;

  String? carColorId;

  String? carId;

  @override
  List<Object?> get props => [
        id,
        status,
        firstName,
        lastName,
        gender,
        email,
        mobileNumber,
        accountNumber,
        bankName,
        bankRoutingNumber,
        address,
        documents,
        bankSwift,
        media,
        carPlate,
        carProductionYear,
        certificateNumber,
        carColorId,
        carId
      ];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$CarModel extends JsonSerializable with EquatableMixin {
  GetDriver$Query$CarModel();

  factory GetDriver$Query$CarModel.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$CarModelFromJson(json);

  late String id;

  late String name;

  @override
  List<Object?> get props => [id, name];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$CarColor extends JsonSerializable with EquatableMixin {
  GetDriver$Query$CarColor();

  factory GetDriver$Query$CarColor.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$CarColorFromJson(json);

  late String id;

  late String name;

  @override
  List<Object?> get props => [id, name];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query extends JsonSerializable with EquatableMixin {
  GetDriver$Query();

  factory GetDriver$Query.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$QueryFromJson(json);

  GetDriver$Query$Driver? driver;

  late List<GetDriver$Query$CarModel> carModels;

  late List<GetDriver$Query$CarColor> carColors;

  @override
  List<Object?> get props => [driver, carModels, carColors];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$QueryToJson(this);
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

@JsonSerializable(explicitToJson: true)
class SetDocumentsOnDriver$Mutation$Driver extends JsonSerializable
    with EquatableMixin, BasicProfileMixin {
  SetDocumentsOnDriver$Mutation$Driver();

  factory SetDocumentsOnDriver$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$SetDocumentsOnDriver$Mutation$DriverFromJson(json);

  @override
  List<Object?> get props => [
        mobileNumber,
        firstName,
        lastName,
        searchDistance,
        media,
        softRejectionNote,
        status,
        currentOrders,
        wallets,
        isWalletHidden
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$SetDocumentsOnDriver$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetDocumentsOnDriver$Mutation extends JsonSerializable
    with EquatableMixin {
  SetDocumentsOnDriver$Mutation();

  factory SetDocumentsOnDriver$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SetDocumentsOnDriver$MutationFromJson(json);

  late SetDocumentsOnDriver$Mutation$Driver updateOneDriver;

  late SetDocumentsOnDriver$Mutation$Driver setDocumentsOnDriver;

  @override
  List<Object?> get props => [updateOneDriver, setDocumentsOnDriver];
  @override
  Map<String, dynamic> toJson() => _$SetDocumentsOnDriver$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicProfileMixin$Media extends JsonSerializable with EquatableMixin {
  BasicProfileMixin$Media();

  factory BasicProfileMixin$Media.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileMixin$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$BasicProfileMixin$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicProfileMixin$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  BasicProfileMixin$Order();

  factory BasicProfileMixin$Order.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileMixin$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        createdOn,
        expectedTimestamp,
        status,
        currency,
        costBest,
        costAfterCoupon,
        paidAmount,
        etaPickup,
        tipAmount,
        directions,
        points,
        service,
        options,
        addresses,
        rider
      ];
  @override
  Map<String, dynamic> toJson() => _$BasicProfileMixin$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicProfileMixin$DriverWallet extends JsonSerializable
    with EquatableMixin {
  BasicProfileMixin$DriverWallet();

  factory BasicProfileMixin$DriverWallet.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileMixin$DriverWalletFromJson(json);

  late double balance;

  late String currency;

  @override
  List<Object?> get props => [balance, currency];
  @override
  Map<String, dynamic> toJson() => _$BasicProfileMixin$DriverWalletToJson(this);
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
class CurrentOrderMixin$Service extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Service();

  factory CurrentOrderMixin$Service.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$ServiceFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$ServiceOption extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$ServiceOption();

  factory CurrentOrderMixin$ServiceOption.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$ServiceOptionFromJson(json);

  late String id;

  late String name;

  @JsonKey(unknownEnumValue: ServiceOptionIcon.artemisUnknown)
  late ServiceOptionIcon icon;

  @override
  List<Object?> get props => [id, name, icon];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$ServiceOptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Rider$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Rider$Media();

  factory CurrentOrderMixin$Rider$Media.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Rider$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$Rider$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Rider$RiderWallet extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Rider$RiderWallet();

  factory CurrentOrderMixin$Rider$RiderWallet.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Rider$RiderWalletFromJson(json);

  late String currency;

  late double balance;

  @override
  List<Object?> get props => [currency, balance];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Rider$RiderWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Rider extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Rider();

  factory CurrentOrderMixin$Rider.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$RiderFromJson(json);

  late String mobileNumber;

  String? firstName;

  String? lastName;

  CurrentOrderMixin$Rider$Media? media;

  late List<CurrentOrderMixin$Rider$RiderWallet> wallets;

  @override
  List<Object?> get props =>
      [mobileNumber, firstName, lastName, media, wallets];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$RiderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation$Driver extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation$Driver();

  factory DeleteUser$Mutation$Driver.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation();

  factory DeleteUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$MutationFromJson(json);

  late DeleteUser$Mutation$Driver deleteUser;

  @override
  List<Object?> get props => [deleteUser];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver$Media extends JsonSerializable
    with EquatableMixin {
  GetProfile$Query$Driver$Media();

  factory GetProfile$Query$Driver$Media.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$Query$Driver$MediaFromJson(json);

  late String id;

  late String address;

  @override
  List<Object?> get props => [id, address];
  @override
  Map<String, dynamic> toJson() => _$GetProfile$Query$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver$Service extends JsonSerializable
    with EquatableMixin {
  GetProfile$Query$Driver$Service();

  factory GetProfile$Query$Driver$Service.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$Query$Driver$ServiceFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProfile$Query$Driver$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver$CarColor extends JsonSerializable
    with EquatableMixin {
  GetProfile$Query$Driver$CarColor();

  factory GetProfile$Query$Driver$CarColor.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfile$Query$Driver$CarColorFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProfile$Query$Driver$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  GetProfile$Query$Driver$CarModel();

  factory GetProfile$Query$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfile$Query$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProfile$Query$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersSumAggregate
    extends JsonSerializable with EquatableMixin {
  GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersSumAggregate();

  factory GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersSumAggregate.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersSumAggregateFromJson(
          json);

  double? distanceBest;

  @override
  List<Object?> get props => [distanceBest];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersSumAggregateToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersCountAggregate
    extends JsonSerializable with EquatableMixin {
  GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersCountAggregate();

  factory GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersCountAggregate.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersCountAggregateFromJson(
          json);

  int? id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersCountAggregateToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse
    extends JsonSerializable with EquatableMixin {
  GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse();

  factory GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponseFromJson(
          json);

  GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersSumAggregate?
      sum;

  GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse$DriverHistoryOrdersCountAggregate?
      count;

  @override
  List<Object?> get props => [sum, count];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponseToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$Driver extends JsonSerializable with EquatableMixin {
  GetProfile$Query$Driver();

  factory GetProfile$Query$Driver.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$Query$DriverFromJson(json);

  late String id;

  String? firstName;

  String? lastName;

  late String mobileNumber;

  String? accountNumber;

  String? bankName;

  String? address;

  double? rating;

  late List<GetProfile$Query$Driver$Media> documents;

  String? bankSwift;

  GetProfile$Query$Driver$Media? media;

  String? carPlate;

  late List<GetProfile$Query$Driver$Service> enabledServices;

  GetProfile$Query$Driver$CarColor? carColor;

  GetProfile$Query$Driver$CarModel? car;

  late List<GetProfile$Query$Driver$DriverHistoryOrdersAggregateResponse>
      historyOrdersAggregate;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        mobileNumber,
        accountNumber,
        bankName,
        address,
        rating,
        documents,
        bankSwift,
        media,
        carPlate,
        enabledServices,
        carColor,
        car,
        historyOrdersAggregate
      ];
  @override
  Map<String, dynamic> toJson() => _$GetProfile$Query$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query extends JsonSerializable with EquatableMixin {
  GetProfile$Query();

  factory GetProfile$Query.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$QueryFromJson(json);

  GetProfile$Query$Driver? driver;

  @override
  List<Object?> get props => [driver];
  @override
  Map<String, dynamic> toJson() => _$GetProfile$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query$StatisticsResult$Datapoint extends JsonSerializable
    with EquatableMixin {
  GetStats$Query$StatisticsResult$Datapoint();

  factory GetStats$Query$StatisticsResult$Datapoint.fromJson(
          Map<String, dynamic> json) =>
      _$GetStats$Query$StatisticsResult$DatapointFromJson(json);

  late double count;

  late String current;

  late double distance;

  late double earning;

  late String name;

  late double time;

  @override
  List<Object?> get props => [count, current, distance, earning, name, time];
  @override
  Map<String, dynamic> toJson() =>
      _$GetStats$Query$StatisticsResult$DatapointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query$StatisticsResult extends JsonSerializable
    with EquatableMixin {
  GetStats$Query$StatisticsResult();

  factory GetStats$Query$StatisticsResult.fromJson(Map<String, dynamic> json) =>
      _$GetStats$Query$StatisticsResultFromJson(json);

  late String currency;

  late List<GetStats$Query$StatisticsResult$Datapoint> dataset;

  @override
  List<Object?> get props => [currency, dataset];
  @override
  Map<String, dynamic> toJson() =>
      _$GetStats$Query$StatisticsResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query$OrderConnection extends JsonSerializable
    with EquatableMixin, HistoryOrderItemMixin {
  GetStats$Query$OrderConnection();

  factory GetStats$Query$OrderConnection.fromJson(Map<String, dynamic> json) =>
      _$GetStats$Query$OrderConnectionFromJson(json);

  @override
  List<Object?> get props => [edges, pageInfo];
  @override
  Map<String, dynamic> toJson() => _$GetStats$Query$OrderConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy
    extends JsonSerializable with EquatableMixin {
  GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy();

  factory GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy.fromJson(
          Map<String, dynamic> json) =>
      _$GetStats$Query$OrderAggregateResponse$OrderAggregateGroupByFromJson(
          json);

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? createdOn;

  @override
  List<Object?> get props => [createdOn];
  @override
  Map<String, dynamic> toJson() =>
      _$GetStats$Query$OrderAggregateResponse$OrderAggregateGroupByToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query$OrderAggregateResponse$OrderCountAggregate
    extends JsonSerializable with EquatableMixin {
  GetStats$Query$OrderAggregateResponse$OrderCountAggregate();

  factory GetStats$Query$OrderAggregateResponse$OrderCountAggregate.fromJson(
          Map<String, dynamic> json) =>
      _$GetStats$Query$OrderAggregateResponse$OrderCountAggregateFromJson(json);

  int? id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetStats$Query$OrderAggregateResponse$OrderCountAggregateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query$OrderAggregateResponse$OrderSumAggregate
    extends JsonSerializable with EquatableMixin {
  GetStats$Query$OrderAggregateResponse$OrderSumAggregate();

  factory GetStats$Query$OrderAggregateResponse$OrderSumAggregate.fromJson(
          Map<String, dynamic> json) =>
      _$GetStats$Query$OrderAggregateResponse$OrderSumAggregateFromJson(json);

  double? costBest;

  @override
  List<Object?> get props => [costBest];
  @override
  Map<String, dynamic> toJson() =>
      _$GetStats$Query$OrderAggregateResponse$OrderSumAggregateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query$OrderAggregateResponse extends JsonSerializable
    with EquatableMixin {
  GetStats$Query$OrderAggregateResponse();

  factory GetStats$Query$OrderAggregateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetStats$Query$OrderAggregateResponseFromJson(json);

  GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy? groupBy;

  GetStats$Query$OrderAggregateResponse$OrderCountAggregate? count;

  GetStats$Query$OrderAggregateResponse$OrderSumAggregate? sum;

  @override
  List<Object?> get props => [groupBy, count, sum];
  @override
  Map<String, dynamic> toJson() =>
      _$GetStats$Query$OrderAggregateResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetStats$Query extends JsonSerializable with EquatableMixin {
  GetStats$Query();

  factory GetStats$Query.fromJson(Map<String, dynamic> json) =>
      _$GetStats$QueryFromJson(json);

  late GetStats$Query$StatisticsResult getStatsNew;

  late GetStats$Query$OrderConnection orders;

  late List<GetStats$Query$OrderAggregateResponse> orderAggregate;

  @override
  List<Object?> get props => [getStatsNew, orders, orderAggregate];
  @override
  Map<String, dynamic> toJson() => _$GetStats$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$DriverWallet extends JsonSerializable with EquatableMixin {
  Wallet$Query$DriverWallet();

  factory Wallet$Query$DriverWallet.fromJson(Map<String, dynamic> json) =>
      _$Wallet$Query$DriverWalletFromJson(json);

  late String id;

  late double balance;

  late String currency;

  @override
  List<Object?> get props => [id, balance, currency];
  @override
  Map<String, dynamic> toJson() => _$Wallet$Query$DriverWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion
    extends JsonSerializable with EquatableMixin {
  Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion();

  factory Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacionFromJson(
          json);

  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime createdAt;

  late double amount;

  late String currency;

  String? refrenceNumber;

  @JsonKey(unknownEnumValue: DriverDeductTransactionType.artemisUnknown)
  DriverDeductTransactionType? deductType;

  @JsonKey(unknownEnumValue: TransactionAction.artemisUnknown)
  late TransactionAction action;

  @JsonKey(unknownEnumValue: DriverRechargeTransactionType.artemisUnknown)
  DriverRechargeTransactionType? rechargeType;

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
      _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacionToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$DriverTransacionConnection$DriverTransacionEdge
    extends JsonSerializable with EquatableMixin {
  Wallet$Query$DriverTransacionConnection$DriverTransacionEdge();

  factory Wallet$Query$DriverTransacionConnection$DriverTransacionEdge.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdgeFromJson(
          json);

  late Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion
      node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdgeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$DriverTransacionConnection extends JsonSerializable
    with EquatableMixin {
  Wallet$Query$DriverTransacionConnection();

  factory Wallet$Query$DriverTransacionConnection.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$DriverTransacionConnectionFromJson(json);

  late List<Wallet$Query$DriverTransacionConnection$DriverTransacionEdge> edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$DriverTransacionConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query extends JsonSerializable with EquatableMixin {
  Wallet$Query();

  factory Wallet$Query.fromJson(Map<String, dynamic> json) =>
      _$Wallet$QueryFromJson(json);

  late List<Wallet$Query$DriverWallet> driverWallets;

  late Wallet$Query$DriverTransacionConnection driverTransacions;

  @override
  List<Object?> get props => [driverWallets, driverTransacions];
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
class TopUpWalletInput extends JsonSerializable with EquatableMixin {
  TopUpWalletInput({
    required this.gatewayId,
    required this.amount,
    required this.currency,
    this.token,
    this.pin,
    this.otp,
    this.transactionId,
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

  @override
  List<Object?> get props =>
      [gatewayId, amount, currency, token, pin, otp, transactionId];
  @override
  Map<String, dynamic> toJson() => _$TopUpWalletInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Driver extends JsonSerializable
    with EquatableMixin, BasicProfileMixin {
  Me$Query$Driver();

  factory Me$Query$Driver.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$DriverFromJson(json);

  @override
  List<Object?> get props => [
        mobileNumber,
        firstName,
        lastName,
        searchDistance,
        media,
        softRejectionNote,
        status,
        currentOrders,
        wallets,
        isWalletHidden
      ];
  @override
  Map<String, dynamic> toJson() => _$Me$Query$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query extends JsonSerializable with EquatableMixin {
  Me$Query();

  factory Me$Query.fromJson(Map<String, dynamic> json) =>
      _$Me$QueryFromJson(json);

  Me$Query$Driver? driver;

  @JsonKey(unknownEnumValue: VersionStatus.artemisUnknown)
  late VersionStatus requireUpdate;

  @override
  List<Object?> get props => [driver, requireUpdate];
  @override
  Map<String, dynamic> toJson() => _$Me$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrders$Query$Order extends JsonSerializable
    with EquatableMixin, AvailableOrderMixin {
  AvailableOrders$Query$Order();

  factory AvailableOrders$Query$Order.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrders$Query$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        currency,
        costBest,
        addresses,
        distanceBest,
        durationBest,
        directions,
        options,
        service,
        points
      ];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrders$Query$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrders$Query extends JsonSerializable with EquatableMixin {
  AvailableOrders$Query();

  factory AvailableOrders$Query.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrders$QueryFromJson(json);

  late List<AvailableOrders$Query$Order> availableOrders;

  @override
  List<Object?> get props => [availableOrders];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrders$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrderMixin$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  AvailableOrderMixin$Point();

  factory AvailableOrderMixin$Point.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrderMixin$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrderMixin$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrderMixin$ServiceOption extends JsonSerializable
    with EquatableMixin {
  AvailableOrderMixin$ServiceOption();

  factory AvailableOrderMixin$ServiceOption.fromJson(
          Map<String, dynamic> json) =>
      _$AvailableOrderMixin$ServiceOptionFromJson(json);

  late String name;

  @JsonKey(unknownEnumValue: ServiceOptionIcon.artemisUnknown)
  late ServiceOptionIcon icon;

  @override
  List<Object?> get props => [name, icon];
  @override
  Map<String, dynamic> toJson() =>
      _$AvailableOrderMixin$ServiceOptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrderMixin$Service extends JsonSerializable with EquatableMixin {
  AvailableOrderMixin$Service();

  factory AvailableOrderMixin$Service.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrderMixin$ServiceFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrderMixin$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderCreated$Subscription$Order extends JsonSerializable
    with EquatableMixin, AvailableOrderMixin {
  OrderCreated$Subscription$Order();

  factory OrderCreated$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$OrderCreated$Subscription$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        currency,
        costBest,
        addresses,
        distanceBest,
        durationBest,
        directions,
        options,
        service,
        points
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$OrderCreated$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderCreated$Subscription extends JsonSerializable with EquatableMixin {
  OrderCreated$Subscription();

  factory OrderCreated$Subscription.fromJson(Map<String, dynamic> json) =>
      _$OrderCreated$SubscriptionFromJson(json);

  late OrderCreated$Subscription$Order orderCreated;

  @override
  List<Object?> get props => [orderCreated];
  @override
  Map<String, dynamic> toJson() => _$OrderCreated$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderRemoved$Subscription$Order extends JsonSerializable
    with EquatableMixin {
  OrderRemoved$Subscription$Order();

  factory OrderRemoved$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$OrderRemoved$Subscription$OrderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$OrderRemoved$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderRemoved$Subscription extends JsonSerializable with EquatableMixin {
  OrderRemoved$Subscription();

  factory OrderRemoved$Subscription.fromJson(Map<String, dynamic> json) =>
      _$OrderRemoved$SubscriptionFromJson(json);

  late OrderRemoved$Subscription$Order orderRemoved;

  @override
  List<Object?> get props => [orderRemoved];
  @override
  Map<String, dynamic> toJson() => _$OrderRemoved$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderUpdated$Subscription$Order extends JsonSerializable
    with EquatableMixin {
  OrderUpdated$Subscription$Order();

  factory OrderUpdated$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$OrderUpdated$Subscription$OrderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$OrderUpdated$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderUpdated$Subscription extends JsonSerializable with EquatableMixin {
  OrderUpdated$Subscription();

  factory OrderUpdated$Subscription.fromJson(Map<String, dynamic> json) =>
      _$OrderUpdated$SubscriptionFromJson(json);

  late OrderUpdated$Subscription$Order orderUpdated;

  @override
  List<Object?> get props => [orderUpdated];
  @override
  Map<String, dynamic> toJson() => _$OrderUpdated$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverLocation$Mutation$Order extends JsonSerializable
    with EquatableMixin, AvailableOrderMixin {
  UpdateDriverLocation$Mutation$Order();

  factory UpdateDriverLocation$Mutation$Order.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverLocation$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        currency,
        costBest,
        addresses,
        distanceBest,
        durationBest,
        directions,
        options,
        service,
        points
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverLocation$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverLocation$Mutation extends JsonSerializable
    with EquatableMixin {
  UpdateDriverLocation$Mutation();

  factory UpdateDriverLocation$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverLocation$MutationFromJson(json);

  late List<UpdateDriverLocation$Mutation$Order> updateDriversLocationNew;

  @override
  List<Object?> get props => [updateDriversLocationNew];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverLocation$MutationToJson(this);
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
class UpdateOrderStatus$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  UpdateOrderStatus$Mutation$Order();

  factory UpdateOrderStatus$Mutation$Order.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOrderStatus$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        createdOn,
        expectedTimestamp,
        status,
        currency,
        costBest,
        costAfterCoupon,
        paidAmount,
        etaPickup,
        tipAmount,
        directions,
        points,
        service,
        options,
        addresses,
        rider
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateOrderStatus$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderStatus$Mutation extends JsonSerializable with EquatableMixin {
  UpdateOrderStatus$Mutation();

  factory UpdateOrderStatus$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderStatus$MutationFromJson(json);

  late UpdateOrderStatus$Mutation$Order updateOneOrder;

  @override
  List<Object?> get props => [updateOneOrder];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderStatus$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverStatus$Mutation$Driver extends JsonSerializable
    with EquatableMixin, BasicProfileMixin {
  UpdateDriverStatus$Mutation$Driver();

  factory UpdateDriverStatus$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverStatus$Mutation$DriverFromJson(json);

  @override
  List<Object?> get props => [
        mobileNumber,
        firstName,
        lastName,
        searchDistance,
        media,
        softRejectionNote,
        status,
        currentOrders,
        wallets,
        isWalletHidden
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverStatus$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverStatus$Mutation extends JsonSerializable with EquatableMixin {
  UpdateDriverStatus$Mutation();

  factory UpdateDriverStatus$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverStatus$MutationFromJson(json);

  late UpdateDriverStatus$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverStatus$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverFCMId$Mutation$Driver extends JsonSerializable
    with EquatableMixin {
  UpdateDriverFCMId$Mutation$Driver();

  factory UpdateDriverFCMId$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverFCMId$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverFCMId$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverFCMId$Mutation extends JsonSerializable with EquatableMixin {
  UpdateDriverFCMId$Mutation();

  factory UpdateDriverFCMId$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverFCMId$MutationFromJson(json);

  late UpdateDriverFCMId$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverFCMId$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverSearchDistance$Mutation$Driver extends JsonSerializable
    with EquatableMixin {
  UpdateDriverSearchDistance$Mutation$Driver();

  factory UpdateDriverSearchDistance$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverSearchDistance$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverSearchDistance$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverSearchDistance$Mutation extends JsonSerializable
    with EquatableMixin {
  UpdateDriverSearchDistance$Mutation();

  factory UpdateDriverSearchDistance$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverSearchDistance$MutationFromJson(json);

  late UpdateDriverSearchDistance$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverSearchDistance$MutationToJson(this);
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

enum DriverStatus {
  @JsonValue('Online')
  online,
  @JsonValue('Offline')
  offline,
  @JsonValue('Blocked')
  blocked,
  @JsonValue('InService')
  inService,
  @JsonValue('WaitingDocuments')
  waitingDocuments,
  @JsonValue('PendingApproval')
  pendingApproval,
  @JsonValue('SoftReject')
  softReject,
  @JsonValue('HardReject')
  hardReject,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
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

enum DriverDeductTransactionType {
  @JsonValue('Withdraw')
  withdraw,
  @JsonValue('Commission')
  commission,
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

enum DriverRechargeTransactionType {
  @JsonValue('OrderFee')
  orderFee,
  @JsonValue('BankTransfer')
  bankTransfer,
  @JsonValue('InAppPayment')
  inAppPayment,
  @JsonValue('Gift')
  gift,
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

final GET_MESSAGES_QUERY_DOCUMENT_OPERATION_NAME = 'GetMessages';
final GET_MESSAGES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMessages'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'driver'),
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
            name: NameNode(value: 'currentOrders'),
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
                  ),
                  FieldNode(
                    name: NameNode(value: 'mobileNumber'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
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

final HISTORY_QUERY_DOCUMENT_OPERATION_NAME = 'History';
final HISTORY_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'History'),
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
                name: NameNode(value: 'providerShare'),
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
                    name: NameNode(value: 'name'),
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

class HistoryQuery extends GraphQLQuery<History$Query, JsonSerializable> {
  HistoryQuery();

  @override
  final DocumentNode document = HISTORY_QUERY_DOCUMENT;

  @override
  final String operationName = HISTORY_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  History$Query parse(Map<String, dynamic> json) =>
      History$Query.fromJson(json);
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
            name: NameNode(value: 'distanceBest'),
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
            name: NameNode(value: 'paymentGatewayId'),
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

final ANNOUNCEMENTS_QUERY_DOCUMENT_OPERATION_NAME = 'Announcements';
final ANNOUNCEMENTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Announcements'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'announcements'),
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
            name: NameNode(value: 'description'),
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

class AnnouncementsQuery
    extends GraphQLQuery<Announcements$Query, JsonSerializable> {
  AnnouncementsQuery();

  @override
  final DocumentNode document = ANNOUNCEMENTS_QUERY_DOCUMENT;

  @override
  final String operationName = ANNOUNCEMENTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  Announcements$Query parse(Map<String, dynamic> json) =>
      Announcements$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileArguments extends JsonSerializable with EquatableMixin {
  UpdateProfileArguments({required this.input});

  @override
  factory UpdateProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileArgumentsFromJson(json);

  late UpdateDriverInput input;

  @override
  List<Object?> get props => [input];
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
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateDriverInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneDriver'),
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
                value: VariableNode(name: NameNode(value: 'input')),
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

final GET_DRIVER_QUERY_DOCUMENT_OPERATION_NAME = 'GetDriver';
final GET_DRIVER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetDriver'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'driver'),
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
            name: NameNode(value: 'status'),
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
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'accountNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bankName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bankRoutingNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'documents'),
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
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'bankSwift'),
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
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carProductionYear'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'certificateNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carColorId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'carModels'),
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
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'carColors'),
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
        ]),
      ),
    ]),
  )
]);

class GetDriverQuery extends GraphQLQuery<GetDriver$Query, JsonSerializable> {
  GetDriverQuery();

  @override
  final DocumentNode document = GET_DRIVER_QUERY_DOCUMENT;

  @override
  final String operationName = GET_DRIVER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetDriver$Query parse(Map<String, dynamic> json) =>
      GetDriver$Query.fromJson(json);
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

@JsonSerializable(explicitToJson: true)
class SetDocumentsOnDriverArguments extends JsonSerializable
    with EquatableMixin {
  SetDocumentsOnDriverArguments({
    required this.driverId,
    required this.relationIds,
  });

  @override
  factory SetDocumentsOnDriverArguments.fromJson(Map<String, dynamic> json) =>
      _$SetDocumentsOnDriverArgumentsFromJson(json);

  late String driverId;

  late List<String> relationIds;

  @override
  List<Object?> get props => [driverId, relationIds];
  @override
  Map<String, dynamic> toJson() => _$SetDocumentsOnDriverArgumentsToJson(this);
}

final SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT_OPERATION_NAME =
    'SetDocumentsOnDriver';
final SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SetDocumentsOnDriver'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'relationIds')),
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
        name: NameNode(value: 'updateOneDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'driverId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value:
                        EnumValueNode(name: NameNode(value: 'PendingApproval')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'setDocumentsOnDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'driverId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'relationIds'),
                value: VariableNode(name: NameNode(value: 'relationIds')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'BasicProfile'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Driver'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
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
        name: NameNode(value: 'searchDistance'),
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
        name: NameNode(value: 'softRejectionNote'),
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
        name: NameNode(value: 'currentOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
        name: NameNode(value: 'isWalletHidden'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'createdOn'),
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
        name: NameNode(value: 'status'),
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
        name: NameNode(value: 'costBest'),
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
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
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
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
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
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
        name: NameNode(value: 'rider'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'wallets'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'currency'),
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
            ]),
          ),
        ]),
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

class SetDocumentsOnDriverMutation extends GraphQLQuery<
    SetDocumentsOnDriver$Mutation, SetDocumentsOnDriverArguments> {
  SetDocumentsOnDriverMutation({required this.variables});

  @override
  final DocumentNode document = SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT;

  @override
  final String operationName =
      SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SetDocumentsOnDriverArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SetDocumentsOnDriver$Mutation parse(Map<String, dynamic> json) =>
      SetDocumentsOnDriver$Mutation.fromJson(json);
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

final GET_PROFILE_QUERY_DOCUMENT_OPERATION_NAME = 'GetProfile';
final GET_PROFILE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetProfile'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'driver'),
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
            name: NameNode(value: 'accountNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bankName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'address'),
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
            name: NameNode(value: 'documents'),
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
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'bankSwift'),
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
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'enabledServices'),
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
            name: NameNode(value: 'historyOrdersAggregate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'sum'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'distanceBest'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
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
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetProfileQuery extends GraphQLQuery<GetProfile$Query, JsonSerializable> {
  GetProfileQuery();

  @override
  final DocumentNode document = GET_PROFILE_QUERY_DOCUMENT;

  @override
  final String operationName = GET_PROFILE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetProfile$Query parse(Map<String, dynamic> json) =>
      GetProfile$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetStatsArguments extends JsonSerializable with EquatableMixin {
  GetStatsArguments({
    required this.startDate,
    required this.endDate,
  });

  @override
  factory GetStatsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetStatsArgumentsFromJson(json);

  @JsonKey(
      fromJson: fromGraphQLDateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLDateTime)
  late DateTime startDate;

  @JsonKey(
      fromJson: fromGraphQLDateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLDateTime)
  late DateTime endDate;

  @override
  List<Object?> get props => [startDate, endDate];
  @override
  Map<String, dynamic> toJson() => _$GetStatsArgumentsToJson(this);
}

final GET_STATS_QUERY_DOCUMENT_OPERATION_NAME = 'GetStats';
final GET_STATS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetStats'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'startDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'endDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getStatsNew'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'timeframe'),
            value: EnumValueNode(name: NameNode(value: 'Daily')),
          ),
          ArgumentNode(
            name: NameNode(value: 'startDate'),
            value: VariableNode(name: NameNode(value: 'startDate')),
          ),
          ArgumentNode(
            name: NameNode(value: 'endDate'),
            value: VariableNode(name: NameNode(value: 'endDate')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dataset'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'count'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'current'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'distance'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'earning'),
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
                name: NameNode(value: 'time'),
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
                      EnumValueNode(name: NameNode(value: 'Finished')),
                      EnumValueNode(name: NameNode(value: 'WaitingForReview')),
                    ]),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'createdOn'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'between'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'lower'),
                        value: VariableNode(name: NameNode(value: 'startDate')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'upper'),
                        value: VariableNode(name: NameNode(value: 'endDate')),
                      ),
                    ]),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'historyOrderItem'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'orderAggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'filter'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'createdOn'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'between'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'lower'),
                        value: VariableNode(name: NameNode(value: 'startDate')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'upper'),
                        value: VariableNode(name: NameNode(value: 'endDate')),
                      ),
                    ]),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'groupBy'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'createdOn'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
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
          ),
          FieldNode(
            name: NameNode(value: 'sum'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'costBest'),
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
                name: NameNode(value: 'providerShare'),
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
                    name: NameNode(value: 'name'),
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

class GetStatsQuery extends GraphQLQuery<GetStats$Query, GetStatsArguments> {
  GetStatsQuery({required this.variables});

  @override
  final DocumentNode document = GET_STATS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_STATS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetStatsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetStats$Query parse(Map<String, dynamic> json) =>
      GetStats$Query.fromJson(json);
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
        name: NameNode(value: 'driverWallets'),
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
        name: NameNode(value: 'driverTransacions'),
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
class MeArguments extends JsonSerializable with EquatableMixin {
  MeArguments({required this.versionCode});

  @override
  factory MeArguments.fromJson(Map<String, dynamic> json) =>
      _$MeArgumentsFromJson(json);

  late int versionCode;

  @override
  List<Object?> get props => [versionCode];
  @override
  Map<String, dynamic> toJson() => _$MeArgumentsToJson(this);
}

final ME_QUERY_DOCUMENT_OPERATION_NAME = 'Me';
final ME_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Me'),
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
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: IntValueNode(value: '1'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
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
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'BasicProfile'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Driver'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
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
        name: NameNode(value: 'searchDistance'),
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
        name: NameNode(value: 'softRejectionNote'),
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
        name: NameNode(value: 'currentOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
        name: NameNode(value: 'isWalletHidden'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'createdOn'),
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
        name: NameNode(value: 'status'),
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
        name: NameNode(value: 'costBest'),
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
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
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
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
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
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
        name: NameNode(value: 'rider'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'wallets'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'currency'),
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
            ]),
          ),
        ]),
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

class MeQuery extends GraphQLQuery<Me$Query, MeArguments> {
  MeQuery({required this.variables});

  @override
  final DocumentNode document = ME_QUERY_DOCUMENT;

  @override
  final String operationName = ME_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final MeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Me$Query parse(Map<String, dynamic> json) => Me$Query.fromJson(json);
}

final AVAILABLE_ORDERS_QUERY_DOCUMENT_OPERATION_NAME = 'AvailableOrders';
final AVAILABLE_ORDERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'AvailableOrders'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'availableOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'AvailableOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'AvailableOrder'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'distanceBest'),
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
        name: NameNode(value: 'options'),
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
            name: NameNode(value: 'icon'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
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

class AvailableOrdersQuery
    extends GraphQLQuery<AvailableOrders$Query, JsonSerializable> {
  AvailableOrdersQuery();

  @override
  final DocumentNode document = AVAILABLE_ORDERS_QUERY_DOCUMENT;

  @override
  final String operationName = AVAILABLE_ORDERS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  AvailableOrders$Query parse(Map<String, dynamic> json) =>
      AvailableOrders$Query.fromJson(json);
}

final ORDER_CREATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'OrderCreated';
final ORDER_CREATED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'OrderCreated'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orderCreated'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'AvailableOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'AvailableOrder'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'distanceBest'),
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
        name: NameNode(value: 'options'),
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
            name: NameNode(value: 'icon'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
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

class OrderCreatedSubscription
    extends GraphQLQuery<OrderCreated$Subscription, JsonSerializable> {
  OrderCreatedSubscription();

  @override
  final DocumentNode document = ORDER_CREATED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      ORDER_CREATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  OrderCreated$Subscription parse(Map<String, dynamic> json) =>
      OrderCreated$Subscription.fromJson(json);
}

final ORDER_REMOVED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'OrderRemoved';
final ORDER_REMOVED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'OrderRemoved'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orderRemoved'),
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

class OrderRemovedSubscription
    extends GraphQLQuery<OrderRemoved$Subscription, JsonSerializable> {
  OrderRemovedSubscription();

  @override
  final DocumentNode document = ORDER_REMOVED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      ORDER_REMOVED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  OrderRemoved$Subscription parse(Map<String, dynamic> json) =>
      OrderRemoved$Subscription.fromJson(json);
}

final ORDER_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'OrderUpdated';
final ORDER_UPDATED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'OrderUpdated'),
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
          )
        ]),
      )
    ]),
  )
]);

class OrderUpdatedSubscription
    extends GraphQLQuery<OrderUpdated$Subscription, JsonSerializable> {
  OrderUpdatedSubscription();

  @override
  final DocumentNode document = ORDER_UPDATED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      ORDER_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  OrderUpdated$Subscription parse(Map<String, dynamic> json) =>
      OrderUpdated$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverLocationArguments extends JsonSerializable
    with EquatableMixin {
  UpdateDriverLocationArguments({required this.point});

  @override
  factory UpdateDriverLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverLocationArgumentsFromJson(json);

  late PointInput point;

  @override
  List<Object?> get props => [point];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverLocationArgumentsToJson(this);
}

final UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverLocation';
final UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'point')),
        type: NamedTypeNode(
          name: NameNode(value: 'PointInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateDriversLocationNew'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'point'),
            value: VariableNode(name: NameNode(value: 'point')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'AvailableOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'AvailableOrder'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'distanceBest'),
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
        name: NameNode(value: 'options'),
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
            name: NameNode(value: 'icon'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
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

class UpdateDriverLocationMutation extends GraphQLQuery<
    UpdateDriverLocation$Mutation, UpdateDriverLocationArguments> {
  UpdateDriverLocationMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverLocationArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverLocation$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverLocation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderStatusArguments extends JsonSerializable with EquatableMixin {
  UpdateOrderStatusArguments({
    required this.orderId,
    required this.status,
    this.cashPayment,
  });

  @override
  factory UpdateOrderStatusArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderStatusArgumentsFromJson(json);

  late String orderId;

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;

  final double? cashPayment;

  @override
  List<Object?> get props => [orderId, status, cashPayment];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderStatusArgumentsToJson(this);
}

final UPDATE_ORDER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateOrderStatus';
final UPDATE_ORDER_STATUS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateOrderStatus'),
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
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'OrderStatus'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cashPayment')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: false,
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
                value: VariableNode(name: NameNode(value: 'orderId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'paidAmount'),
                    value: VariableNode(name: NameNode(value: 'cashPayment')),
                  ),
                ]),
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
        name: NameNode(value: 'createdOn'),
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
        name: NameNode(value: 'status'),
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
        name: NameNode(value: 'costBest'),
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
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
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
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
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
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
        name: NameNode(value: 'rider'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'wallets'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'currency'),
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
            ]),
          ),
        ]),
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

class UpdateOrderStatusMutation extends GraphQLQuery<UpdateOrderStatus$Mutation,
    UpdateOrderStatusArguments> {
  UpdateOrderStatusMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_ORDER_STATUS_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_ORDER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateOrderStatusArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateOrderStatus$Mutation parse(Map<String, dynamic> json) =>
      UpdateOrderStatus$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverStatusArguments extends JsonSerializable with EquatableMixin {
  UpdateDriverStatusArguments({
    required this.status,
    this.fcmId,
  });

  @override
  factory UpdateDriverStatusArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverStatusArgumentsFromJson(json);

  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  late DriverStatus status;

  final String? fcmId;

  @override
  List<Object?> get props => [status, fcmId];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverStatusArgumentsToJson(this);
}

final UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverStatus';
final UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverStatus'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'DriverStatus'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'fcmId')),
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
        name: NameNode(value: 'updateOneDriver'),
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
                    name: NameNode(value: 'status'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'notificationPlayerId'),
                    value: VariableNode(name: NameNode(value: 'fcmId')),
                  ),
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'BasicProfile'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Driver'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
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
        name: NameNode(value: 'searchDistance'),
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
        name: NameNode(value: 'softRejectionNote'),
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
        name: NameNode(value: 'currentOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
        name: NameNode(value: 'isWalletHidden'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'createdOn'),
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
        name: NameNode(value: 'status'),
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
        name: NameNode(value: 'costBest'),
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
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
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
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
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
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
        name: NameNode(value: 'rider'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'wallets'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'currency'),
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
            ]),
          ),
        ]),
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

class UpdateDriverStatusMutation extends GraphQLQuery<
    UpdateDriverStatus$Mutation, UpdateDriverStatusArguments> {
  UpdateDriverStatusMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverStatusArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverStatus$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverStatus$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverFCMIdArguments extends JsonSerializable with EquatableMixin {
  UpdateDriverFCMIdArguments({this.fcmId});

  @override
  factory UpdateDriverFCMIdArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverFCMIdArgumentsFromJson(json);

  final String? fcmId;

  @override
  List<Object?> get props => [fcmId];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverFCMIdArgumentsToJson(this);
}

final UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverFCMId';
final UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverFCMId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'fcmId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneDriver'),
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
                    value: VariableNode(name: NameNode(value: 'fcmId')),
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
      )
    ]),
  )
]);

class UpdateDriverFCMIdMutation extends GraphQLQuery<UpdateDriverFCMId$Mutation,
    UpdateDriverFCMIdArguments> {
  UpdateDriverFCMIdMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverFCMIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverFCMId$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverFCMId$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverSearchDistanceArguments extends JsonSerializable
    with EquatableMixin {
  UpdateDriverSearchDistanceArguments({required this.distance});

  @override
  factory UpdateDriverSearchDistanceArguments.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverSearchDistanceArgumentsFromJson(json);

  late int distance;

  @override
  List<Object?> get props => [distance];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverSearchDistanceArgumentsToJson(this);
}

final UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverSearchDistance';
final UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverSearchDistance'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
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
        name: NameNode(value: 'updateOneDriver'),
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
                    name: NameNode(value: 'searchDistance'),
                    value: VariableNode(name: NameNode(value: 'distance')),
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
      )
    ]),
  )
]);

class UpdateDriverSearchDistanceMutation extends GraphQLQuery<
    UpdateDriverSearchDistance$Mutation, UpdateDriverSearchDistanceArguments> {
  UpdateDriverSearchDistanceMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverSearchDistanceArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverSearchDistance$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverSearchDistance$Mutation.fromJson(json);
}
