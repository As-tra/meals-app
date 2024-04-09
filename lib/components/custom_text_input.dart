import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/constants.dart';

class CustomTextInput extends StatelessWidget {
  final String text;
  final int maxlines;
  const CustomTextInput(
      {super.key, required this.maxlines, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? '* Field is Required' : null,
      maxLines: maxlines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: text,
        hintStyle: GoogleFonts.epilogue(
          color: const Color(0xFF737373),
        ),
        fillColor: kmainColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
