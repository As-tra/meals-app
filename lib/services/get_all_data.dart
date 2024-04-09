import 'package:meals_app/helpers/test_connection.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/services/get_all_categories.dart';
import 'package:meals_app/services/get_random_meals.dart';

class GetAllData {
  Future<List> getAllData() async {
    List<CategoryModel> categories =
        await GetAllCategories().getAllCategories();
    List<Mealmodel> meals = await RandomMeals().getRandomMeals();
    bool connection = await hasNetwork();
    return [categories, meals,connection];
  }
}
