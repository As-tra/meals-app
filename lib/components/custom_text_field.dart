import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final String hintText;
  final IconData fieldIcon;
  final bool hideTypedText;
  final Function(String)? onChanged;
  const CustomFormTextField({
    super.key,
    required this.fieldIcon,
    required this.hintText,
    required this.hideTypedText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '* Field is required';
        }
      },
      onChanged: onChanged,
      obscureText: hideTypedText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        prefixIcon: Icon(
          fieldIcon,
          color: Colors.black,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
