import 'package:json_annotation/json_annotation.dart';

part 'send_message_request.g.dart';

@JsonSerializable()
class SendMessageRequest {
  final String message;

  SendMessageRequest({required this.message});

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);
} 