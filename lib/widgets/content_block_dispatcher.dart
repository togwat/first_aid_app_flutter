import 'package:first_aid_app/widgets/cpr_timer_content.dart';
import 'package:first_aid_app/widgets/hint_content.dart';
import 'package:first_aid_app/widgets/image_content.dart';
import 'package:first_aid_app/widgets/numbered_list_content.dart';
import 'package:first_aid_app/widgets/text_content.dart';
import 'package:first_aid_app/widgets/warning_content.dart';
import 'package:flutter/material.dart';
import 'package:first_aid_app/models/content_block.dart';

class ContentBlockDispatcher extends StatelessWidget {
  const ContentBlockDispatcher(this.block, {super.key});
  final ContentBlock block;

  @override
  Widget build(BuildContext context) => switch (block) {
    TextBlock b => TextContent(b.text),
    ImageBlock b => ImageContent(b.imagePath),
    NumberedListBlock b => NumberedListContent(b.list),
    WarningBlock b => WarningContent(b.warning),
    HintBlock b => HintContent(b.hint),
    CPRTimerBlock b => CPRTimer(b.bpm, b.compressions, b.rescueBreaths)
  };
}