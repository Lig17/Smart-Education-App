import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  final String chatbotUrl = 'https://api.smarteduapp.com/chatbot';

  Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse(chatbotUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['reply'];
    } else {
      throw Exception('Failed to get chatbot response');
    }
  }
}
