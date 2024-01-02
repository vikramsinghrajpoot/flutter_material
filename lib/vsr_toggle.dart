import 'package:flutter/material.dart';

import 'vsr_text.dart';

class VSRToggleButton extends StatefulWidget {
  final Function valueCallback;
  final List<VSRText> options;
  const VSRToggleButton(
      {key, required this.valueCallback, required this.options})
      : super(key: key);

  @override
  State<VSRToggleButton> createState() => _VSRToggleButtonState();
}

class _VSRToggleButtonState extends State<VSRToggleButton> {
  List<bool>? isSelected;

  @override
  void initState() {
    isSelected = _resetDefault();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(5),
      children: [...widget.options],
      isSelected: isSelected!,
      onPressed: (int index) {
        setState(() {
          isSelected = _resetDefault();
          isSelected![index] = !isSelected![index];
        });
        widget.valueCallback(index);
      },
    );
  }

  _resetDefault() =>
      List<bool>.filled(widget.options.length, false, growable: true);
}
