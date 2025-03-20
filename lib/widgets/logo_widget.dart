import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String imagePath;
  final double size;
  final double padding;
  const LogoWidget({super.key, required this.imagePath, required this.size, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        padding:  EdgeInsets.all(padding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      );
  }
}