import 'package:meals_app/helpers/api.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/services/get_meal_by_id.dart';

class GetMealsByCategory {
  Future<List<Mealmodel>> getMealsByCategory({required String category}) async {
    var data = await Api().get(
        url: 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
    List<Mealmodel> meals = [];
    for (var meal in data['meals']) {
      String id = Mealmodel.instantiate(meal).id;
      Mealmodel fullMeal = await GetMealById().getMealById(id: id);
      meals.add(fullMeal);
    }
    return meals;
  }
}
