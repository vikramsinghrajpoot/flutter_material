import 'package:flutter/material.dart';

class VSRRoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Icon? icon;
  final String label;
  final Color? labelColor;

const VSRRoundButton({ key,
    required this.onPressed,
    required this.color,
    this.icon,
    required this.label,
    this.labelColor= Colors.white
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side:const BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          Text(label,style: TextStyle(color: labelColor)),
          Spacer(),
          if (icon != null) icon!,
        ],
      ),
    );
  }
}
