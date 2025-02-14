library linked_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_text/parse_text.dart';

class LinkedText extends StatelessWidget {
  final List<TextPart> parts;
  final Function(String url) onLinkTap;

  final TextAlign? textAlign;

  const LinkedText._({
    super.key,
    required this.parts,
    required this.onLinkTap,
    this.textAlign,
  });

  factory LinkedText(
      {Key? key,
      required String text,
      required Function(String url) onLinkTap,
      TextAlign? textAlign}) {
    return LinkedText._(
      key: key,
      parts: parseText(text),
      onLinkTap: onLinkTap,
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: parts
            .map((part) => TextSpan(
                  text: part.text,
                  recognizer: part.url != null
                      ? (TapGestureRecognizer()
                        ..onTap = () => onLinkTap(part.url!))
                      : null,
                  style: part.url != null
                      ? const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF0000EE))
                      : null,
                ))
            .toList(),
      ),
      textAlign: textAlign,
    );
  }
}
