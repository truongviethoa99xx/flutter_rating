import 'package:flutter/material.dart';

class CustomizeTextButton extends StatelessWidget {
  const CustomizeTextButton({
    this.onPressed,
    required this.widget,
    required this.textValue,
    this.textFontWeight = FontWeight.w600,
    this.textSize = 25.0,

  });
  final VoidCallback? onPressed;
  final Widget widget;
  final String textValue;
  final double textSize;
  final FontWeight textFontWeight;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(padding: const EdgeInsets.all(0.0)),
          child: widget),
        Text(textValue,
          style: TextStyle(
              fontSize: textSize, fontWeight: textFontWeight))
    ]);
  }
}

