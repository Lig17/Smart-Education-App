import 'package:flutter_test/flutter_test.dart';
import 'package:smart_education_app/utils/helpers.dart';

void main() {
  group('Helper Tests', () {
    test('Email validation returns true for valid emails', () {
      expect(Helpers.isValidEmail('test@example.com'), true);
    });

    test('Email validation returns false for invalid emails', () {
      expect(Helpers.isValidEmail('invalid-email'), false);
    });

    test('Date formatting is correct', () {
      final date = DateTime(2023, 5, 10);
      expect(Helpers.formatDate(date), '10/5/2023');
    });
  });
}
