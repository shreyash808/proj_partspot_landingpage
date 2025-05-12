import 'package:flutter/material.dart';


class TextView extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  const TextView(this.text, {super.key, this.style, this.textAlign, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
