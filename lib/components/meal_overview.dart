import 'package:flutter/material.dart';
import 'package:meals_app/components/custom_button.dart';
import 'package:meals_app/components/tags_list.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/meal_page.dart';

class MealOverView extends StatelessWidget {
  const MealOverView({
    super.key,
    required this.meal,
  });

  final Mealmodel meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 210,
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  meal.name!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                  width: 210, child: TagsList(tags: meal.tags)),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealPage(id: meal.id),
                    ),
                  );
                },
                child: const CustomButton(
                  text: 'View details',
                  color: Colors.black,
                  bold: true,
                ),
              ),
            ],
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              meal.image!,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
