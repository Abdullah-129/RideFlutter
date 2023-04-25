// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessages$Query$Order$Rider _$GetMessages$Query$Order$RiderFromJson(
        Map<String, dynamic> json) =>
    GetMessages$Query$Order$Rider()
      ..id = json['id'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..mobileNumber = json['mobileNumber'] as String
      ..media = json['media'] == null
          ? null
          : ChatRiderMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$Query$Order$RiderToJson(
    GetMessages$Query$Order$Rider instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  val['mobileNumber'] = instance.mobileNumber;
  writeNotNull('media', instance.media?.toJson());
  return val;
}

GetMessages$Query$Order$Driver _$GetMessages$Query$Order$DriverFromJson(
        Map<String, dynamic> json) =>
    GetMessages$Query$Order$Driver()
      ..id = json['id'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..mobileNumber = json['mobileNumber'] as String
      ..media = json['media'] == null
          ? null
          : ChatDriverMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$Query$Order$DriverToJson(
    GetMessages$Query$Order$Driver instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  val['mobileNumber'] = instance.mobileNumber;
  writeNotNull('media', instance.media?.toJson());
  return val;
}

GetMessages$Query$Order$OrderMessage
    _$GetMessages$Query$Order$OrderMessageFromJson(Map<String, dynamic> json) =>
        GetMessages$Query$Order$OrderMessage()
          ..id = json['id'] as String
          ..content = json['content'] as String
          ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$GetMessages$Query$Order$OrderMessageToJson(
        GetMessages$Query$Order$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

GetMessages$Query$Order _$GetMessages$Query$OrderFromJson(
        Map<String, dynamic> json) =>
    GetMessages$Query$Order()
      ..id = json['id'] as String
      ..rider = GetMessages$Query$Order$Rider.fromJson(
          json['rider'] as Map<String, dynamic>)
      ..driver = json['driver'] == null
          ? null
          : GetMessages$Query$Order$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..conversations = (json['conversations'] as List<dynamic>)
          .map((e) => GetMessages$Query$Order$OrderMessage.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetMessages$Query$OrderToJson(
    GetMessages$Query$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'rider': instance.rider.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['conversations'] = instance.conversations.map((e) => e.toJson()).toList();
  return val;
}

GetMessages$Query _$GetMessages$QueryFromJson(Map<String, dynamic> json) =>
    GetMessages$Query()
      ..currentOrder = GetMessages$Query$Order.fromJson(
          json['currentOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$QueryToJson(GetMessages$Query instance) =>
    <String, dynamic>{
      'currentOrder': instance.currentOrder.toJson(),
    };

ChatRiderMixin$Media _$ChatRiderMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    ChatRiderMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$ChatRiderMixin$MediaToJson(
        ChatRiderMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

ChatDriverMixin$Media _$ChatDriverMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    ChatDriverMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$ChatDriverMixin$MediaToJson(
        ChatDriverMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

SendMessage$Mutation$OrderMessage _$SendMessage$Mutation$OrderMessageFromJson(
        Map<String, dynamic> json) =>
    SendMessage$Mutation$OrderMessage()
      ..id = json['id'] as String
      ..content = json['content'] as String
      ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$SendMessage$Mutation$OrderMessageToJson(
        SendMessage$Mutation$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

SendMessage$Mutation _$SendMessage$MutationFromJson(
        Map<String, dynamic> json) =>
    SendMessage$Mutation()
      ..createOneOrderMessage = SendMessage$Mutation$OrderMessage.fromJson(
          json['createOneOrderMessage'] as Map<String, dynamic>);

Map<String, dynamic> _$SendMessage$MutationToJson(
        SendMessage$Mutation instance) =>
    <String, dynamic>{
      'createOneOrderMessage': instance.createOneOrderMessage.toJson(),
    };

NewMessageReceived$Subscription$OrderMessage
    _$NewMessageReceived$Subscription$OrderMessageFromJson(
            Map<String, dynamic> json) =>
        NewMessageReceived$Subscription$OrderMessage()
          ..id = json['id'] as String
          ..content = json['content'] as String
          ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$NewMessageReceived$Subscription$OrderMessageToJson(
        NewMessageReceived$Subscription$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

NewMessageReceived$Subscription _$NewMessageReceived$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    NewMessageReceived$Subscription()
      ..newMessageReceived =
          NewMessageReceived$Subscription$OrderMessage.fromJson(
              json['newMessageReceived'] as Map<String, dynamic>);

Map<String, dynamic> _$NewMessageReceived$SubscriptionToJson(
        NewMessageReceived$Subscription instance) =>
    <String, dynamic>{
      'newMessageReceived': instance.newMessageReceived.toJson(),
    };

Reservations$Query$OrderConnection$OrderEdge$Order
    _$Reservations$Query$OrderConnection$OrderEdge$OrderFromJson(
            Map<String, dynamic> json) =>
        Reservations$Query$OrderConnection$OrderEdge$Order()
          ..id = json['id'] as String
          ..expectedTimestamp = fromGraphQLTimestampToDartDateTime(
              json['expectedTimestamp'] as int)
          ..addresses = (json['addresses'] as List<dynamic>)
              .map((e) => e as String)
              .toList();

Map<String, dynamic> _$Reservations$Query$OrderConnection$OrderEdge$OrderToJson(
        Reservations$Query$OrderConnection$OrderEdge$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expectedTimestamp':
          fromDartDateTimeToGraphQLTimestamp(instance.expectedTimestamp),
      'addresses': instance.addresses,
    };

Reservations$Query$OrderConnection$OrderEdge
    _$Reservations$Query$OrderConnection$OrderEdgeFromJson(
            Map<String, dynamic> json) =>
        Reservations$Query$OrderConnection$OrderEdge()
          ..node = Reservations$Query$OrderConnection$OrderEdge$Order.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$Reservations$Query$OrderConnection$OrderEdgeToJson(
        Reservations$Query$OrderConnection$OrderEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

Reservations$Query$OrderConnection _$Reservations$Query$OrderConnectionFromJson(
        Map<String, dynamic> json) =>
    Reservations$Query$OrderConnection()
      ..edges = (json['edges'] as List<dynamic>)
          .map((e) => Reservations$Query$OrderConnection$OrderEdge.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Reservations$Query$OrderConnectionToJson(
        Reservations$Query$OrderConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

Reservations$Query _$Reservations$QueryFromJson(Map<String, dynamic> json) =>
    Reservations$Query()
      ..orders = Reservations$Query$OrderConnection.fromJson(
          json['orders'] as Map<String, dynamic>);

Map<String, dynamic> _$Reservations$QueryToJson(Reservations$Query instance) =>
    <String, dynamic>{
      'orders': instance.orders.toJson(),
    };

GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementFromJson(
            Map<String, dynamic> json) =>
        GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement()
          ..id = json['id'] as String
          ..title = json['title'] as String
          ..startAt = fromGraphQLTimestampToDartDateTime(json['startAt'] as int)
          ..description = json['description'] as String
          ..url = json['url'] as String?;

Map<String, dynamic>
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$AnnouncementToJson(
        GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
            instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'startAt': fromDartDateTimeToGraphQLTimestamp(instance.startAt),
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  return val;
}

GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeFromJson(
            Map<String, dynamic> json) =>
        GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge()
          ..node =
              GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge$Announcement
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdgeToJson(
            GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
                instance) =>
        <String, dynamic>{
          'node': instance.node.toJson(),
        };

GetAnnouncements$Query$AnnouncementConnection
    _$GetAnnouncements$Query$AnnouncementConnectionFromJson(
            Map<String, dynamic> json) =>
        GetAnnouncements$Query$AnnouncementConnection()
          ..edges = (json['edges'] as List<dynamic>)
              .map((e) =>
                  GetAnnouncements$Query$AnnouncementConnection$AnnouncementEdge
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetAnnouncements$Query$AnnouncementConnectionToJson(
        GetAnnouncements$Query$AnnouncementConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

GetAnnouncements$Query _$GetAnnouncements$QueryFromJson(
        Map<String, dynamic> json) =>
    GetAnnouncements$Query()
      ..announcements = GetAnnouncements$Query$AnnouncementConnection.fromJson(
          json['announcements'] as Map<String, dynamic>);

Map<String, dynamic> _$GetAnnouncements$QueryToJson(
        GetAnnouncements$Query instance) =>
    <String, dynamic>{
      'announcements': instance.announcements.toJson(),
    };

GetRider$Query$Rider$Media _$GetRider$Query$Rider$MediaFromJson(
        Map<String, dynamic> json) =>
    GetRider$Query$Rider$Media()..address = json['address'] as String;

Map<String, dynamic> _$GetRider$Query$Rider$MediaToJson(
        GetRider$Query$Rider$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

GetRider$Query$Rider _$GetRider$Query$RiderFromJson(
        Map<String, dynamic> json) =>
    GetRider$Query$Rider()
      ..id = json['id'] as String
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..gender = $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown)
      ..email = json['email'] as String?
      ..media = json['media'] == null
          ? null
          : GetRider$Query$Rider$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetRider$Query$RiderToJson(
    GetRider$Query$Rider instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'mobileNumber': instance.mobileNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('gender', _$GenderEnumMap[instance.gender]);
  writeNotNull('email', instance.email);
  writeNotNull('media', instance.media?.toJson());
  return val;
}

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
  Gender.unknown: 'Unknown',
  Gender.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetRider$Query _$GetRider$QueryFromJson(Map<String, dynamic> json) =>
    GetRider$Query()
      ..rider = json['rider'] == null
          ? null
          : GetRider$Query$Rider.fromJson(
              json['rider'] as Map<String, dynamic>);

Map<String, dynamic> _$GetRider$QueryToJson(GetRider$Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rider', instance.rider?.toJson());
  return val;
}

UpdateProfile$Mutation$Rider _$UpdateProfile$Mutation$RiderFromJson(
        Map<String, dynamic> json) =>
    UpdateProfile$Mutation$Rider()..id = json['id'] as String;

Map<String, dynamic> _$UpdateProfile$Mutation$RiderToJson(
        UpdateProfile$Mutation$Rider instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateProfile$Mutation _$UpdateProfile$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateProfile$Mutation()
      ..updateOneRider = UpdateProfile$Mutation$Rider.fromJson(
          json['updateOneRider'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateProfile$MutationToJson(
        UpdateProfile$Mutation instance) =>
    <String, dynamic>{
      'updateOneRider': instance.updateOneRider.toJson(),
    };

DeleteUser$Mutation$Rider _$DeleteUser$Mutation$RiderFromJson(
        Map<String, dynamic> json) =>
    DeleteUser$Mutation$Rider()..id = json['id'] as String;

Map<String, dynamic> _$DeleteUser$Mutation$RiderToJson(
        DeleteUser$Mutation$Rider instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

DeleteUser$Mutation _$DeleteUser$MutationFromJson(Map<String, dynamic> json) =>
    DeleteUser$Mutation()
      ..deleteUser = DeleteUser$Mutation$Rider.fromJson(
          json['deleteUser'] as Map<String, dynamic>);

Map<String, dynamic> _$DeleteUser$MutationToJson(
        DeleteUser$Mutation instance) =>
    <String, dynamic>{
      'deleteUser': instance.deleteUser.toJson(),
    };

GetAddresses$Query$RiderAddress$Point
    _$GetAddresses$Query$RiderAddress$PointFromJson(
            Map<String, dynamic> json) =>
        GetAddresses$Query$RiderAddress$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetAddresses$Query$RiderAddress$PointToJson(
        GetAddresses$Query$RiderAddress$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetAddresses$Query$RiderAddress _$GetAddresses$Query$RiderAddressFromJson(
        Map<String, dynamic> json) =>
    GetAddresses$Query$RiderAddress()
      ..id = json['id'] as String
      ..title = json['title'] as String
      ..type = $enumDecode(_$RiderAddressTypeEnumMap, json['type'],
          unknownValue: RiderAddressType.artemisUnknown)
      ..details = json['details'] as String
      ..location = GetAddresses$Query$RiderAddress$Point.fromJson(
          json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$GetAddresses$Query$RiderAddressToJson(
        GetAddresses$Query$RiderAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$RiderAddressTypeEnumMap[instance.type]!,
      'details': instance.details,
      'location': instance.location.toJson(),
    };

const _$RiderAddressTypeEnumMap = {
  RiderAddressType.home: 'Home',
  RiderAddressType.work: 'Work',
  RiderAddressType.partner: 'Partner',
  RiderAddressType.gym: 'Gym',
  RiderAddressType.parent: 'Parent',
  RiderAddressType.cafe: 'Cafe',
  RiderAddressType.park: 'Park',
  RiderAddressType.other: 'Other',
  RiderAddressType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetAddresses$Query _$GetAddresses$QueryFromJson(Map<String, dynamic> json) =>
    GetAddresses$Query()
      ..riderAddresses = (json['riderAddresses'] as List<dynamic>)
          .map((e) => GetAddresses$Query$RiderAddress.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetAddresses$QueryToJson(GetAddresses$Query instance) =>
    <String, dynamic>{
      'riderAddresses': instance.riderAddresses.map((e) => e.toJson()).toList(),
    };

CreateAddress$Mutation$RiderAddress
    _$CreateAddress$Mutation$RiderAddressFromJson(Map<String, dynamic> json) =>
        CreateAddress$Mutation$RiderAddress()..id = json['id'] as String;

Map<String, dynamic> _$CreateAddress$Mutation$RiderAddressToJson(
        CreateAddress$Mutation$RiderAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateAddress$Mutation _$CreateAddress$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateAddress$Mutation()
      ..createOneRiderAddress = CreateAddress$Mutation$RiderAddress.fromJson(
          json['createOneRiderAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateAddress$MutationToJson(
        CreateAddress$Mutation instance) =>
    <String, dynamic>{
      'createOneRiderAddress': instance.createOneRiderAddress.toJson(),
    };

CreateRiderAddressInput _$CreateRiderAddressInputFromJson(
        Map<String, dynamic> json) =>
    CreateRiderAddressInput(
      title: json['title'] as String,
      details: json['details'] as String,
      location: PointInput.fromJson(json['location'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$RiderAddressTypeEnumMap, json['type'],
          unknownValue: RiderAddressType.artemisUnknown),
    );

Map<String, dynamic> _$CreateRiderAddressInputToJson(
    CreateRiderAddressInput instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'details': instance.details,
    'location': instance.location.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$RiderAddressTypeEnumMap[instance.type]);
  return val;
}

PointInput _$PointInputFromJson(Map<String, dynamic> json) => PointInput(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PointInputToJson(PointInput instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UpdateAddress$Mutation$RiderAddress
    _$UpdateAddress$Mutation$RiderAddressFromJson(Map<String, dynamic> json) =>
        UpdateAddress$Mutation$RiderAddress()..id = json['id'] as String;

Map<String, dynamic> _$UpdateAddress$Mutation$RiderAddressToJson(
        UpdateAddress$Mutation$RiderAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateAddress$Mutation _$UpdateAddress$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateAddress$Mutation()
      ..updateOneRiderAddress = UpdateAddress$Mutation$RiderAddress.fromJson(
          json['updateOneRiderAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateAddress$MutationToJson(
        UpdateAddress$Mutation instance) =>
    <String, dynamic>{
      'updateOneRiderAddress': instance.updateOneRiderAddress.toJson(),
    };

DeleteAddress$Mutation$RiderAddressDeleteResponse
    _$DeleteAddress$Mutation$RiderAddressDeleteResponseFromJson(
            Map<String, dynamic> json) =>
        DeleteAddress$Mutation$RiderAddressDeleteResponse()
          ..id = json['id'] as String?;

Map<String, dynamic> _$DeleteAddress$Mutation$RiderAddressDeleteResponseToJson(
    DeleteAddress$Mutation$RiderAddressDeleteResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

DeleteAddress$Mutation _$DeleteAddress$MutationFromJson(
        Map<String, dynamic> json) =>
    DeleteAddress$Mutation()
      ..deleteOneRiderAddress =
          DeleteAddress$Mutation$RiderAddressDeleteResponse.fromJson(
              json['deleteOneRiderAddress'] as Map<String, dynamic>);

Map<String, dynamic> _$DeleteAddress$MutationToJson(
        DeleteAddress$Mutation instance) =>
    <String, dynamic>{
      'deleteOneRiderAddress': instance.deleteOneRiderAddress.toJson(),
    };

GetHistory$Query$OrderConnection _$GetHistory$Query$OrderConnectionFromJson(
        Map<String, dynamic> json) =>
    GetHistory$Query$OrderConnection()
      ..edges = (json['edges'] as List<dynamic>)
          .map((e) => HistoryOrderItemMixin$OrderEdge.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..pageInfo = HistoryOrderItemMixin$PageInfo.fromJson(
          json['pageInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$GetHistory$Query$OrderConnectionToJson(
        GetHistory$Query$OrderConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
    };

GetHistory$Query _$GetHistory$QueryFromJson(Map<String, dynamic> json) =>
    GetHistory$Query()
      ..orders = GetHistory$Query$OrderConnection.fromJson(
          json['orders'] as Map<String, dynamic>);

Map<String, dynamic> _$GetHistory$QueryToJson(GetHistory$Query instance) =>
    <String, dynamic>{
      'orders': instance.orders.toJson(),
    };

HistoryOrderItemMixin$OrderEdge$Order$Service$Media
    _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic>
    _$HistoryOrderItemMixin$OrderEdge$Order$Service$MediaToJson(
            HistoryOrderItemMixin$OrderEdge$Order$Service$Media instance) =>
        <String, dynamic>{
          'address': instance.address,
        };

HistoryOrderItemMixin$OrderEdge$Order$Service
    _$HistoryOrderItemMixin$OrderEdge$Order$ServiceFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order$Service()
          ..media =
              HistoryOrderItemMixin$OrderEdge$Order$Service$Media.fromJson(
                  json['media'] as Map<String, dynamic>)
          ..name = json['name'] as String;

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdge$Order$ServiceToJson(
        HistoryOrderItemMixin$OrderEdge$Order$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
    };

HistoryOrderItemMixin$OrderEdge$Order
    _$HistoryOrderItemMixin$OrderEdge$OrderFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order()
          ..id = json['id'] as String
          ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
              unknownValue: OrderStatus.artemisUnknown)
          ..createdOn =
              fromGraphQLTimestampToDartDateTime(json['createdOn'] as int)
          ..addresses = (json['addresses'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          ..currency = json['currency'] as String
          ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
          ..service = HistoryOrderItemMixin$OrderEdge$Order$Service.fromJson(
              json['service'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdge$OrderToJson(
        HistoryOrderItemMixin$OrderEdge$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'createdOn': fromDartDateTimeToGraphQLTimestamp(instance.createdOn),
      'addresses': instance.addresses,
      'currency': instance.currency,
      'costAfterCoupon': instance.costAfterCoupon,
      'service': instance.service.toJson(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.requested: 'Requested',
  OrderStatus.notFound: 'NotFound',
  OrderStatus.noCloseFound: 'NoCloseFound',
  OrderStatus.found: 'Found',
  OrderStatus.driverAccepted: 'DriverAccepted',
  OrderStatus.arrived: 'Arrived',
  OrderStatus.waitingForPrePay: 'WaitingForPrePay',
  OrderStatus.driverCanceled: 'DriverCanceled',
  OrderStatus.riderCanceled: 'RiderCanceled',
  OrderStatus.started: 'Started',
  OrderStatus.waitingForPostPay: 'WaitingForPostPay',
  OrderStatus.waitingForReview: 'WaitingForReview',
  OrderStatus.finished: 'Finished',
  OrderStatus.booked: 'Booked',
  OrderStatus.expired: 'Expired',
  OrderStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

HistoryOrderItemMixin$OrderEdge _$HistoryOrderItemMixin$OrderEdgeFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderItemMixin$OrderEdge()
      ..node = HistoryOrderItemMixin$OrderEdge$Order.fromJson(
          json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdgeToJson(
        HistoryOrderItemMixin$OrderEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

HistoryOrderItemMixin$PageInfo _$HistoryOrderItemMixin$PageInfoFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderItemMixin$PageInfo()
      ..hasNextPage = json['hasNextPage'] as bool?
      ..endCursor = fromGraphQLConnectionCursorNullableToDartStringNullable(
          json['endCursor'] as String?)
      ..startCursor = fromGraphQLConnectionCursorNullableToDartStringNullable(
          json['startCursor'] as String?)
      ..hasPreviousPage = json['hasPreviousPage'] as bool?;

Map<String, dynamic> _$HistoryOrderItemMixin$PageInfoToJson(
    HistoryOrderItemMixin$PageInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hasNextPage', instance.hasNextPage);
  writeNotNull(
      'endCursor',
      fromDartStringNullableToGraphQLConnectionCursorNullable(
          instance.endCursor));
  writeNotNull(
      'startCursor',
      fromDartStringNullableToGraphQLConnectionCursorNullable(
          instance.startCursor));
  writeNotNull('hasPreviousPage', instance.hasPreviousPage);
  return val;
}

GetOrderDetails$Query$Order$Point _$GetOrderDetails$Query$Order$PointFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetails$Query$Order$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetOrderDetails$Query$Order$PointToJson(
        GetOrderDetails$Query$Order$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetOrderDetails$Query$Order$Driver$Media
    _$GetOrderDetails$Query$Order$Driver$MediaFromJson(
            Map<String, dynamic> json) =>
        GetOrderDetails$Query$Order$Driver$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$GetOrderDetails$Query$Order$Driver$MediaToJson(
        GetOrderDetails$Query$Order$Driver$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

GetOrderDetails$Query$Order$Driver$CarModel
    _$GetOrderDetails$Query$Order$Driver$CarModelFromJson(
            Map<String, dynamic> json) =>
        GetOrderDetails$Query$Order$Driver$CarModel()
          ..name = json['name'] as String;

Map<String, dynamic> _$GetOrderDetails$Query$Order$Driver$CarModelToJson(
        GetOrderDetails$Query$Order$Driver$CarModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

GetOrderDetails$Query$Order$Driver _$GetOrderDetails$Query$Order$DriverFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetails$Query$Order$Driver()
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..rating = json['rating'] as int?
      ..carPlate = json['carPlate'] as String?
      ..media = json['media'] == null
          ? null
          : GetOrderDetails$Query$Order$Driver$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..car = json['car'] == null
          ? null
          : GetOrderDetails$Query$Order$Driver$CarModel.fromJson(
              json['car'] as Map<String, dynamic>);

Map<String, dynamic> _$GetOrderDetails$Query$Order$DriverToJson(
    GetOrderDetails$Query$Order$Driver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('rating', instance.rating);
  writeNotNull('carPlate', instance.carPlate);
  writeNotNull('media', instance.media?.toJson());
  writeNotNull('car', instance.car?.toJson());
  return val;
}

GetOrderDetails$Query$Order$Service$Media
    _$GetOrderDetails$Query$Order$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        GetOrderDetails$Query$Order$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$GetOrderDetails$Query$Order$Service$MediaToJson(
        GetOrderDetails$Query$Order$Service$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

GetOrderDetails$Query$Order$Service
    _$GetOrderDetails$Query$Order$ServiceFromJson(Map<String, dynamic> json) =>
        GetOrderDetails$Query$Order$Service()
          ..name = json['name'] as String
          ..media = GetOrderDetails$Query$Order$Service$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetOrderDetails$Query$Order$ServiceToJson(
        GetOrderDetails$Query$Order$Service instance) =>
    <String, dynamic>{
      'name': instance.name,
      'media': instance.media.toJson(),
    };

GetOrderDetails$Query$Order$PaymentGateway$Media
    _$GetOrderDetails$Query$Order$PaymentGateway$MediaFromJson(
            Map<String, dynamic> json) =>
        GetOrderDetails$Query$Order$PaymentGateway$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$GetOrderDetails$Query$Order$PaymentGateway$MediaToJson(
        GetOrderDetails$Query$Order$PaymentGateway$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

GetOrderDetails$Query$Order$PaymentGateway
    _$GetOrderDetails$Query$Order$PaymentGatewayFromJson(
            Map<String, dynamic> json) =>
        GetOrderDetails$Query$Order$PaymentGateway()
          ..title = json['title'] as String
          ..media = json['media'] == null
              ? null
              : GetOrderDetails$Query$Order$PaymentGateway$Media.fromJson(
                  json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$GetOrderDetails$Query$Order$PaymentGatewayToJson(
    GetOrderDetails$Query$Order$PaymentGateway instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('media', instance.media?.toJson());
  return val;
}

GetOrderDetails$Query$Order _$GetOrderDetails$Query$OrderFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetails$Query$Order()
      ..points = (json['points'] as List<dynamic>)
          .map((e) => GetOrderDetails$Query$Order$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..currency = json['currency'] as String
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..finishTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['finishTimestamp'] as int?)
      ..expectedTimestamp =
          fromGraphQLTimestampToDartDateTime(json['expectedTimestamp'] as int)
      ..driver = json['driver'] == null
          ? null
          : GetOrderDetails$Query$Order$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = GetOrderDetails$Query$Order$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..paymentGateway = json['paymentGateway'] == null
          ? null
          : GetOrderDetails$Query$Order$PaymentGateway.fromJson(
              json['paymentGateway'] as Map<String, dynamic>);

Map<String, dynamic> _$GetOrderDetails$Query$OrderToJson(
    GetOrderDetails$Query$Order instance) {
  final val = <String, dynamic>{
    'points': instance.points.map((e) => e.toJson()).toList(),
    'addresses': instance.addresses,
    'costAfterCoupon': instance.costAfterCoupon,
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  writeNotNull(
      'finishTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.finishTimestamp));
  val['expectedTimestamp'] =
      fromDartDateTimeToGraphQLTimestamp(instance.expectedTimestamp);
  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull('paymentGateway', instance.paymentGateway?.toJson());
  return val;
}

GetOrderDetails$Query _$GetOrderDetails$QueryFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetails$Query()
      ..order = json['order'] == null
          ? null
          : GetOrderDetails$Query$Order.fromJson(
              json['order'] as Map<String, dynamic>);

Map<String, dynamic> _$GetOrderDetails$QueryToJson(
    GetOrderDetails$Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order', instance.order?.toJson());
  return val;
}

CancelBooking$Mutation$Order _$CancelBooking$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    CancelBooking$Mutation$Order()..id = json['id'] as String;

Map<String, dynamic> _$CancelBooking$Mutation$OrderToJson(
        CancelBooking$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CancelBooking$Mutation _$CancelBooking$MutationFromJson(
        Map<String, dynamic> json) =>
    CancelBooking$Mutation()
      ..cancelBooking = CancelBooking$Mutation$Order.fromJson(
          json['cancelBooking'] as Map<String, dynamic>);

Map<String, dynamic> _$CancelBooking$MutationToJson(
        CancelBooking$Mutation instance) =>
    <String, dynamic>{
      'cancelBooking': instance.cancelBooking.toJson(),
    };

SubmitComplaint$Mutation$Complaint _$SubmitComplaint$Mutation$ComplaintFromJson(
        Map<String, dynamic> json) =>
    SubmitComplaint$Mutation$Complaint()..id = json['id'] as String;

Map<String, dynamic> _$SubmitComplaint$Mutation$ComplaintToJson(
        SubmitComplaint$Mutation$Complaint instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

SubmitComplaint$Mutation _$SubmitComplaint$MutationFromJson(
        Map<String, dynamic> json) =>
    SubmitComplaint$Mutation()
      ..createOneComplaint = SubmitComplaint$Mutation$Complaint.fromJson(
          json['createOneComplaint'] as Map<String, dynamic>);

Map<String, dynamic> _$SubmitComplaint$MutationToJson(
        SubmitComplaint$Mutation instance) =>
    <String, dynamic>{
      'createOneComplaint': instance.createOneComplaint.toJson(),
    };

Wallet$Query$RiderWallet _$Wallet$Query$RiderWalletFromJson(
        Map<String, dynamic> json) =>
    Wallet$Query$RiderWallet()
      ..id = json['id'] as String
      ..balance = (json['balance'] as num).toDouble()
      ..currency = json['currency'] as String;

Map<String, dynamic> _$Wallet$Query$RiderWalletToJson(
        Wallet$Query$RiderWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'currency': instance.currency,
    };

Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
    _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion()
          ..createdAt =
              fromGraphQLTimestampToDartDateTime(json['createdAt'] as int)
          ..amount = (json['amount'] as num).toDouble()
          ..currency = json['currency'] as String
          ..refrenceNumber = json['refrenceNumber'] as String?
          ..deductType = $enumDecodeNullable(
              _$RiderDeductTransactionTypeEnumMap, json['deductType'],
              unknownValue: RiderDeductTransactionType.artemisUnknown)
          ..action = $enumDecode(_$TransactionActionEnumMap, json['action'],
              unknownValue: TransactionAction.artemisUnknown)
          ..rechargeType = $enumDecodeNullable(
              _$RiderRechargeTransactionTypeEnumMap, json['rechargeType'],
              unknownValue: RiderRechargeTransactionType.artemisUnknown);

Map<String, dynamic>
    _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacionToJson(
        Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
            instance) {
  final val = <String, dynamic>{
    'createdAt': fromDartDateTimeToGraphQLTimestamp(instance.createdAt),
    'amount': instance.amount,
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refrenceNumber', instance.refrenceNumber);
  writeNotNull(
      'deductType', _$RiderDeductTransactionTypeEnumMap[instance.deductType]);
  val['action'] = _$TransactionActionEnumMap[instance.action]!;
  writeNotNull('rechargeType',
      _$RiderRechargeTransactionTypeEnumMap[instance.rechargeType]);
  return val;
}

const _$RiderDeductTransactionTypeEnumMap = {
  RiderDeductTransactionType.orderFee: 'OrderFee',
  RiderDeductTransactionType.withdraw: 'Withdraw',
  RiderDeductTransactionType.correction: 'Correction',
  RiderDeductTransactionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$TransactionActionEnumMap = {
  TransactionAction.recharge: 'Recharge',
  TransactionAction.deduct: 'Deduct',
  TransactionAction.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$RiderRechargeTransactionTypeEnumMap = {
  RiderRechargeTransactionType.bankTransfer: 'BankTransfer',
  RiderRechargeTransactionType.gift: 'Gift',
  RiderRechargeTransactionType.correction: 'Correction',
  RiderRechargeTransactionType.inAppPayment: 'InAppPayment',
  RiderRechargeTransactionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Wallet$Query$RiderTransacionConnection$RiderTransacionEdge
    _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$RiderTransacionConnection$RiderTransacionEdge()
          ..node =
              Wallet$Query$RiderTransacionConnection$RiderTransacionEdge$RiderTransacion
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String,
    dynamic> _$Wallet$Query$RiderTransacionConnection$RiderTransacionEdgeToJson(
        Wallet$Query$RiderTransacionConnection$RiderTransacionEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

Wallet$Query$RiderTransacionConnection
    _$Wallet$Query$RiderTransacionConnectionFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$RiderTransacionConnection()
          ..edges = (json['edges'] as List<dynamic>)
              .map((e) =>
                  Wallet$Query$RiderTransacionConnection$RiderTransacionEdge
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$Wallet$Query$RiderTransacionConnectionToJson(
        Wallet$Query$RiderTransacionConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

Wallet$Query _$Wallet$QueryFromJson(Map<String, dynamic> json) => Wallet$Query()
  ..riderWallets = (json['riderWallets'] as List<dynamic>)
      .map((e) => Wallet$Query$RiderWallet.fromJson(e as Map<String, dynamic>))
      .toList()
  ..riderTransacions = Wallet$Query$RiderTransacionConnection.fromJson(
      json['riderTransacions'] as Map<String, dynamic>);

Map<String, dynamic> _$Wallet$QueryToJson(Wallet$Query instance) =>
    <String, dynamic>{
      'riderWallets': instance.riderWallets.map((e) => e.toJson()).toList(),
      'riderTransacions': instance.riderTransacions.toJson(),
    };

PaymentGateways$Query$PaymentGateway$Media
    _$PaymentGateways$Query$PaymentGateway$MediaFromJson(
            Map<String, dynamic> json) =>
        PaymentGateways$Query$PaymentGateway$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$PaymentGateways$Query$PaymentGateway$MediaToJson(
        PaymentGateways$Query$PaymentGateway$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

PaymentGateways$Query$PaymentGateway
    _$PaymentGateways$Query$PaymentGatewayFromJson(Map<String, dynamic> json) =>
        PaymentGateways$Query$PaymentGateway()
          ..id = json['id'] as String
          ..title = json['title'] as String
          ..type = $enumDecode(_$PaymentGatewayTypeEnumMap, json['type'],
              unknownValue: PaymentGatewayType.artemisUnknown)
          ..publicKey = json['publicKey'] as String?
          ..media = json['media'] == null
              ? null
              : PaymentGateways$Query$PaymentGateway$Media.fromJson(
                  json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentGateways$Query$PaymentGatewayToJson(
    PaymentGateways$Query$PaymentGateway instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'type': _$PaymentGatewayTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('publicKey', instance.publicKey);
  writeNotNull('media', instance.media?.toJson());
  return val;
}

const _$PaymentGatewayTypeEnumMap = {
  PaymentGatewayType.stripe: 'Stripe',
  PaymentGatewayType.brainTree: 'BrainTree',
  PaymentGatewayType.payPal: 'PayPal',
  PaymentGatewayType.paytm: 'Paytm',
  PaymentGatewayType.razorpay: 'Razorpay',
  PaymentGatewayType.paystack: 'Paystack',
  PaymentGatewayType.payU: 'PayU',
  PaymentGatewayType.instamojo: 'Instamojo',
  PaymentGatewayType.flutterwave: 'Flutterwave',
  PaymentGatewayType.payGate: 'PayGate',
  PaymentGatewayType.mips: 'MIPS',
  PaymentGatewayType.mercadoPago: 'MercadoPago',
  PaymentGatewayType.amazonPaymentServices: 'AmazonPaymentServices',
  PaymentGatewayType.myTMoney: 'MyTMoney',
  PaymentGatewayType.wayForPay: 'WayForPay',
  PaymentGatewayType.myFatoorah: 'MyFatoorah',
  PaymentGatewayType.sberBank: 'SberBank',
  PaymentGatewayType.customLink: 'CustomLink',
  PaymentGatewayType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

PaymentGateways$Query _$PaymentGateways$QueryFromJson(
        Map<String, dynamic> json) =>
    PaymentGateways$Query()
      ..paymentGateways = (json['paymentGateways'] as List<dynamic>)
          .map((e) => PaymentGateways$Query$PaymentGateway.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PaymentGateways$QueryToJson(
        PaymentGateways$Query instance) =>
    <String, dynamic>{
      'paymentGateways':
          instance.paymentGateways.map((e) => e.toJson()).toList(),
    };

PayForRide$Query$PaymentGateway$Media
    _$PayForRide$Query$PaymentGateway$MediaFromJson(
            Map<String, dynamic> json) =>
        PayForRide$Query$PaymentGateway$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$PayForRide$Query$PaymentGateway$MediaToJson(
        PayForRide$Query$PaymentGateway$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

PayForRide$Query$PaymentGateway _$PayForRide$Query$PaymentGatewayFromJson(
        Map<String, dynamic> json) =>
    PayForRide$Query$PaymentGateway()
      ..id = json['id'] as String
      ..title = json['title'] as String
      ..type = $enumDecode(_$PaymentGatewayTypeEnumMap, json['type'],
          unknownValue: PaymentGatewayType.artemisUnknown)
      ..publicKey = json['publicKey'] as String?
      ..media = json['media'] == null
          ? null
          : PayForRide$Query$PaymentGateway$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$PayForRide$Query$PaymentGatewayToJson(
    PayForRide$Query$PaymentGateway instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'type': _$PaymentGatewayTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('publicKey', instance.publicKey);
  writeNotNull('media', instance.media?.toJson());
  return val;
}

PayForRide$Query$RiderWallet _$PayForRide$Query$RiderWalletFromJson(
        Map<String, dynamic> json) =>
    PayForRide$Query$RiderWallet()
      ..id = json['id'] as String
      ..balance = (json['balance'] as num).toDouble()
      ..currency = json['currency'] as String;

Map<String, dynamic> _$PayForRide$Query$RiderWalletToJson(
        PayForRide$Query$RiderWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'currency': instance.currency,
    };

PayForRide$Query _$PayForRide$QueryFromJson(Map<String, dynamic> json) =>
    PayForRide$Query()
      ..paymentGateways = (json['paymentGateways'] as List<dynamic>)
          .map((e) => PayForRide$Query$PaymentGateway.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..riderWallets = (json['riderWallets'] as List<dynamic>)
          .map((e) =>
              PayForRide$Query$RiderWallet.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PayForRide$QueryToJson(PayForRide$Query instance) =>
    <String, dynamic>{
      'paymentGateways':
          instance.paymentGateways.map((e) => e.toJson()).toList(),
      'riderWallets': instance.riderWallets.map((e) => e.toJson()).toList(),
    };

PayRide$Mutation$TopUpWalletResponse
    _$PayRide$Mutation$TopUpWalletResponseFromJson(Map<String, dynamic> json) =>
        PayRide$Mutation$TopUpWalletResponse()
          ..status = $enumDecode(_$TopUpWalletStatusEnumMap, json['status'],
              unknownValue: TopUpWalletStatus.artemisUnknown)
          ..url = json['url'] as String;

Map<String, dynamic> _$PayRide$Mutation$TopUpWalletResponseToJson(
        PayRide$Mutation$TopUpWalletResponse instance) =>
    <String, dynamic>{
      'status': _$TopUpWalletStatusEnumMap[instance.status]!,
      'url': instance.url,
    };

const _$TopUpWalletStatusEnumMap = {
  TopUpWalletStatus.ok: 'OK',
  TopUpWalletStatus.redirect: 'Redirect',
  TopUpWalletStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

PayRide$Mutation$Order _$PayRide$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    PayRide$Mutation$Order()..id = json['id'] as String;

Map<String, dynamic> _$PayRide$Mutation$OrderToJson(
        PayRide$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

PayRide$Mutation _$PayRide$MutationFromJson(Map<String, dynamic> json) =>
    PayRide$Mutation()
      ..topUpWallet = PayRide$Mutation$TopUpWalletResponse.fromJson(
          json['topUpWallet'] as Map<String, dynamic>)
      ..updateOneOrder = PayRide$Mutation$Order.fromJson(
          json['updateOneOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$PayRide$MutationToJson(PayRide$Mutation instance) =>
    <String, dynamic>{
      'topUpWallet': instance.topUpWallet.toJson(),
      'updateOneOrder': instance.updateOneOrder.toJson(),
    };

TopUpWalletInput _$TopUpWalletInputFromJson(Map<String, dynamic> json) =>
    TopUpWalletInput(
      gatewayId: json['gatewayId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      token: json['token'] as String?,
      pin: (json['pin'] as num?)?.toDouble(),
      otp: (json['otp'] as num?)?.toDouble(),
      transactionId: json['transactionId'] as String?,
      orderNumber: json['orderNumber'] as String?,
    );

Map<String, dynamic> _$TopUpWalletInputToJson(TopUpWalletInput instance) {
  final val = <String, dynamic>{
    'gatewayId': instance.gatewayId,
    'amount': instance.amount,
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  writeNotNull('pin', instance.pin);
  writeNotNull('otp', instance.otp);
  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('orderNumber', instance.orderNumber);
  return val;
}

TopUpWallet$Mutation$TopUpWalletResponse
    _$TopUpWallet$Mutation$TopUpWalletResponseFromJson(
            Map<String, dynamic> json) =>
        TopUpWallet$Mutation$TopUpWalletResponse()
          ..status = $enumDecode(_$TopUpWalletStatusEnumMap, json['status'],
              unknownValue: TopUpWalletStatus.artemisUnknown)
          ..url = json['url'] as String;

Map<String, dynamic> _$TopUpWallet$Mutation$TopUpWalletResponseToJson(
        TopUpWallet$Mutation$TopUpWalletResponse instance) =>
    <String, dynamic>{
      'status': _$TopUpWalletStatusEnumMap[instance.status]!,
      'url': instance.url,
    };

TopUpWallet$Mutation _$TopUpWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    TopUpWallet$Mutation()
      ..topUpWallet = TopUpWallet$Mutation$TopUpWalletResponse.fromJson(
          json['topUpWallet'] as Map<String, dynamic>);

Map<String, dynamic> _$TopUpWallet$MutationToJson(
        TopUpWallet$Mutation instance) =>
    <String, dynamic>{
      'topUpWallet': instance.topUpWallet.toJson(),
    };

GetCurrentOrder$Query$Rider$Media _$GetCurrentOrder$Query$Rider$MediaFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query$Rider$Media()..address = json['address'] as String;

Map<String, dynamic> _$GetCurrentOrder$Query$Rider$MediaToJson(
        GetCurrentOrder$Query$Rider$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

GetCurrentOrder$Query$Rider$Order _$GetCurrentOrder$Query$Rider$OrderFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query$Rider$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$GetCurrentOrder$Query$Rider$OrderToJson(
    GetCurrentOrder$Query$Rider$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate
    _$GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregateFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate()
          ..id = json['id'] as int?;

Map<String, dynamic>
    _$GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregateToJson(
        GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

GetCurrentOrder$Query$Rider$BookedOrders
    _$GetCurrentOrder$Query$Rider$BookedOrdersFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$Rider$BookedOrders()
          ..count = json['count'] == null
              ? null
              : GetCurrentOrder$Query$Rider$BookedOrders$RiderOrdersCountAggregate
                  .fromJson(json['count'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCurrentOrder$Query$Rider$BookedOrdersToJson(
    GetCurrentOrder$Query$Rider$BookedOrders instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count?.toJson());
  return val;
}

GetCurrentOrder$Query$Rider _$GetCurrentOrder$Query$RiderFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query$Rider()
      ..id = json['id'] as String
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..gender = $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown)
      ..email = json['email'] as String?
      ..media = json['media'] == null
          ? null
          : GetCurrentOrder$Query$Rider$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..orders = (json['orders'] as List<dynamic>)
          .map((e) => GetCurrentOrder$Query$Rider$Order.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..bookedOrders = (json['bookedOrders'] as List<dynamic>)
          .map((e) => GetCurrentOrder$Query$Rider$BookedOrders.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCurrentOrder$Query$RiderToJson(
    GetCurrentOrder$Query$Rider instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'mobileNumber': instance.mobileNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('gender', _$GenderEnumMap[instance.gender]);
  writeNotNull('email', instance.email);
  writeNotNull('media', instance.media?.toJson());
  val['orders'] = instance.orders.map((e) => e.toJson()).toList();
  val['bookedOrders'] = instance.bookedOrders.map((e) => e.toJson()).toList();
  return val;
}

GetCurrentOrder$Query$Point _$GetCurrentOrder$Query$PointFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetCurrentOrder$Query$PointToJson(
        GetCurrentOrder$Query$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetCurrentOrder$Query _$GetCurrentOrder$QueryFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query()
      ..rider = json['rider'] == null
          ? null
          : GetCurrentOrder$Query$Rider.fromJson(
              json['rider'] as Map<String, dynamic>)
      ..requireUpdate = $enumDecode(
          _$VersionStatusEnumMap, json['requireUpdate'],
          unknownValue: VersionStatus.artemisUnknown)
      ..getCurrentOrderDriverLocation = json['getCurrentOrderDriverLocation'] ==
              null
          ? null
          : GetCurrentOrder$Query$Point.fromJson(
              json['getCurrentOrderDriverLocation'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCurrentOrder$QueryToJson(
    GetCurrentOrder$Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rider', instance.rider?.toJson());
  val['requireUpdate'] = _$VersionStatusEnumMap[instance.requireUpdate]!;
  writeNotNull('getCurrentOrderDriverLocation',
      instance.getCurrentOrderDriverLocation?.toJson());
  return val;
}

const _$VersionStatusEnumMap = {
  VersionStatus.latest: 'Latest',
  VersionStatus.mandatoryUpdate: 'MandatoryUpdate',
  VersionStatus.optionalUpdate: 'OptionalUpdate',
  VersionStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CurrentOrderMixin$Point _$CurrentOrderMixin$PointFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$CurrentOrderMixin$PointToJson(
        CurrentOrderMixin$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CurrentOrderMixin$Driver$Media _$CurrentOrderMixin$Driver$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$MediaToJson(
        CurrentOrderMixin$Driver$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Driver$CarModel _$CurrentOrderMixin$Driver$CarModelFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$CarModel()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$CarModelToJson(
        CurrentOrderMixin$Driver$CarModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$Driver$CarColor _$CurrentOrderMixin$Driver$CarColorFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$CarColor()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$CarColorToJson(
        CurrentOrderMixin$Driver$CarColor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$Driver _$CurrentOrderMixin$DriverFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver()
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..media = json['media'] == null
          ? null
          : CurrentOrderMixin$Driver$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..mobileNumber = json['mobileNumber'] as String
      ..carPlate = json['carPlate'] as String?
      ..car = json['car'] == null
          ? null
          : CurrentOrderMixin$Driver$CarModel.fromJson(
              json['car'] as Map<String, dynamic>)
      ..carColor = json['carColor'] == null
          ? null
          : CurrentOrderMixin$Driver$CarColor.fromJson(
              json['carColor'] as Map<String, dynamic>)
      ..rating = json['rating'] as int?;

Map<String, dynamic> _$CurrentOrderMixin$DriverToJson(
    CurrentOrderMixin$Driver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('media', instance.media?.toJson());
  val['mobileNumber'] = instance.mobileNumber;
  writeNotNull('carPlate', instance.carPlate);
  writeNotNull('car', instance.car?.toJson());
  writeNotNull('carColor', instance.carColor?.toJson());
  writeNotNull('rating', instance.rating);
  return val;
}

CurrentOrderMixin$Service$Media _$CurrentOrderMixin$Service$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Service$MediaToJson(
        CurrentOrderMixin$Service$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Service _$CurrentOrderMixin$ServiceFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service()
      ..media = CurrentOrderMixin$Service$Media.fromJson(
          json['media'] as Map<String, dynamic>)
      ..name = json['name'] as String
      ..prepayPercent = json['prepayPercent'] as int
      ..cancellationTotalFee = (json['cancellationTotalFee'] as num).toDouble();

Map<String, dynamic> _$CurrentOrderMixin$ServiceToJson(
        CurrentOrderMixin$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
      'prepayPercent': instance.prepayPercent,
      'cancellationTotalFee': instance.cancellationTotalFee,
    };

CreateOrder$Mutation$Order _$CreateOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$CreateOrder$Mutation$OrderToJson(
    CreateOrder$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

CreateOrder$Mutation$Rider _$CreateOrder$Mutation$RiderFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation$Rider()..id = json['id'] as String;

Map<String, dynamic> _$CreateOrder$Mutation$RiderToJson(
        CreateOrder$Mutation$Rider instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateOrder$Mutation _$CreateOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation()
      ..createOrder = CreateOrder$Mutation$Order.fromJson(
          json['createOrder'] as Map<String, dynamic>)
      ..updateOneRider = CreateOrder$Mutation$Rider.fromJson(
          json['updateOneRider'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateOrder$MutationToJson(
        CreateOrder$Mutation instance) =>
    <String, dynamic>{
      'createOrder': instance.createOrder.toJson(),
      'updateOneRider': instance.updateOneRider.toJson(),
    };

CreateOrderInput _$CreateOrderInputFromJson(Map<String, dynamic> json) =>
    CreateOrderInput(
      serviceId: json['serviceId'] as int,
      intervalMinutes: json['intervalMinutes'] as int,
      points: (json['points'] as List<dynamic>)
          .map((e) => PointInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      addresses:
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList(),
      twoWay: json['twoWay'] as bool?,
      optionIds: (json['optionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$CreateOrderInputToJson(CreateOrderInput instance) {
  final val = <String, dynamic>{
    'serviceId': instance.serviceId,
    'intervalMinutes': instance.intervalMinutes,
    'points': instance.points.map((e) => e.toJson()).toList(),
    'addresses': instance.addresses,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('twoWay', instance.twoWay);
  writeNotNull('optionIds', instance.optionIds);
  writeNotNull('couponCode', instance.couponCode);
  return val;
}

CancelOrder$Mutation$Order _$CancelOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    CancelOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$CancelOrder$Mutation$OrderToJson(
    CancelOrder$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

CancelOrder$Mutation _$CancelOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    CancelOrder$Mutation()
      ..cancelOrder = CancelOrder$Mutation$Order.fromJson(
          json['cancelOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$CancelOrder$MutationToJson(
        CancelOrder$Mutation instance) =>
    <String, dynamic>{
      'cancelOrder': instance.cancelOrder.toJson(),
    };

UpdateOrder$Mutation$Order _$UpdateOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    UpdateOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$UpdateOrder$Mutation$OrderToJson(
    UpdateOrder$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

UpdateOrder$Mutation _$UpdateOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateOrder$Mutation()
      ..updateOneOrder = UpdateOrder$Mutation$Order.fromJson(
          json['updateOneOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateOrder$MutationToJson(
        UpdateOrder$Mutation instance) =>
    <String, dynamic>{
      'updateOneOrder': instance.updateOneOrder.toJson(),
    };

UpdateOrderInput _$UpdateOrderInputFromJson(Map<String, dynamic> json) =>
    UpdateOrderInput(
      waitMinutes: json['waitMinutes'] as int?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown),
      tipAmount: (json['tipAmount'] as num?)?.toDouble(),
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$UpdateOrderInputToJson(UpdateOrderInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('waitMinutes', instance.waitMinutes);
  writeNotNull('status', _$OrderStatusEnumMap[instance.status]);
  writeNotNull('tipAmount', instance.tipAmount);
  writeNotNull('couponCode', instance.couponCode);
  return val;
}

UpdatedOrder$Subscription$Order$Point
    _$UpdatedOrder$Subscription$Order$PointFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$PointToJson(
        UpdatedOrder$Subscription$Order$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UpdatedOrder$Subscription$Order$Driver$Media
    _$UpdatedOrder$Subscription$Order$Driver$MediaFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$MediaToJson(
        UpdatedOrder$Subscription$Order$Driver$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

UpdatedOrder$Subscription$Order$Driver$CarModel
    _$UpdatedOrder$Subscription$Order$Driver$CarModelFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$CarModel()
          ..name = json['name'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$CarModelToJson(
        UpdatedOrder$Subscription$Order$Driver$CarModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UpdatedOrder$Subscription$Order$Driver$CarColor
    _$UpdatedOrder$Subscription$Order$Driver$CarColorFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$CarColor()
          ..name = json['name'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$CarColorToJson(
        UpdatedOrder$Subscription$Order$Driver$CarColor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UpdatedOrder$Subscription$Order$Driver
    _$UpdatedOrder$Subscription$Order$DriverFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver()
          ..firstName = json['firstName'] as String?
          ..lastName = json['lastName'] as String?
          ..media = json['media'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$Media.fromJson(
                  json['media'] as Map<String, dynamic>)
          ..mobileNumber = json['mobileNumber'] as String
          ..carPlate = json['carPlate'] as String?
          ..car = json['car'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$CarModel.fromJson(
                  json['car'] as Map<String, dynamic>)
          ..carColor = json['carColor'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$CarColor.fromJson(
                  json['carColor'] as Map<String, dynamic>)
          ..rating = json['rating'] as int?;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$DriverToJson(
    UpdatedOrder$Subscription$Order$Driver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('media', instance.media?.toJson());
  val['mobileNumber'] = instance.mobileNumber;
  writeNotNull('carPlate', instance.carPlate);
  writeNotNull('car', instance.car?.toJson());
  writeNotNull('carColor', instance.carColor?.toJson());
  writeNotNull('rating', instance.rating);
  return val;
}

UpdatedOrder$Subscription$Order$Service$Media
    _$UpdatedOrder$Subscription$Order$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Service$MediaToJson(
        UpdatedOrder$Subscription$Order$Service$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

UpdatedOrder$Subscription$Order$Service
    _$UpdatedOrder$Subscription$Order$ServiceFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Service()
          ..media = UpdatedOrder$Subscription$Order$Service$Media.fromJson(
              json['media'] as Map<String, dynamic>)
          ..name = json['name'] as String
          ..prepayPercent = json['prepayPercent'] as int
          ..cancellationTotalFee =
              (json['cancellationTotalFee'] as num).toDouble();

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$ServiceToJson(
        UpdatedOrder$Subscription$Order$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
      'prepayPercent': instance.prepayPercent,
      'cancellationTotalFee': instance.cancellationTotalFee,
    };

UpdatedOrder$Subscription$Order _$UpdatedOrder$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    UpdatedOrder$Subscription$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) => UpdatedOrder$Subscription$Order$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : UpdatedOrder$Subscription$Order$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) => UpdatedOrder$Subscription$Order$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..service = UpdatedOrder$Subscription$Order$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..durationBest = json['durationBest'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int;

Map<String, dynamic> _$UpdatedOrder$Subscription$OrderToJson(
    UpdatedOrder$Subscription$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  val['service'] = instance.service.toJson();
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['durationBest'] = instance.durationBest;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  return val;
}

UpdatedOrder$Subscription _$UpdatedOrder$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    UpdatedOrder$Subscription()
      ..orderUpdated = UpdatedOrder$Subscription$Order.fromJson(
          json['orderUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdatedOrder$SubscriptionToJson(
        UpdatedOrder$Subscription instance) =>
    <String, dynamic>{
      'orderUpdated': instance.orderUpdated.toJson(),
    };

DriverLocationUpdated$Subscription$Point
    _$DriverLocationUpdated$Subscription$PointFromJson(
            Map<String, dynamic> json) =>
        DriverLocationUpdated$Subscription$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$DriverLocationUpdated$Subscription$PointToJson(
        DriverLocationUpdated$Subscription$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

DriverLocationUpdated$Subscription _$DriverLocationUpdated$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    DriverLocationUpdated$Subscription()
      ..driverLocationUpdated =
          DriverLocationUpdated$Subscription$Point.fromJson(
              json['driverLocationUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$DriverLocationUpdated$SubscriptionToJson(
        DriverLocationUpdated$Subscription instance) =>
    <String, dynamic>{
      'driverLocationUpdated': instance.driverLocationUpdated.toJson(),
    };

SubmitFeedback$Mutation$Order _$SubmitFeedback$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedback$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$SubmitFeedback$Mutation$OrderToJson(
    SubmitFeedback$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

SubmitFeedback$Mutation _$SubmitFeedback$MutationFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedback$Mutation()
      ..submitReview = SubmitFeedback$Mutation$Order.fromJson(
          json['submitReview'] as Map<String, dynamic>);

Map<String, dynamic> _$SubmitFeedback$MutationToJson(
        SubmitFeedback$Mutation instance) =>
    <String, dynamic>{
      'submitReview': instance.submitReview.toJson(),
    };

GetDriversLocation$Query$Point _$GetDriversLocation$Query$PointFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocation$Query$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetDriversLocation$Query$PointToJson(
        GetDriversLocation$Query$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetDriversLocation$Query _$GetDriversLocation$QueryFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocation$Query()
      ..getDriversLocation = (json['getDriversLocation'] as List<dynamic>)
          .map((e) => GetDriversLocation$Query$Point.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetDriversLocation$QueryToJson(
        GetDriversLocation$Query instance) =>
    <String, dynamic>{
      'getDriversLocation':
          instance.getDriversLocation.map((e) => e.toJson()).toList(),
    };

GetReviewParameters$Query$FeedbackParameter
    _$GetReviewParameters$Query$FeedbackParameterFromJson(
            Map<String, dynamic> json) =>
        GetReviewParameters$Query$FeedbackParameter()
          ..id = json['id'] as String
          ..title = json['title'] as String
          ..isGood = json['isGood'] as bool;

Map<String, dynamic> _$GetReviewParameters$Query$FeedbackParameterToJson(
        GetReviewParameters$Query$FeedbackParameter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isGood': instance.isGood,
    };

GetReviewParameters$Query _$GetReviewParameters$QueryFromJson(
        Map<String, dynamic> json) =>
    GetReviewParameters$Query()
      ..feedbackParameters = (json['feedbackParameters'] as List<dynamic>)
          .map((e) => GetReviewParameters$Query$FeedbackParameter.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetReviewParameters$QueryToJson(
        GetReviewParameters$Query instance) =>
    <String, dynamic>{
      'feedbackParameters':
          instance.feedbackParameters.map((e) => e.toJson()).toList(),
    };

GetFare$Query$CalculateFareDTO$Point
    _$GetFare$Query$CalculateFareDTO$PointFromJson(Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetFare$Query$CalculateFareDTO$PointToJson(
        GetFare$Query$CalculateFareDTO$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic>
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaToJson(
            GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
                instance) =>
        <String, dynamic>{
          'address': instance.address,
        };

GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..type = $enumDecode(_$ServiceOptionTypeEnumMap, json['type'],
              unknownValue: ServiceOptionType.artemisUnknown)
          ..additionalFee = (json['additionalFee'] as num?)?.toDouble()
          ..icon = $enumDecode(_$ServiceOptionIconEnumMap, json['icon'],
              unknownValue: ServiceOptionIcon.artemisUnknown);

Map<String, dynamic>
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionToJson(
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
            instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'type': _$ServiceOptionTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalFee', instance.additionalFee);
  val['icon'] = _$ServiceOptionIconEnumMap[instance.icon]!;
  return val;
}

const _$ServiceOptionTypeEnumMap = {
  ServiceOptionType.free: 'Free',
  ServiceOptionType.paid: 'Paid',
  ServiceOptionType.twoWay: 'TwoWay',
  ServiceOptionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$ServiceOptionIconEnumMap = {
  ServiceOptionIcon.pet: 'Pet',
  ServiceOptionIcon.twoWay: 'TwoWay',
  ServiceOptionIcon.luggage: 'Luggage',
  ServiceOptionIcon.packageDelivery: 'PackageDelivery',
  ServiceOptionIcon.shopping: 'Shopping',
  ServiceOptionIcon.custom1: 'Custom1',
  ServiceOptionIcon.custom2: 'Custom2',
  ServiceOptionIcon.custom3: 'Custom3',
  ServiceOptionIcon.custom4: 'Custom4',
  ServiceOptionIcon.custom5: 'Custom5',
  ServiceOptionIcon.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetFare$Query$CalculateFareDTO$ServiceCategory$Service
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..description = json['description'] as String?
          ..personCapacity = json['personCapacity'] as int?
          ..prepayPercent = json['prepayPercent'] as int
          ..twoWayAvailable = json['twoWayAvailable'] as bool
          ..media = GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
              .fromJson(json['media'] as Map<String, dynamic>)
          ..options = (json['options'] as List<dynamic>)
              .map((e) =>
                  GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
                      .fromJson(e as Map<String, dynamic>))
              .toList()
          ..cost = (json['cost'] as num).toDouble()
          ..costAfterCoupon = (json['costAfterCoupon'] as num?)?.toDouble();

Map<String, dynamic>
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceToJson(
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('personCapacity', instance.personCapacity);
  val['prepayPercent'] = instance.prepayPercent;
  val['twoWayAvailable'] = instance.twoWayAvailable;
  val['media'] = instance.media.toJson();
  val['options'] = instance.options.map((e) => e.toJson()).toList();
  val['cost'] = instance.cost;
  writeNotNull('costAfterCoupon', instance.costAfterCoupon);
  return val;
}

GetFare$Query$CalculateFareDTO$ServiceCategory
    _$GetFare$Query$CalculateFareDTO$ServiceCategoryFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..services = (json['services'] as List<dynamic>)
              .map((e) => GetFare$Query$CalculateFareDTO$ServiceCategory$Service
                  .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetFare$Query$CalculateFareDTO$ServiceCategoryToJson(
        GetFare$Query$CalculateFareDTO$ServiceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'services': instance.services.map((e) => e.toJson()).toList(),
    };

GetFare$Query$CalculateFareDTO _$GetFare$Query$CalculateFareDTOFromJson(
        Map<String, dynamic> json) =>
    GetFare$Query$CalculateFareDTO()
      ..distance = (json['distance'] as num).toDouble()
      ..duration = (json['duration'] as num).toDouble()
      ..currency = json['currency'] as String
      ..directions = (json['directions'] as List<dynamic>)
          .map((e) => GetFare$Query$CalculateFareDTO$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..services = (json['services'] as List<dynamic>)
          .map((e) => GetFare$Query$CalculateFareDTO$ServiceCategory.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..error = $enumDecodeNullable(_$CalculateFareErrorEnumMap, json['error'],
          unknownValue: CalculateFareError.artemisUnknown);

Map<String, dynamic> _$GetFare$Query$CalculateFareDTOToJson(
    GetFare$Query$CalculateFareDTO instance) {
  final val = <String, dynamic>{
    'distance': instance.distance,
    'duration': instance.duration,
    'currency': instance.currency,
    'directions': instance.directions.map((e) => e.toJson()).toList(),
    'services': instance.services.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', _$CalculateFareErrorEnumMap[instance.error]);
  return val;
}

const _$CalculateFareErrorEnumMap = {
  CalculateFareError.regionUnsupported: 'RegionUnsupported',
  CalculateFareError.noServiceInRegion: 'NoServiceInRegion',
  CalculateFareError.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetFare$Query _$GetFare$QueryFromJson(Map<String, dynamic> json) =>
    GetFare$Query()
      ..getFare = GetFare$Query$CalculateFareDTO.fromJson(
          json['getFare'] as Map<String, dynamic>);

Map<String, dynamic> _$GetFare$QueryToJson(GetFare$Query instance) =>
    <String, dynamic>{
      'getFare': instance.getFare.toJson(),
    };

ApplyCoupon$Mutation$Order _$ApplyCoupon$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    ApplyCoupon$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$ApplyCoupon$Mutation$OrderToJson(
    ApplyCoupon$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

ApplyCoupon$Mutation _$ApplyCoupon$MutationFromJson(
        Map<String, dynamic> json) =>
    ApplyCoupon$Mutation()
      ..applyCoupon = ApplyCoupon$Mutation$Order.fromJson(
          json['applyCoupon'] as Map<String, dynamic>);

Map<String, dynamic> _$ApplyCoupon$MutationToJson(
        ApplyCoupon$Mutation instance) =>
    <String, dynamic>{
      'applyCoupon': instance.applyCoupon.toJson(),
    };

SendSOS$Mutation$Sos _$SendSOS$Mutation$SosFromJson(
        Map<String, dynamic> json) =>
    SendSOS$Mutation$Sos()..id = json['id'] as String;

Map<String, dynamic> _$SendSOS$Mutation$SosToJson(
        SendSOS$Mutation$Sos instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

SendSOS$Mutation _$SendSOS$MutationFromJson(Map<String, dynamic> json) =>
    SendSOS$Mutation()
      ..sosSignal = SendSOS$Mutation$Sos.fromJson(
          json['sosSignal'] as Map<String, dynamic>);

Map<String, dynamic> _$SendSOS$MutationToJson(SendSOS$Mutation instance) =>
    <String, dynamic>{
      'sosSignal': instance.sosSignal.toJson(),
    };

Login$Mutation$Login _$Login$Mutation$LoginFromJson(
        Map<String, dynamic> json) =>
    Login$Mutation$Login()..jwtToken = json['jwtToken'] as String;

Map<String, dynamic> _$Login$Mutation$LoginToJson(
        Login$Mutation$Login instance) =>
    <String, dynamic>{
      'jwtToken': instance.jwtToken,
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) =>
    Login$Mutation()
      ..login =
          Login$Mutation$Login.fromJson(json['login'] as Map<String, dynamic>);

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login.toJson(),
    };

SendMessageArguments _$SendMessageArgumentsFromJson(
        Map<String, dynamic> json) =>
    SendMessageArguments(
      requestId: json['requestId'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$SendMessageArgumentsToJson(
        SendMessageArguments instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'content': instance.content,
    };

UpdateProfileArguments _$UpdateProfileArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileArguments(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UpdateProfileArgumentsToJson(
    UpdateProfileArguments instance) {
  final val = <String, dynamic>{
    'firstName': instance.firstName,
    'lastName': instance.lastName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gender', _$GenderEnumMap[instance.gender]);
  writeNotNull('email', instance.email);
  return val;
}

CreateAddressArguments _$CreateAddressArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateAddressArguments(
      input: CreateRiderAddressInput.fromJson(
          json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateAddressArgumentsToJson(
        CreateAddressArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

UpdateAddressArguments _$UpdateAddressArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateAddressArguments(
      id: json['id'] as String,
      update: CreateRiderAddressInput.fromJson(
          json['update'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateAddressArgumentsToJson(
        UpdateAddressArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'update': instance.update.toJson(),
    };

DeleteAddressArguments _$DeleteAddressArgumentsFromJson(
        Map<String, dynamic> json) =>
    DeleteAddressArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$DeleteAddressArgumentsToJson(
        DeleteAddressArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetOrderDetailsArguments _$GetOrderDetailsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetailsArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetOrderDetailsArgumentsToJson(
        GetOrderDetailsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CancelBookingArguments _$CancelBookingArgumentsFromJson(
        Map<String, dynamic> json) =>
    CancelBookingArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$CancelBookingArgumentsToJson(
        CancelBookingArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

SubmitComplaintArguments _$SubmitComplaintArgumentsFromJson(
        Map<String, dynamic> json) =>
    SubmitComplaintArguments(
      id: json['id'] as String,
      subject: json['subject'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$SubmitComplaintArgumentsToJson(
        SubmitComplaintArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'content': instance.content,
    };

PayRideArguments _$PayRideArgumentsFromJson(Map<String, dynamic> json) =>
    PayRideArguments(
      input: TopUpWalletInput.fromJson(json['input'] as Map<String, dynamic>),
      orderId: json['orderId'] as String,
      tipAmount: (json['tipAmount'] as num?)?.toDouble(),
      shouldPreauth: json['shouldPreauth'] as bool,
    );

Map<String, dynamic> _$PayRideArgumentsToJson(PayRideArguments instance) {
  final val = <String, dynamic>{
    'input': instance.input.toJson(),
    'orderId': instance.orderId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tipAmount', instance.tipAmount);
  val['shouldPreauth'] = instance.shouldPreauth;
  return val;
}

TopUpWalletArguments _$TopUpWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    TopUpWalletArguments(
      input: TopUpWalletInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopUpWalletArgumentsToJson(
        TopUpWalletArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

GetCurrentOrderArguments _$GetCurrentOrderArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrderArguments(
      versionCode: json['versionCode'] as int,
    );

Map<String, dynamic> _$GetCurrentOrderArgumentsToJson(
        GetCurrentOrderArguments instance) =>
    <String, dynamic>{
      'versionCode': instance.versionCode,
    };

CreateOrderArguments _$CreateOrderArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateOrderArguments(
      input: CreateOrderInput.fromJson(json['input'] as Map<String, dynamic>),
      notificationPlayerId: json['notificationPlayerId'] as String,
    );

Map<String, dynamic> _$CreateOrderArgumentsToJson(
        CreateOrderArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'notificationPlayerId': instance.notificationPlayerId,
    };

UpdateOrderArguments _$UpdateOrderArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderArguments(
      id: json['id'] as String,
      update: UpdateOrderInput.fromJson(json['update'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateOrderArgumentsToJson(
        UpdateOrderArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'update': instance.update.toJson(),
    };

DriverLocationUpdatedArguments _$DriverLocationUpdatedArgumentsFromJson(
        Map<String, dynamic> json) =>
    DriverLocationUpdatedArguments(
      driverId: json['driverId'] as String,
    );

Map<String, dynamic> _$DriverLocationUpdatedArgumentsToJson(
        DriverLocationUpdatedArguments instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
    };

SubmitFeedbackArguments _$SubmitFeedbackArgumentsFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedbackArguments(
      score: json['score'] as int,
      description: json['description'] as String,
      orderId: json['orderId'] as String,
      parameterIds: (json['parameterIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubmitFeedbackArgumentsToJson(
        SubmitFeedbackArguments instance) =>
    <String, dynamic>{
      'score': instance.score,
      'description': instance.description,
      'orderId': instance.orderId,
      'parameterIds': instance.parameterIds,
    };

GetDriversLocationArguments _$GetDriversLocationArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocationArguments(
      point: json['point'] == null
          ? null
          : PointInput.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDriversLocationArgumentsToJson(
    GetDriversLocationArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('point', instance.point?.toJson());
  return val;
}

GetFareArguments _$GetFareArgumentsFromJson(Map<String, dynamic> json) =>
    GetFareArguments(
      points: (json['points'] as List<dynamic>)
          .map((e) => PointInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      couponCode: json['couponCode'] as String?,
      selectedOptionIds: (json['selectedOptionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetFareArgumentsToJson(GetFareArguments instance) {
  final val = <String, dynamic>{
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('couponCode', instance.couponCode);
  writeNotNull('selectedOptionIds', instance.selectedOptionIds);
  return val;
}

ApplyCouponArguments _$ApplyCouponArgumentsFromJson(
        Map<String, dynamic> json) =>
    ApplyCouponArguments(
      code: json['code'] as String,
    );

Map<String, dynamic> _$ApplyCouponArgumentsToJson(
        ApplyCouponArguments instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

SendSOSArguments _$SendSOSArgumentsFromJson(Map<String, dynamic> json) =>
    SendSOSArguments(
      orderId: json['orderId'] as String,
      location: json['location'] == null
          ? null
          : PointInput.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendSOSArgumentsToJson(SendSOSArguments instance) {
  final val = <String, dynamic>{
    'orderId': instance.orderId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  return val;
}

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) =>
    LoginArguments(
      firebaseToken: json['firebaseToken'] as String,
    );

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) =>
    <String, dynamic>{
      'firebaseToken': instance.firebaseToken,
    };
