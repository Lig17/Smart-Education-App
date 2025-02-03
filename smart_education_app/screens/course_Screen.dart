import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {'title': 'Introduction to AI', 'description': 'Learn the basics of Artificial Intelligence.'},
    {'title': 'Flutter Development', 'description': 'Build beautiful native apps with Flutter.'},
    {'title': 'Data Science 101', 'description': 'Get started with data analysis and visualization.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(courses[index]['title']!),
              subtitle: Text(courses[index]['description']!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
