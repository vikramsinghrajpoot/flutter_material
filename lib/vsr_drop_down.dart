import 'package:flutter/material.dart';

import 'vsr_text.dart';

class VSRDropDown extends StatefulWidget {
  final List<String>? options;
  final String? title;
  final String? defaultValue;
  final EdgeInsets padding;
  const VSRDropDown(
      {key,
      this.options,
      this.title,
      this.defaultValue,
      this.padding = EdgeInsets.zero})
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
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5)),
            child: SizedBox(
              height: 37,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      elevation: 0,
                      hint: const Text('Select property type'),
                      isExpanded: true,
                      value: selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption = newValue;
                        });
                      },
                      items: widget.options?.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
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
