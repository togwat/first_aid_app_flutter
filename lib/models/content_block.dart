sealed class ContentBlock {}

/// Creating a new content widget:
/// 1. make a block data model here
/// 2. make a content widget in /widgets
/// 3. map it in content_block_dispatcher.dart

class TextBlock extends ContentBlock {
  TextBlock(this.text);

  final String text;
}

class ImageBlock extends ContentBlock {
  ImageBlock(this.imagePath);

  final String imagePath;
}

class NumberedListBlock extends ContentBlock {
  NumberedListBlock(this.list);

  final List<String> list;
}

class WarningBlock extends ContentBlock {
  WarningBlock(this.warning);

  final String warning;
}

class HintBlock extends ContentBlock {
  HintBlock(this.hint);

  final String hint;
}

class CPRTimerBlock extends ContentBlock {
  CPRTimerBlock(this.bpm, this.compressions, this.rescueBreaths, this.breathInterval);

  final int bpm;
  final int compressions;
  final int rescueBreaths;
  final int breathInterval;  // milliseconds
}