import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatCubit extends Cubit<List<types.TextMessage>> {
  ChatCubit() : super([]);

  void setMessages(List<types.TextMessage> messages) => emit(messages);

  void addMessage(types.TextMessage message) =>
      emit([message].followedBy(state).toList());
}
