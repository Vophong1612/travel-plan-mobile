import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_core/flutter_chat_core.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoaded extends ChatState {
  final List<types.Message> messages;
  final bool isLoading;
  final InMemoryChatController chatController;

  const ChatLoaded({
    required this.messages,
    required this.chatController,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [messages, isLoading, chatController];
}

class ChatWaitingForResponse extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object?> get props => [message];
}
