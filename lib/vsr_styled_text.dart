import 'package:flutter/material.dart';

class VSRStyledText extends StatelessWidget {
  final List<TextSpan> secodaryStyledText;
  final String primaryText;
  final TextStyle? primaryTextStyled;
  const VSRStyledText(
      {key,
      required this.secodaryStyledText,
      required this.primaryText,
      this.primaryTextStyled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: primaryText,
          style: primaryTextStyled ?? const TextStyle(),
          children: secodaryStyledText),
    );
  }
}
