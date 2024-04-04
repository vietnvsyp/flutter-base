import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;

  const CustomRichText(
    this.text, {
    this.textAlign,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: _makeTextSpans()),
      textAlign: textAlign,
      style: style,
    );
  }

  List<TextSpan> _makeTextSpans() {
    final matches = RegExp(r"\{.*?\}").allMatches(text);
    List<TextSpan> textSpans = [];
    if (matches.isEmpty) {
      textSpans.add(TextSpan(text: text));
    } else {
      RegExpMatch? prevMatch;
      for (final match in matches) {
        textSpans.add(TextSpan(
          text: text.substring(prevMatch?.end ?? 0, match.start),
        ));
        textSpans.add(TextSpan(
          text: text.substring(match.start + 1, match.end - 1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
        prevMatch = match;
      }
      textSpans.add(TextSpan(
        text: text.substring(prevMatch?.end ?? 0, text.length),
      ));
    }
    return textSpans;
  }
}
