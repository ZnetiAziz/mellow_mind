import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottons/Userpage.dart';
import 'package:flutter_application_1/bottons/fyi_page.dart';
import 'package:flutter_application_1/bottons/reminders_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/pages/welcome_page.dart';

class ChatBotPage extends StatefulWidget {
  final String username;

  const ChatBotPage({super.key, required this.username});

  @override
  // ignore: library_private_types_in_public_api
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  final String openAiApiKey =
      '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'; // Replace with your OpenAI API key

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'text': message});
    });

    _controller.clear();

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Authorization': 'Bearer $openAiApiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'prompt': message,
          'max_tokens': 100,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botResponse = data['choices'][0]['text'].trim();

        setState(() {
          messages.add({'sender': 'bot', 'text': botResponse});
        });
      } else {
        throw Exception('Failed to get response');
      }
    } catch (e) {
      setState(() {
        messages.add({
          'sender': 'bot',
          'text': 'Sorry, there was an error. Please try again later.'
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/imm2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Top bar with gradient and circular icons
            Container(
              height: 70,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFB3E5FC), Color.fromARGB(255, 255, 81, 13)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WelcomePage(username: widget.username),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.question_mark, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FYIPage(username: widget.username),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RemindersPage(username: widget.username),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserPage(
                            username: widget.username,
                            email: '',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isUser = message['sender'] == 'user';
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: isUser
                            ? const Color(0xFFF98F6C)
                            : const Color(0xFF404C92),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['text']!,
                        style: TextStyle(
                            color: isUser
                                ? const Color(0xDDFFFFFF)
                                : const Color(0xDDFFFFFF)),
                      ),
                    ),
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
                        hintText: 'Type a message...',
                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      sendMessage(_controller.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
