import 'package:meals_app/helpers/api.dart';
import 'package:meals_app/models/meal_model.dart';

class GetMealById {

  Future<Mealmodel> getMealById({required String id}) async {
    
    var data = await Api()
        .get(url: 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
    return Mealmodel.fromJson(data);
  }
}
