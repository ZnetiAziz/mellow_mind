import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/openai_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Ensure you import dotenv

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final OpenAIService _openAIService = OpenAIService(dotenv.env[
      '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']!); // Use dotenv to get the API key
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() async {
    final message = _controller.text;
    if (message.isEmpty) return;

    setState(() {
      _messages.add('You: $message');
      _controller.clear();
    });

    final response = await _openAIService.sendMessage(message);
    setState(() {
      _messages.add('Bot: $response');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message here...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
