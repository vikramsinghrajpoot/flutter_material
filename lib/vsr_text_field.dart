import 'dart:ui';

import 'package:flutter/material.dart';

import 'vsr_text.dart';

class VSRTextField extends StatelessWidget {
  final String? hintText;
  final Function? valueCallback;
  final TextStyle? hintTytle;
  final String? titleText;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;

  const VSRTextField(
      {key,
      this.hintText,
      this.valueCallback,
      this.hintTytle,
      this.titleText,
      this.maxLines,
      this.keyboardType,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSRText(
          titleText,
          style: hintTytle,
        ),
        Container(
          margin: const EdgeInsets.only(top: 3),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            maxLength: maxLength,
            keyboardType: keyboardType,
            maxLines: maxLines,
            onChanged: (v) => (valueCallback != null) ? valueCallback!(v) : {},
            decoration: InputDecoration(
              hintText: hintText ?? "",
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            ),
          ),
        ),
      ],
    );
  }
}
