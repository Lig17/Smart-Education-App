import 'dart:convert';
import 'package:http/http.dart' as http;

class RecommendationModel {
  final String apiUrl = 'https://api.smarteduapp.com/ml/recommendations';

  Future<List<String>> recommendCourses(String userId) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'user_id': userId}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<String>.from(data['recommended_courses']);
    } else {
      throw Exception('Failed to fetch course recommendations');
    }
  }
}
