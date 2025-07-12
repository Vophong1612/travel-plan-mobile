import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:travel_plan_mobile/injection.dart';
import 'package:travel_plan_mobile/src/common/colors.dart';
import 'bloc/chat_bloc.dart';
import 'bloc/chat_event.dart';
import 'bloc/chat_state.dart' as chat_state;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ChatBloc>()..add(LoadChatHistory()),
      child: const ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  final User _user = const User(id: 'user');

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: BlocBuilder<ChatBloc, chat_state.ChatState>(
        builder: (context, state) {
          if (state is chat_state.ChatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is chat_state.ChatLoaded) {
            return Chat(
              chatController: state.chatController,
              currentUserId: _user.id,
              theme: ChatTheme.fromThemeData(themeData).copyWith(
                typography: ChatTypography.standard().copyWith(
                  bodyMedium: ChatTypography.standard().bodyMedium.copyWith(fontSize: 16),
                ),
              ),
              resolveUser: (_) async {
                return _user;
              },
              onMessageSend: (message) {
                if (message.trim().isNotEmpty) {
                  context.read<ChatBloc>().add(SendMessage(message));
                }
              },
              builders: Builders(
                chatAnimatedListBuilder: (context, itemBuilder) {
                  return ChatAnimatedList(itemBuilder: itemBuilder);
                }
              ),
            );
          } else if (state is chat_state.ChatError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: AppColors.error,
                  fontSize: 16,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
