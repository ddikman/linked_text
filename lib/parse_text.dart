class TextPart {
  final String text;
  final String? url;

  const TextPart({required this.text, this.url});

  @override
  String toString() {
    return 'TextPart(text: $text, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (other is TextPart) {
      return text == other.text && url == other.url;
    }
    return false;
  }

  @override
  int get hashCode => text.hashCode ^ url.hashCode;
}

List<TextPart> parseText(String text) {
  // Match markdown links in format [text](url)
  final RegExp linkPattern = RegExp(r'\[(.*?)\]\((.*?)\)');

  final links = linkPattern.allMatches(text);
  if (links.isEmpty) {
    return [TextPart(text: text)];
  }

  final parts = <TextPart>[];

  var lastEnd = 0;
  for (final link in links) {
    // Add text before the link
    if (link.start > lastEnd) {
      parts.add(TextPart(text: text.substring(lastEnd, link.start)));
    }

    // Add the link
    final linkText = link.group(1)!;
    final url = link.group(2)!;
    parts.add(TextPart(text: linkText, url: url));

    lastEnd = link.end;
  }

  // Add any remaining text after the last link
  if (lastEnd < text.length) {
    parts.add(TextPart(text: text.substring(lastEnd)));
  }

  return parts;
}
