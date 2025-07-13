import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:logger/logger.dart';
import 'package:travel_plan_mobile/injection.dart';
import 'package:travel_plan_mobile/src/common/colors.dart';
import 'package:travel_plan_mobile/src/presentation/_common/widget/typing_indication.dart';
import 'bloc/chat_bloc.dart';
import 'bloc/chat_event.dart';
import 'bloc/chat_state.dart' as chat_state;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => di<ChatBloc>()..add(LoadChatHistory()), child: const ChatView());
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  final User _user = const User(id: 'user');

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: BlocBuilder<ChatBloc, chat_state.ChatState>(
        builder: (context, state) {
          Logger().d(state);
          if (state is chat_state.ChatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is chat_state.ChatLoaded) {
            return Chat(
              chatController: state.chatController,
              currentUserId: _user.id,
              theme: ChatTheme.fromThemeData(themeData),
              resolveUser: (_) async {
                return _user;
              },
              onMessageSend: (message) {
                if (message.trim().isNotEmpty) {
                  context.read<ChatBloc>().add(SendMessage(message));
                }
              },
              builders: Builders(
                textMessageBuilder:
                    (context, message, index, {required bool isSentByMe, MessageGroupStatus? groupStatus}) {
                      final colorScheme = Theme.of(context).colorScheme;
                      final textTheme = Theme.of(context).textTheme;
                      if (isSentByMe) {
                        return Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                          child: Text(
                            message.text,
                            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary, fontSize: 16),
                          ),
                        );
                      } else {
                        if (state.isLoading && index == state.messages.length) {
                          return TypingIndicator(
                            showIndicator: true,
                            bubbleColor: colorScheme.primaryFixed,
                            flashingCircleDarkColor: colorScheme.primary,
                            flashingCircleBrightColor: colorScheme.onPrimaryFixed,
                          );
                        }
                        return Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryFixed,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: MarkdownBody(
                            data: message.text,
                            styleSheet: MarkdownStyleSheet(tableColumnWidth: const FixedColumnWidth(150)),
                          ),
                        );
                      }
                    },
                chatAnimatedListBuilder: (context, itemBuilder) {
                  return ChatAnimatedList(itemBuilder: itemBuilder);
                },
              ),
            );
          } else if (state is chat_state.ChatError) {
            return Center(
              child: Text(state.message, style: TextStyle(color: AppColors.error, fontSize: 16)),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
