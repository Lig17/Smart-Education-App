import 'dart:convert';
import 'package:http/http.dart' as http;

class PerformancePredictionModel {
  final String apiUrl = 'https://api.smarteduapp.com/ml/performance';

  Future<double> predictScore(Map<String, dynamic> studentData) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(studentData),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['predicted_score'].toDouble();
    } else {
      throw Exception('Failed to predict performance');
    }
  }
}
