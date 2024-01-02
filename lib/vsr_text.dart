import 'package:flutter/material.dart';

class VSRText extends StatelessWidget {
  final String? text;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int? maxLines;
  final TextStyle? style;
  final TextOverflow? overflow;
  const VSRText(
    this.text, {
    Key? key,
    this.margin = EdgeInsets.zero,
    this.style,
    this.textAlign = TextAlign.center,
    this.padding = EdgeInsets.zero,
    this.maxLines,
    this.overflow = TextOverflow.clip
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        margin: margin,
        child: Text(
          text ?? '',
          maxLines: maxLines,
          softWrap: true,
          overflow: overflow,
          textAlign: textAlign,
          style: style,
        ),
      ),
    );
  }
}
