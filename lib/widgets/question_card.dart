import 'package:first_aid_app/models/quiz.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard(this.question, {required this.onAnswer, this.initialChoice, super.key});

  final QuizQuestion question;
  final void Function(int choice) onAnswer;
  final int? initialChoice;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late int? _selectedChoice = widget.initialChoice;

  void _handleTap(int index) {
    if (_selectedChoice != null) return;
    setState(() => _selectedChoice = index);
    widget.onAnswer(index);
  }

  _TileState _stateFor(int index) {
    if (_selectedChoice == null) return _TileState.enabled;
    if (index == widget.question.answer) return _TileState.correct;
    if (index == _selectedChoice) return _TileState.incorrect;
    return _TileState.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.question,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < widget.question.choices.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _ChoiceTile(
              label: widget.question.choices[i],
              state: _stateFor(i),
              onTap: () => _handleTap(i),
            ),
          ),
      ],
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    required this.label,
    required this.state,
    required this.onTap,
  });

  final String label;
  final _TileState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color border, Color text, Icon? icon) = switch (state) {
      _TileState.enabled => (
          Theme.of(context).colorScheme.surfaceContainerHighest,
          Colors.transparent,
          Theme.of(context).colorScheme.onSurface,
          null,
        ),
      _TileState.disabled => (
          Theme.of(context).colorScheme.surfaceContainerHighest,
          Colors.transparent,
          Theme.of(context).disabledColor,
          null,
        ),
      _TileState.correct => (
          Colors.green.shade100,
          Colors.green,
          Colors.green.shade900,
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
        ),
      _TileState.incorrect => (
          Colors.red.shade100,
          Colors.red,
          Colors.red.shade900,
          const Icon(Icons.cancel, color: Colors.red, size: 20),
        ),
    };

    return GestureDetector(
      onTap: state == _TileState.enabled ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [
            Expanded(child: Text(label, style: TextStyle(color: text))),
            ?icon,
          ],
        ),
      ),
    );
  }
}

enum _TileState { enabled, disabled, correct, incorrect }
