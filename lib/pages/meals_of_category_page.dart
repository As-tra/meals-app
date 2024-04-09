import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/components/loader.dart';
import 'package:meals_app/components/meal_overview.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/services/get_meals_by_category.dart';

class MealsOfCategoryPage extends StatelessWidget {
  final CategoryModel category;
  const MealsOfCategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category.name,
          style: GoogleFonts.epilogue(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future:
            GetMealsByCategory().getMealsByCategory(category: category.name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Mealmodel> meals = snapshot.data!;
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Image.network(
                        category.image,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          category.description,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MealOverView(meal: meals[index]),
                    ],
                  );
                }
                return MealOverView(meal: meals[index]);
              },
            );
          } else {
            return const Loader();
          }
        },
      ),
    );
  }
}
