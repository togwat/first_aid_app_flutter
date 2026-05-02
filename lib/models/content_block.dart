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