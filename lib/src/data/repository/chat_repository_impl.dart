import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:logger/logger.dart';
import '../../common/exceptions.dart';
import '../../common/trip_detail_storage.dart';
import '../datasource/api_client.dart';
import '../model/send_message_request.dart';
import '../model/send_message_response.dart';
import '../repository/mappers/send_message_to_trip_detail_mapper.dart';
import '../repository/mappers/trip_detail_mapper.dart';
import '../../domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ApiClient _apiClient;
  final List<types.Message> _chatHistory = [];
  final TripDetailStorage _tripDetailStorage = TripDetailStorage();
  final TripDetailMapper _tripDetailMapper = TripDetailMapper();

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
  Future<(String, bool)> sendMessage(String message) async {
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
      Logger().d('Request: ${request.toJson()}');
      final response = await _apiClient.sendMessage(request);
      Logger().d('Response: ${response.toJson()}');
      
      // Try to parse and store trip detail if the response contains trip data
      final canNavigateToTripDetail = _tryParseAndStoreTripDetail(response);
      
      // Add bot response to local history
      final botMessage = types.TextMessage(
        author: const types.User(id: 'bot'),
        id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
        text: response.message ?? '',
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      _chatHistory.add(botMessage);
      
      return (response.message ?? '', canNavigateToTripDetail);
    } catch (e) {
      Logger().e('Failed to send message: $e');
      throw ChatException('Failed to send message: $e');
    }
  }

  /// Try to parse the bot response as a SendMessageResponse and store trip detail
  bool _tryParseAndStoreTripDetail(SendMessageResponse sendMessageResponse) {
    try {
      // Check if it's a successful response with trip details
      if (sendMessageResponse.success == true && sendMessageResponse.tripDetails != null) {
        Logger().d('Trip detail detected in response, storing...');

        // Map to TripDetailResponse
        final tripDetailResponse = SendMessageToTripDetailMapper.map(sendMessageResponse);

        // Map to domain entity
        if (tripDetailResponse.data != null) {
          final tripDetailData = _tripDetailMapper.map(tripDetailResponse.data!);

          // Store in the storage
          _tripDetailStorage.setTripDetail(tripDetailData);
          Logger().d('Trip detail stored successfully');
          return true;
        }
      }
      return false;
    } catch (e) {
      // If parsing fails, it's not a trip detail response, so we ignore it
      // This is expected for regular chat messages
      Logger().d('Response is not a trip detail response: $e');
      return false;
    }
  }

  // types.Message _chatMessageToMessage(dynamic chatMessage) {
  //   final role = chatMessage.role;
  //   final authorId = role == 'user' ? 'user' : 'bot';
  //   final author = types.User(id: authorId);
  //   final id = DateTime.parse(chatMessage.timestamp).millisecondsSinceEpoch.toString();
  //   final text = chatMessage.message;
    
  //   return types.TextMessage(
  //     author: author,
  //     id: id,
  //     text: text,
  //     createdAt: DateTime.parse(chatMessage.timestamp).millisecondsSinceEpoch,
  //   );
  // }
  
  /// Clear the in-memory chat history
  void clearChatHistory() {
    _chatHistory.clear();
  }
  
  /// Get the current in-memory chat history count
  int get chatHistoryCount => _chatHistory.length;
}
