import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class ChatRepository {
  Future<List<types.Message>> getChatHistory();
  Future<(String, bool)> sendMessage(String message);
}
