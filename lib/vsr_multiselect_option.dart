import 'package:flutter/material.dart';

import 'vsr_text.dart';

class VSRMultiselectOption extends StatefulWidget {
  final List<String>? options;
  final String? title;
  final EdgeInsets padding;
  final TextStyle? titleStyle;
  const VSRMultiselectOption(
      {key,
      required this.options,
      this.title,
      this.padding = EdgeInsets.zero,
      this.titleStyle})
      : super(key: key);

  @override
  State<VSRMultiselectOption> createState() => _AppMultiselectOptionState();
}

class _AppMultiselectOptionState extends State<VSRMultiselectOption> {
  List<String> selectedValues = List<String>.empty(growable: true);
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
                          selectedValues.contains(value)
                              ? selectedValues.remove(value)
                              : selectedValues.add(value);
                          setState(() {});
                        },
                        child: Card(
                            color: selectedValues.contains(value)
                                ? Colors.green
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: VSRText(value),
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
