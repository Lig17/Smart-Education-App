import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_education_app/main.dart';

void main() {
  testWidgets('App title appears on home screen', (WidgetTester tester) async {
    await tester.pumpWidget(SmartEducationApp());
    expect(find.text('Smart Education App'), findsOneWidget);
  });

  testWidgets('Navigation to Chat Screen', (WidgetTester tester) async {
    await tester.pumpWidget(SmartEducationApp());

    final chatButton = find.text('Chat with AI Tutor');
    expect(chatButton, findsOneWidget);

    await tester.tap(chatButton);
    await tester.pumpAndSettle();

    expect(find.text('Chat with AI Bot'), findsOneWidget);
  });
}

