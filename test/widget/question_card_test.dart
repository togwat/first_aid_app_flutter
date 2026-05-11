import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_aid_app/models/quiz.dart';
import 'package:first_aid_app/widgets/question_card.dart';

const _q = QuizQuestion(
  'What is 1 + 1?',
  ['1', '2', '3'],
  1, // '2' is correct
);

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('QuestionCard', () {
    testWidgets('renders question text', (tester) async {
      await tester.pumpWidget(_wrap(QuestionCard(_q, onAnswer: (_) {})));
      expect(find.text('What is 1 + 1?'), findsOneWidget);
    });

    testWidgets('renders all answer choices', (tester) async {
      await tester.pumpWidget(_wrap(QuestionCard(_q, onAnswer: (_) {})));
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('tapping a choice calls onAnswer with its index', (tester) async {
      int? received;
      await tester.pumpWidget(_wrap(QuestionCard(_q, onAnswer: (i) => received = i)));
      await tester.tap(find.text('2'));
      await tester.pump();
      expect(received, 1);
    });

    testWidgets('cannot change answer after first tap', (tester) async {
      int callCount = 0;
      await tester.pumpWidget(_wrap(QuestionCard(_q, onAnswer: (_) => callCount++)));
      await tester.tap(find.text('1'));
      await tester.pump();
      await tester.tap(find.text('3'));
      await tester.pump();
      expect(callCount, 1);
    });

    testWidgets('correct answer tile shows green check icon after answering', (tester) async {
      await tester.pumpWidget(_wrap(QuestionCard(_q, onAnswer: (_) {})));
      await tester.tap(find.text('2'));
      await tester.pump();
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsNothing);
    });

    testWidgets('incorrect answer tile shows red cancel icon after answering', (tester) async {
      await tester.pumpWidget(_wrap(QuestionCard(_q, onAnswer: (_) {})));
      await tester.tap(find.text('1')); // wrong answer
      await tester.pump();
      expect(find.byIcon(Icons.cancel), findsOneWidget);      // incorrect tile
      expect(find.byIcon(Icons.check_circle), findsOneWidget); // correct tile still revealed
    });
  });
}
