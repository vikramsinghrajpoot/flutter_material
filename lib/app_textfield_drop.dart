import 'package:flutter/material.dart';
import 'vsr_drop_down.dart';
import 'vsr_text_field.dart';

class VSRTextFieldDrop extends StatelessWidget {
  final List<String>? options;
  final String hintText;
  final Function? valueCallback;
  final TextStyle? hintTytle;
  final String? titleText;
  const VSRTextFieldDrop(
      {key,
      this.options,
      required this.hintText,
      this.hintTytle,
      this.titleText,
      this.valueCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: VSRTextField(
              titleText: titleText,
              hintText: "",
              hintTytle: hintTytle,
              valueCallback: valueCallback,
            ),
            flex: 2,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: VSRDropDown(
                options: options,
              ),
            ),
          )
        ],
      ),
    );
  }
}
