sealed class ContentBlock {}

class TextBlock extends ContentBlock {
  TextBlock(this.text);

  final String text;
}

class ImageBlock extends ContentBlock {
  ImageBlock(this.imagePath);

  final String imagePath;
}
