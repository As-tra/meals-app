import 'package:meals_app/helpers/api.dart';
import 'package:meals_app/models/meal_model.dart';

class GetMealByName {
  // if you pass the name of the meal it will search based on the name 
  // else it return a random meal
  Future<Mealmodel> getMealByName({String? name}) async {
    String url = name == null ? "https://www.themealdb.com/api/json/v1/1/random.php" :"https://www.themealdb.com/api/json/v1/1/search.php?s=$name";
    var data = await Api()
        .get(url: url);
    return Mealmodel.fromJson(data);
  }
}
