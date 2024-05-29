import 'package:flutter/material.dart';

class VSRTextField extends StatelessWidget {
  final String? hintText;
  final Function? valueCallback;
  final TextStyle? hintTytle;
  final String? titleText;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextStyle? titleSytle;
  final TextStyle? textSytle;
  final TextStyle? errorSytle;
  final double height;
  final EdgeInsets padding;
  final String? value;
  final bool obscureText;
  final double radius;
  final Widget? suffixIcon;
  final Color borderColor;
  final EdgeInsets? contentPadding;
  final String? errorText;
  final bool isReadOnly;

  const VSRTextField(
      {Key? key,
      this.hintText,
      this.valueCallback,
      this.hintTytle,
      this.titleText,
      this.maxLines,
      this.keyboardType,
      this.maxLength,
      this.titleSytle,
      this.textSytle,
      this.height = 40,
      this.value,
      this.obscureText = false,
      this.radius = 5,
      this.suffixIcon,
      this.borderColor = Colors.black,
      this.padding = EdgeInsets.zero,
      this.contentPadding,
      this.errorSytle,
      this.isReadOnly = false,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText != null)
            Text(
              titleText ?? "",
              style: titleSytle,
            ),
          if (titleText != null)
            const SizedBox(
              height: 3,
            ),
          SizedBox(
            height: height,
            child: TextFormField(
              readOnly : isReadOnly,
              obscureText: obscureText,
              initialValue: value,
              style: textSytle,
              maxLength: maxLength,
              keyboardType: keyboardType,
              maxLines: maxLines,
              onChanged: (v) =>
                  (valueCallback != null) ? valueCallback!(v) : {},
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                hintText: hintText ?? "",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(
                      color: borderColor,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(
                      color: borderColor,
                    )),
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              ),
            ),
          ),
          if (errorText != null)
            const SizedBox(
              height: 2,
            ),
          if (errorText != null)
            Text(
              errorText ?? "",
              style: const TextStyle(color: Colors.red).merge(errorSytle),
            ),
        ],
      ),
    );
  }
}
