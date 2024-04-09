import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/search_page.dart';
import 'package:meals_app/services/get_serched_meals.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) async {
        List<Mealmodel> meals =
            await GetSearchedMeals().getSearchedMeals(name: value);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (constext) {
              return SearchPage(foundedMeals: meals);
            },
          ),
        );
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        iconColor: const Color(0xFF737373),
        prefixIcon: const Icon(Icons.search),
        hintText: "Find your next meal",
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
