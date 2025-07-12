import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../../common/exceptions.dart';
import '../datasource/mock_api_client.dart';
import '../model/send_message_request.dart';
import '../../domain/repository/chat_repository.dart';

class MockChatRepositoryImpl implements ChatRepository {
  final MockApiClient _mockApiClient;

  MockChatRepositoryImpl(this._mockApiClient);

  @override
  Future<List<types.Message>> getChatHistory() async {
    try {
      final response = await _mockApiClient.getChatHistory();
      return response.chatHistory.map((chatMessage) => _chatMessageToMessage(chatMessage)).toList();
    } catch (e) {
      throw ChatException('Failed to load chat history: $e');
    }
  }

  @override
  Future<String> sendMessage(String message) async {
    try {
      final request = SendMessageRequest(message: message);
      final response = await _mockApiClient.sendMessage(request);
      return response.response;
    } catch (e) {
      throw ChatException('Failed to send message: $e');
    }
  }

  types.Message _chatMessageToMessage(dynamic chatMessage) {
    final role = chatMessage.role;
    final authorId = role == 'user' ? 'user' : 'bot';
    final author = types.User(id: authorId);
    final id = DateTime.parse(chatMessage.timestamp).millisecondsSinceEpoch.toString();
    final text = chatMessage.message;
    
    return types.TextMessage(
      author: author,
      id: id,
      text: text,
      createdAt: DateTime.parse(chatMessage.timestamp).millisecondsSinceEpoch,
    );
  }
} 