class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String description;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory CategoryModel.fromJson(jsondata) {
    return CategoryModel(
      id: jsondata["idCategory"],
      name: jsondata["strCategory"],
      description: jsondata["strCategoryDescription"],
      image: jsondata["strCategoryThumb"],
    );
  }
}
