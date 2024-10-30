import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIService {
  final String apiKey;
  final String apiUrl = dotenv.env[
          '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'] ??
      'https://api.openai.com/v1/chat/completions';

  OpenAIService(this.apiKey);

  Future<String> sendMessage(String message) async {
    final url = Uri.parse(apiUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'model': 'gpt-3.5-turbo', // or any other chat model you want to use
        'messages': [
          {'role': 'user', 'content': message},
        ],
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // Extract the response content from OpenAI
      return jsonResponse['choices'][0]['message']['content'];
    } else {
      print('Error: ${response.statusCode}');
      return 'Error: ${response.statusCode}';
    }
  }
}
