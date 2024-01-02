import 'package:flutter/material.dart';

import 'vsr_text.dart';

class VSRTextField extends StatelessWidget {
  final String? hintText;
  final Function? valueCallback;
  final TextStyle? hintTytle;
  final String? titleText;

  const VSRTextField(
      {key, this.hintText, this.valueCallback, this.hintTytle, this.titleText})
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
            onChanged: (v) => (valueCallback != null) ? valueCallback!(v) : {},
            decoration: InputDecoration(
              hintText: hintText ?? "",
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ),
        ),
      ],
    );
  }
}
