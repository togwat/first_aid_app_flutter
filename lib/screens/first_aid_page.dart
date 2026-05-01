import 'package:first_aid_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class FirstAidPage extends StatelessWidget {
  const FirstAidPage(this.title, this.content, this.imagePath, {super.key});

  final String title;
  final String content;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(imagePath),
            Text(content),
          ],
        ),
      ),
    );
  }
}