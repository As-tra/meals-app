import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/services/get_meal_by_name.dart';

class RandomMeals {
  Future<List<Mealmodel>> getRandomMeals() async {
    List<Mealmodel> myRandomMeals = [];
    for (int i = 0; i < 10; i++) {
      Mealmodel meal = await GetMealByName().getMealByName();
      myRandomMeals.add(meal);
    }
    return myRandomMeals;
  }
}
