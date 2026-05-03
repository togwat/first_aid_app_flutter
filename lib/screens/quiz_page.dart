import 'package:first_aid_app/models/quiz.dart';
import 'package:first_aid_app/widgets/app_bar.dart';
import 'package:first_aid_app/widgets/question_card.dart';
import 'package:flutter/material.dart';

// ─── Add your questions here ─────────────────────────────────────────────────

const _quiz = Quiz([
  QuizQuestion(
    'What is the correct compression rate for CPR?',
    ['60–80 per minute', '100–120 per minute', '140–160 per minute'],
    1,
  ),
  QuizQuestion(
    'How long should you cool a burn under running water?',
    ['5 minutes', '10 minutes', '20 minutes'],
    2,
  ),
]);

// ─────────────────────────────────────────────────────────────────────────────

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  final List<int?> _choices = List.filled(_quiz.questions.length, null);

  bool get _canGoBack => _currentIndex > 0;
  bool get _canGoNext => _currentIndex < _quiz.questions.length - 1;

  // get choice index from QuestionCard
  void _onAnswer(int choice) {
    setState(() => _choices[_currentIndex] = choice);
  }

  void _goNext() {
    if (_canGoNext) setState(() => _currentIndex++);
  }

  void _goPrev() {
    if (_canGoBack) setState(() => _currentIndex--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Quiz'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentIndex + 1} of ${_quiz.questions.length}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: QuestionCard(
                key: ValueKey(_currentIndex),
                _quiz.questions[_currentIndex],
                onAnswer: _onAnswer,
                initialChoice: _choices[_currentIndex],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: _canGoBack ? _goPrev : null,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Previous'),
                ),
                TextButton.icon(
                  onPressed: _canGoNext ? _goNext : null,
                  icon: const Icon(Icons.chevron_right),
                  iconAlignment: IconAlignment.end,
                  label: const Text('Next'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
