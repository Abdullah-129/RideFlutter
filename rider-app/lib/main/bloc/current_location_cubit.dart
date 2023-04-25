import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';

class CurrentLocationCubit extends Cubit<FullLocation?> {
  CurrentLocationCubit() : super(null);

  void updateLocation(FullLocation location) {
    if (state == null ||
        state!.latlng.latitude - location.latlng.latitude > 0.0001) {
      emit(location);
    }
  }
}
