import 'package:flutter/material.dart';

class IntroNavigationButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onpressed;

  const IntroNavigationButton({
    super.key,
    required this.text,
    required this.color,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text),
      ),
    );
  }
}
