import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  final IconData myIcon;
  const CustomHeader({
    super.key,
    required this.text,
    required this.myIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.epilogue(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          myIcon,
          size: 30,
        ),
      ],
    );
  }
}
