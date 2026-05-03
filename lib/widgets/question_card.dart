import 'package:first_aid_app/models/quiz.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard(this.question, {required this.onAnswer, super.key});

  final QuizQuestion question;
  final void Function(int choice) onAnswer;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? _selectedChoice;

  void _handleTap(int index) {
    if (_selectedChoice != null) return;
    setState(() => _selectedChoice = index);
    widget.onAnswer(index);
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
              selected: _selectedChoice == i,
              disabled: _selectedChoice != null,
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
    required this.selected,
    required this.disabled,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool disabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: disabled && !selected
                ? Theme.of(context).disabledColor
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
