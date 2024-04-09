class FixData {
  List<String> parseData(jsonData, int choice) {
    String jsonKey = choice == 2 ? "strIngredient" : "strMeasure";

    List<String> mealDetails = [];
    for (int i = 1; i < 21; i++) {
      String currentKey = '$jsonKey$i';
      if (jsonData[currentKey] != null && jsonData[currentKey] != "") {
        mealDetails.add(jsonData[currentKey]);
      }
    }
    return mealDetails;
  }
}
