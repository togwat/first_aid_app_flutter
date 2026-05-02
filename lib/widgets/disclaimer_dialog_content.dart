import 'package:flutter/material.dart';


class DisclaimerDialog extends StatelessWidget {
  const DisclaimerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(Icons.warning_amber, color: Colors.amber),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("This app is for learning purposes only and is not a substitute for professional medical advice.\n"),
          Text("In a real emergency, cal 111 immediately.")
        ]
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge),
          child: const Text("Continue"),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
      ]
    );
  }
}