import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool bold;
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kmainColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
