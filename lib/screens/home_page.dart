import 'package:first_aid_app/screens/quiz_page.dart';
import 'package:first_aid_app/widgets/first_aid_menu.dart';
import 'package:first_aid_app/widgets/app_bar.dart';
import 'package:first_aid_app/widgets/disclaimer_dialog_content.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDisclaimer());
  }

  void _showDisclaimer() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => DisclaimerDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(widget.title),
      body: ListView(
        children: [
          FirstAidMenu(),
          Divider(),
          ListTile(
            title: Text("Quiz"),
            leading: Icon(Icons.question_mark_rounded, color: Colors.redAccent),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage()
                )
              );
            }
          )
        ]
      )
    );
  }
}
