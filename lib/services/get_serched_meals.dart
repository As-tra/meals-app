import 'package:meals_app/helpers/api.dart';
import 'package:meals_app/models/meal_model.dart';

class GetSearchedMeals {
  Future<List<Mealmodel>> getSearchedMeals({String? name}) async {
    String url = "https://www.themealdb.com/api/json/v1/1/search.php?s=$name";
    var data = await Api().get(url: url);

    List<Mealmodel> meals = [];
    if (data['meals'] != null) {
      for (var item in data['meals']) {
        meals.add(Mealmodel.fromJson({
          'meals': [item]
        }));
      }
    }
    return meals;
  }
}
