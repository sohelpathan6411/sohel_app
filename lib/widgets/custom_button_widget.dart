import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color? bgColor, fontColor;
  final String text;
  final double? fontSize;
  final double? radius;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  const CustomButtonWidget(
      {super.key, this.bgColor, this.fontColor=Colors.white, required this.text, required this.onPressed,  this.fontSize=14, this.radius=20.0,  this.padding=EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!), // <-- Radius
        ),
        backgroundColor: bgColor ??Colors.blue.shade600,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding!,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: fontColor),
        ),
      ),
    );
  }
}
