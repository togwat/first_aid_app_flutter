import 'package:flutter/material.dart';

class NumberedListContent extends StatelessWidget {
  const NumberedListContent(this.list, {super.key});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list.indexed.map((entry) {
        final (i, text) = entry;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${i + 1}. ', style: const TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: Text(text)),
            ],
          ),
        );
      }).toList(),
    );
  }
}