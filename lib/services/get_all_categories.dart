import 'package:meals_app/helpers/api.dart';
import 'package:meals_app/models/category_model.dart';

class GetAllCategories {
  Future<List<CategoryModel>> getAllCategories() async {
    var data =
        await Api().get(url: 'https://www.themealdb.com/api/json/v1/1/categories.php');
    List<CategoryModel> categories = [];
    for (var category in data['categories']) {
      categories.add(CategoryModel.fromJson(category));
    }
    return categories;
  }
}
