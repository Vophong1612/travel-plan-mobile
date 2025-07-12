import 'package:json_annotation/json_annotation.dart';

part 'send_message_response.g.dart';

@JsonSerializable()
class SendMessageResponse {
  final String? message;

  SendMessageResponse({required this.message});

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageResponseToJson(this);
} 