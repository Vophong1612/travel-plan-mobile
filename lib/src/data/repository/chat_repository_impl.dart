import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:logger/logger.dart';
import '../../common/exceptions.dart';
import '../datasource/api_client.dart';
import '../model/send_message_request.dart';
import '../../domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ApiClient _apiClient;
  final List<types.Message> _chatHistory = [];

  ChatRepositoryImpl(this._apiClient);

  @override
  Future<List<types.Message>> getChatHistory() async {
    try {
      return _chatHistory;
      // Return cached history if available
      // if (_chatHistory.isNotEmpty) {
      //   return List.from(_chatHistory);
      // }
      
      // // Fetch from API if no cached data
      // final response = await _apiClient.getChatHistory();
      // final messages = response.chatHistory.map((chatMessage) => _chatMessageToMessage(chatMessage)).toList();
      
      // // Cache the messages
      // _chatHistory.clear();
      // _chatHistory.addAll(messages);
      
      // return messages;
    } catch (e) {
      throw ChatException('Failed to load chat history: $e');
    }
  }

  @override
  Future<String> sendMessage(String message) async {
    try {
      Logger().d('Sending message: $message');
      
      // Add user message to local history
      final userMessage = types.TextMessage(
        author: const types.User(id: 'user'),
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      _chatHistory.add(userMessage);
      
      final request = SendMessageRequest(message: message);
      Logger().d('Request: $request');
      final response = await _apiClient.sendMessage(request);
      Logger().d('Response: $response');
      
      // Add bot response to local history
      final botMessage = types.TextMessage(
        author: const types.User(id: 'bot'),
        id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
        text: response.message ?? '',
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      _chatHistory.add(botMessage);
      
      return response.message ?? '';
    } catch (e) {
      Logger().e('Failed to send message: $e');
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
  
  /// Clear the in-memory chat history
  void clearChatHistory() {
    _chatHistory.clear();
  }
  
  /// Get the current in-memory chat history count
  int get chatHistoryCount => _chatHistory.length;
}
