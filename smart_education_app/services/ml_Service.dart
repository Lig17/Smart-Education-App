import 'dart:convert';
import 'package:http/http.dart' as http;

class MLService {
  final String mlApiUrl = 'https://api.smarteduapp.com/ml';

  Future<List<String>> getCourseRecommendations(String userId) async {
    final response = await http.post(
      Uri.parse('$mlApiUrl/recommendations'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'user_id': userId}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<String>.from(data['recommended_courses']);
    } else {
      throw Exception('Failed to fetch recommendations');
    }
  }

  Future<String> analyzeSentiment(String message) async {
    final response = await http.post(
      Uri.parse('$mlApiUrl/sentiment'),
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

  Future<double> predictPerformance(Map<String, dynamic> learningData) async {
    final response = await http.post(
      Uri.parse('$mlApiUrl/performance'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(learningData),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['predicted_score'].toDouble();
    } else {
      throw Exception('Failed to predict performance');
    }
  }
}


import 'package:flutter/material.dart';
import 'ml_service.dart';

class RecommendationsScreen extends StatefulWidget {
  @override
  _RecommendationsScreenState createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  final MLService mlService = MLService();
  List<String> recommendations = [];

  @override
  void initState() {
    super.initState();
    fetchRecommendations();
  }

  void fetchRecommendations() async {
    try {
      recommendations = await mlService.getCourseRecommendations('user123');
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recommended Courses')),
      body: recommendations.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recommendations[index]),
                );
              },
            ),
    );
  }
}
