import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';

@HiveType(typeId: 0)
class LocationHistoryItem extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String details;

  @HiveField(2)
  double lat;

  @HiveField(3)
  double lng;

  LocationHistoryItem(
      {required this.name,
      required this.details,
      required this.lat,
      required this.lng});
}

extension LocationHistoryHelper on LocationHistoryItem {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }

  FullLocation toFullLocation(String address, String title) {
    return FullLocation(latlng: toLatLng(), address: address, title: title);
  }
}

extension FullLocationHelper on FullLocation {
  LocationHistoryItem toLocationHistoryItem() {
    return LocationHistoryItem(
        name: title,
        details: address,
        lat: latlng.latitude,
        lng: latlng.longitude);
  }
}

class LocationHistoryItemAdapter extends TypeAdapter<LocationHistoryItem> {
  @override
  final int typeId = 0;

  @override
  LocationHistoryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationHistoryItem(
      name: fields[0] as String,
      details: fields[1] as String,
      lat: fields[2] as double,
      lng: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LocationHistoryItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationHistoryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
