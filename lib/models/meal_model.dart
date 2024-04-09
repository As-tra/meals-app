import 'package:meals_app/helpers/extract_list.dart';

class Mealmodel {
  final String id;
  String? name;
  String? image;
  String? category;
  String? instructions;
  String? youtube;
  String? tags;
  List<String>? ingredients;
  List<String>? measures;

  Mealmodel({
    required this.id,
    required this.name,
    required this.category,
    required this.instructions,
    required this.image,
    required this.youtube,
    required this.ingredients,
    required this.measures,
    required this.tags,
  });

  Mealmodel.fewDetails({
    required this.id,
  });

  factory Mealmodel.fromJson(jsonData) {
    jsonData = jsonData["meals"][0];
    return Mealmodel(
      id: jsonData["idMeal"],
      name: jsonData["strMeal"],
      category: jsonData["strCategory"],
      instructions: jsonData["strInstructions"],
      image: jsonData["strMealThumb"],
      youtube: jsonData["strYoutube"],
      tags: jsonData["strTags"],
      measures: FixData().parseData(jsonData, 1),
      ingredients: FixData().parseData(jsonData, 2),
    );
  }

  factory Mealmodel.instantiate(jsonData) {
    return Mealmodel.fewDetails(
      id: jsonData['idMeal'],
    );
  }
}
