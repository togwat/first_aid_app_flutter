import 'package:first_aid_app/widgets/image_content.dart';
import 'package:first_aid_app/widgets/text_content.dart';
import 'package:flutter/material.dart';
import 'package:first_aid_app/models/content_block.dart';

class ContentBlockDispatcher extends StatelessWidget {
  const ContentBlockDispatcher(this.block, {super.key});
  final ContentBlock block;

  @override
  Widget build(BuildContext context) => switch (block) {
    TextBlock b => TextContent(b.text),
    ImageBlock b => ImageContent(b.imagePath)
  };
}