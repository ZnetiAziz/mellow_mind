import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenAIService {
  final String apiKey;

  OpenAIService(this.apiKey);

  Future<void> sendRequest(String prompt) async {
    final url = Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'prompt': prompt,
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
