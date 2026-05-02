import 'package:first_aid_app/models/content_block.dart';
import 'package:first_aid_app/widgets/app_bar.dart';
import 'package:first_aid_app/widgets/content_block_dispatcher.dart';
import 'package:flutter/material.dart';

class FirstAidPage extends StatelessWidget {
  const FirstAidPage(this.title, this.blocks, {super.key});

  final String title;
  final List<ContentBlock> blocks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title),
      body: ListView.separated(
        padding: const EdgeInsets.all(20.0),
        itemCount: blocks.length,
        itemBuilder: (context, i) => ContentBlockDispatcher(blocks[i]),
        separatorBuilder: (context, i) => const SizedBox(height: 16),
      ),
    );
  }
}