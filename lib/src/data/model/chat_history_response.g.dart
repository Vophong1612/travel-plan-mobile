// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatHistoryResponse _$ChatHistoryResponseFromJson(Map<String, dynamic> json) =>
    ChatHistoryResponse(
      chatHistory: (json['chatHistory'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatHistoryResponseToJson(
  ChatHistoryResponse instance,
) => <String, dynamic>{'chatHistory': instance.chatHistory};

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
  role: json['role'] as String,
  timestamp: json['timestamp'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'timestamp': instance.timestamp,
      'message': instance.message,
    };
