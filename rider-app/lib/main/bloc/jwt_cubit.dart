import 'package:flutter_bloc/flutter_bloc.dart';

class JWTCubit extends Cubit<String?> {
  JWTCubit() : super(null);

  login(String jwt) {
    emit(jwt);
  }

  logOut() {
    emit(null);
  }
}
