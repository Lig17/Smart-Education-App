import 'dart:convert';
import 'package:http/http.dart' as http;

class SentimentAnalysisModel {
  final String apiUrl = 'https://api.smarteduapp.com/ml/sentiment';

  Future<String> analyzeSentiment(String message) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['sentiment'];
    } else {
      throw Exception('Failed to analyze sentiment');
    }
  }
}
