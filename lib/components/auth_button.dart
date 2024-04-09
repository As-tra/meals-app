import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';

class AuthicationButton extends StatelessWidget {
  final String text;

  final VoidCallback onpressed;

  const AuthicationButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onpressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    color: kmainColor,
                  ),
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: kmainColor,
                  size: 40,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
