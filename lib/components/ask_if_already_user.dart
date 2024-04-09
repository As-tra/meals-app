import 'package:flutter/material.dart';

class AskIfAlreadyUserOrNot extends StatelessWidget {
  final String text;
  final String page;
  final VoidCallback onpressed;
  const AskIfAlreadyUserOrNot({
    super.key,
    required this.text,
    required this.page,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onpressed,
            child: Text(
              page,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
