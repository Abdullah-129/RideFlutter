import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  CurrentLocationCubit() : super(CurrentLocationState());

  setRadius(int? radius) {
    emit(CurrentLocationState(location: state.location, radius: radius));
  }

  setCurrentLocation(LatLng location) {
    if (location.latitude != state.location?.latitude ||
        location.longitude != state.location?.longitude) {
      emit(CurrentLocationState(location: location, radius: state.radius));
    }
  }
}

class CurrentLocationState {
  LatLng? location;
  int? radius;

  CurrentLocationState({this.location, this.radius});
}
