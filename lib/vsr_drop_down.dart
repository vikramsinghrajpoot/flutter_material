import 'package:flutter/material.dart';
import 'vsr_text.dart';

class VSRDropDown extends StatefulWidget {
  final List<String>? options;
  final String? title;
  final String? defaultValue;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String? hintText;
  final Widget? userlineWidget;
  final int elevation;
  final double? height;
  final double borderRadius;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final BoxBorder? border;
  final bool? isExpanded;
  const VSRDropDown(
      {key,
      this.options,
      this.title,
      this.defaultValue,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.hintText = "",
      this.userlineWidget,
      this.elevation = 0,
      this.height = 35,
      this.borderRadius = 5,
      this.hintStyle,
      this.titleStyle,
      this.border,
      this.isExpanded = true})
      : super(key: key);

  @override
  State<VSRDropDown> createState() => _VSRDropDownState();
}

class _VSRDropDownState extends State<VSRDropDown> {
  String? selectedOption;

  @override
  void initState() {
    if (widget.defaultValue == null) selectedOption = widget.options?.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            VSRText(
              widget.title ?? "",
              padding: const EdgeInsets.only(left: 7, bottom: 3),
              style: widget.titleStyle ??
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          Container(
            padding: widget.padding,
            margin: widget.margin,
            decoration: BoxDecoration(
                border:
                    widget.border ?? Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(widget.borderRadius)),
            child: SizedBox(
              height: widget.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      underline: widget.userlineWidget,
                      elevation: widget.elevation,
                      hint: VSRText(
                        widget.hintText,
                        style: widget.hintStyle,
                      ),
                      isExpanded: widget.isExpanded!,
                      value: selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption = newValue;
                        });
                      },
                      items: widget.options?.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: VSRText(option),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
