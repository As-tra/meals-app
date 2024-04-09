import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_overview.dart';
import 'package:meals_app/models/meal_model.dart';

class SearchPage extends StatelessWidget {
  final List<Mealmodel> foundedMeals;
  const SearchPage({super.key, required this.foundedMeals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: foundedMeals.isNotEmpty
          ? ListView(
              children: [
                Center(
                  child: Text(
                    'You have ${foundedMeals.length} Result:',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: foundedMeals.length,
                  itemBuilder: (context, index) {
                    return MealOverView(meal: foundedMeals[index]);
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'NO RESULTS FOUND',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset('assets/images/404.png'),
                ],
              ),
            ),
    );
  }
}
