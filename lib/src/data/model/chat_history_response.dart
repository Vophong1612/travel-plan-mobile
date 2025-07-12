import 'package:json_annotation/json_annotation.dart';

part 'chat_history_response.g.dart';

@JsonSerializable()
class ChatHistoryResponse {
  final List<ChatMessage> chatHistory;

  ChatHistoryResponse({required this.chatHistory});

  factory ChatHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatHistoryResponseToJson(this);
}

@JsonSerializable()
class ChatMessage {
  final String role;
  final String timestamp;
  final String message;

  ChatMessage({
    required this.role,
    required this.timestamp,
    required this.message,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
} 