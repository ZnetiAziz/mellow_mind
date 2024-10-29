import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/openai_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Ensure you import dotenv

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final OpenAIService _openAIService = OpenAIService(dotenv.env['OPENAI_API_KEY']!); // Use dotenv to get the API key
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
        title: Text('Chat with AI'),
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
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
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
