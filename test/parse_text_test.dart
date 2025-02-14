import 'package:flutter_test/flutter_test.dart';
import 'package:linked_text/parse_text.dart';

void main() {
  group('parseText', () {
    test('keeps spaces', () {
      const text = 'Hello   World';
      final result = parseText(text);
      expect(result.length, 1);
      expect(result[0].text, 'Hello   World');
    });

    test('keeps newlines', () {
      const text = 'Hello\nWorld';
      final result = parseText(text);
      expect(result.length, 1);
      expect(result[0].text, 'Hello\nWorld');
    });

    test('keeps tabs', () {
      const text = 'Hello\tWorld';
      final result = parseText(text);
      expect(result.length, 1);
      expect(result[0].text, 'Hello\tWorld');
    });

    test('returns all links with urls', () {
      const text =
          'Check out [this link](https://example.com) but also [this one](https://example2.com)';
      final result = parseText(text);
      const expected = [
        TextPart(text: 'Check out ', url: null),
        TextPart(text: 'this link', url: 'https://example.com'),
        TextPart(text: ' but also ', url: null),
        TextPart(text: 'this one', url: 'https://example2.com'),
      ];
      expect(result, expected);
    });

    test('returns text as single part if no links', () {
      const text = 'Just plain text';
      final result = parseText(text);
      const expected = [
        TextPart(text: 'Just plain text', url: null),
      ];
      expect(result, expected);
    });
  });
}
