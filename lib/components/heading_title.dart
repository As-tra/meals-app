import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  final String title;
  final double size;
  const Heading({
    super.key,
    required this.title,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.epilogue(
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        )
      ],
    );
  }
}
