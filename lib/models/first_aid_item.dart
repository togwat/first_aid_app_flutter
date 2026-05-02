import 'content_block.dart';
import 'package:flutter/widgets.dart';

class FirstAidItem {
  const FirstAidItem(this.title, this.icon, this.blocks);

  final String title;
  final IconData icon;
  final List<ContentBlock> blocks;
}