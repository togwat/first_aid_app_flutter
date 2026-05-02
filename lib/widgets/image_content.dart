import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  const ImageContent(this.imagePath, {super.key});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}