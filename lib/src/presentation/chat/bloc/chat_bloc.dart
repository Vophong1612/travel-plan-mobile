import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_core/flutter_chat_core.dart';
import '../../../domain/repository/chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  final InMemoryChatController _chatController = InMemoryChatController();

  final _loadingMessage = TextMessage(
    id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
    authorId: 'bot',
    createdAt: DateTime.now(),
    text: 'Thinking...',
  );

  ChatBloc(this._chatRepository) : super(ChatInitial()) {
    on<LoadChatHistory>(_onLoadChatHistory);
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onLoadChatHistory(
    LoadChatHistory event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(ChatLoading());
      final messages = await _chatRepository.getChatHistory();
      _updateChatController(messages);
      emit(ChatLoaded(messages: messages, chatController: _chatController));
    } catch (e) {
      emit(ChatError('Failed to load chat history'));
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is ChatLoaded) {
        // Add user message to chat
        final userMessage = types.TextMessage(
          author: const types.User(id: 'user'),
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: event.message,
        );
        
        final updatedMessages = [...currentState.messages, userMessage];
        _updateChatController(updatedMessages);
        emit(ChatLoaded(messages: updatedMessages, chatController: _chatController, isLoading: true));
        
        _addLoadingMessage();
        
        // Send message to server
        final (botResponse, canNavigateToTripDetail) = await _chatRepository.sendMessage(event.message);
        final botMessage = types.TextMessage(
          author: const types.User(id: 'bot'),
          id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
          text: botResponse,
        );

        _removeLoadingMessage();

        final finalMessages = [...updatedMessages, botMessage];
        _updateChatController(finalMessages);
        emit(ChatLoaded(messages: finalMessages, chatController: _chatController, isLoading: false, canNavigateToTripDetail: canNavigateToTripDetail));
      }
    } catch (e) {
      emit(ChatError('Failed to send message'));
    }
  }

  void _updateChatController(List<types.Message> messages) {
    // Convert and add messages to chat controller
    for (final message in messages) {
      if (message is types.TextMessage) {
        _chatController.insertMessage(
          TextMessage(
            id: message.id,
            authorId: message.author.id,
            createdAt: DateTime.fromMillisecondsSinceEpoch(message.createdAt ?? 0),
            text: message.text,
          ),
        );
      }
    }
  }

  void _addLoadingMessage() {
    _chatController.insertMessage(
      _loadingMessage,
    );
  }

  void _removeLoadingMessage() {
    _chatController.removeMessage(_loadingMessage);
  }
}
