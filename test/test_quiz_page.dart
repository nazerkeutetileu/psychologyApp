import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:psycho/pages/quiz_page.dart';
import 'package:psycho/providers/quiz_provider.dart';

void main() {
  group('QuizPage Widget Tests', () {
    testWidgets('QuizPage displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<QuizProvider>(
            create: (context) => QuizProvider(context, value: ''),
            child: QuizPage(),
          ),
        ),
      );

      expect(find.text('Psychology Test'), findsOneWidget);
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);
    });
    testWidgets('Selecting Yes or No updates question status',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<QuizProvider>(
            create: (context) => QuizProvider(context, value: ''),
            child: QuizPage(),
          ),
        ),
      );
      await tester.tap(find.text('Да'));
      await tester.pump();
      expect(find.text('No'), findsNothing);
      expect(find.text('Да'), findsNothing);
    });
  });
}
