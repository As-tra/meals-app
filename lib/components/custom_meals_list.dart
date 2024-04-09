import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/meal_page.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({
    super.key,
    required this.meals,
  });

  final List<Mealmodel> meals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MealPage(
                      id: meals[index].id,
                    );
                  },
                ),
              );
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      meals[index].image!,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    meals[index].name!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
