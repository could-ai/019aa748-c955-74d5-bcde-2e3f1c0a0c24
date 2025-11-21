import 'package:couldai_user_app/models/chat_message.dart';
import 'package:couldai_user_app/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Olá! Como posso te ajudar hoje?",
      type: ChatMessageType.bot,
    ),
  ];

  void _handleSendPressed() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      _textController.clear();
      setState(() {
        _messages.add(ChatMessage(text: text, type: ChatMessageType.user));
      });

      // Simulate a bot response
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _messages.add(
            ChatMessage(
              text: "Esta é uma resposta simulada do bot.",
              type: ChatMessageType.bot,
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CouldAI"),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              // TODO: Implement video generation
            },
            tooltip: 'Gerar Vídeo',
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Implement video editing
            },
            tooltip: 'Editar Vídeo',
          ),
          PopupMenuButton(
            tooltip: 'Opções',
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'personality',
                child: Text("Mudar Personalidade"),
              ),
              const PopupMenuItem(
                value: 'model',
                child: Text("Mudar Modelo"),
              ),
            ],
            onSelected: (value) {
              // TODO: Implement model/personality change
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: _messages[index]);
              },
            ),
          ),
          _buildTextInput(),
        ],
      ),
    );
  }

  Widget _buildTextInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Digite sua mensagem...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
              onSubmitted: (value) => _handleSendPressed(),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _handleSendPressed,
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
