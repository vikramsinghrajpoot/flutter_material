import 'package:flutter/material.dart';

import 'vsr_text.dart';

class VSRMultiselectOption extends StatefulWidget {
  final List<String>? options;
  final String? title;
  final EdgeInsets padding;
  final TextStyle? titleStyle;
  final Function? valueCallback;
  final Color selectedColor;
  final TextStyle? selectedTitleStyle;
  final List<String>? selectedValues;

  const VSRMultiselectOption(
      {key,
      required this.options,
      this.title,
      this.padding = EdgeInsets.zero,
      this.titleStyle,
      this.selectedTitleStyle,
      this.valueCallback,
      this.selectedColor = Colors.green,
      this.selectedValues})
      : super(key: key);

  @override
  State<VSRMultiselectOption> createState() => _AppMultiselectOptionState();
}

class _AppMultiselectOptionState extends State<VSRMultiselectOption> {
  List<String> selectedValues = List<String>.empty(growable: true);

  @override
  void initState() {
    if (widget.selectedValues != null) {
      selectedValues = widget.selectedValues!;
    }
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
              widget.title,
              style: widget.titleStyle,
            ),
          Wrap(
            children: [
              ...widget.options!
                  .map((value) => InkWell(
                        onTap: () {
                          if (widget.valueCallback == null) return;
                          selectedValues.contains(value)
                              ? selectedValues.remove(value)
                              : selectedValues.add(value);
                          setState(() {});
                          widget.valueCallback!(selectedValues);
                        },
                        child: Card(
                            color: selectedValues.contains(value)
                                ? widget.selectedColor
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: VSRText(value,
                                  style: selectedValues.contains(value)
                                      ? widget.selectedTitleStyle
                                      : widget.titleStyle),
                            )),
                      ))
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
