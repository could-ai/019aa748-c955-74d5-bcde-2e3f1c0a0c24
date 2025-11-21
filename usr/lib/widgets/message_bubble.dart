import 'package:couldai_user_app/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUserMessage = message.type == ChatMessageType.user;
    return Row(
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isUserMessage
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message.text,
            style: TextStyle(
              color: isUserMessage
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
