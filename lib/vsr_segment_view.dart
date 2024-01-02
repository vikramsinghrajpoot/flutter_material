import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'vsr_text.dart';

class VSRAppSegment extends StatefulWidget {
  const VSRAppSegment({key, required this.children, required this.valueCallback, required this.value, required this.title})
      : super(key: key);
  final Map<int, Widget> children;
  final Function valueCallback;
  final int value;
  final  String title;

  @override
  State<VSRAppSegment> createState() => _AppSegmentState();
}

class _AppSegmentState extends State<VSRAppSegment> {
  int value = 0;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSRText(
          widget.title,
          padding:const EdgeInsets.only(bottom: 5),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CupertinoSegmentedControl<int>(
              padding: EdgeInsets.zero,
              selectedColor: Colors.red,
              borderColor: Colors.white,
              children: widget.children,
              onValueChanged: (int val) {
                setState(() {
                  value = val;
                });
                widget.valueCallback(val);
              },
              groupValue: value,
            )),
      ],
    );
  }
}
