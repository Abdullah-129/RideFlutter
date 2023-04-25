import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridy/graphql/generated/graphql_api.graphql.dart';

class RiderProfileCubit extends Cubit<GetCurrentOrder$Query$Rider?> {
  RiderProfileCubit() : super(null);

  void updateProfile(GetCurrentOrder$Query$Rider? rider) {
    emit(rider);
  }
}
