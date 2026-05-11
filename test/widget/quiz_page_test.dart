import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_aid_app/screens/quiz_page.dart';

Widget _wrap(Widget child) => MaterialApp(home: child);

void main() {
  group('QuizPage', () {
    testWidgets('shows Question 1 of 4 on first render', (tester) async {
      await tester.pumpWidget(_wrap(const QuizPage()));
      expect(find.text('Question 1 of 4'), findsOneWidget);
    });

    testWidgets('tapping Next advances to question 2', (tester) async {
      await tester.pumpWidget(_wrap(const QuizPage()));
      await tester.tap(find.text('Next'));
      await tester.pump();
      expect(find.text('Question 2 of 4'), findsOneWidget);
    });

    testWidgets('Previous button has no effect on the first question', (tester) async {
      await tester.pumpWidget(_wrap(const QuizPage()));
      await tester.tap(find.text('Previous'));
      await tester.pump();
      expect(find.text('Question 1 of 4'), findsOneWidget);
    });

    testWidgets('Previous button on the 2nd question returns to the first question', (tester) async {
      await tester.pumpWidget(_wrap(const QuizPage()));
      await tester.tap(find.text('Next'));
      await tester.pump();
      await tester.tap(find.text('Previous'));
      await tester.pump();
      expect(find.text('Question 1 of 4'), findsOneWidget);
    });

    testWidgets('Next button has no effect on the last question', (tester) async {
      await tester.pumpWidget(_wrap(const QuizPage()));
      // go to 4th question
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.text('Next'));
        await tester.pump();
      }
      expect(find.text('Question 4 of 4'), findsOneWidget);
      await tester.tap(find.text('Next'));
      await tester.pump();
      expect(find.text('Question 4 of 4'), findsOneWidget);
    });

    testWidgets('answer is preserved when navigating away and back', (tester) async {
      await tester.pumpWidget(_wrap(const QuizPage()));
      await tester.tap(find.text('100–120 per minute')); // correct answer to Q1
      await tester.pump();
      await tester.tap(find.text('Next'));
      await tester.pump();
      await tester.tap(find.text('Previous'));
      await tester.pump();
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });
  });
}
