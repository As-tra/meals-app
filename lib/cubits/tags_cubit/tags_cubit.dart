import 'package:flutter_bloc/flutter_bloc.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<TagsState> {
  TagsCubit() : super(TagsInitial());
  Map<String, bool> mealTagsMap = {
    'Delicious': false,
    'FastFood': false,
    'HealthyEating': false,
    'HomeCooking': false,
    'Vegan': false,
    'Vegetarian': false,
    'GlutenFree': false,
    'Dessert': false,
    'Breakfast': false,
    'Lunch': false,
    'Dinner': false,
    'Snack': false,
    'Organic': false,
    'ComfortFood': false,
    'StreetFood': false,
    'FineDining': false,
    'FastCasual': false,
    'Takeout': false,
    'Seafood': false,
    'Beverages': false,
  };

  void selectTag({required String tag}) {
    if (mealTagsMap[tag] == false) {
      mealTagsMap[tag] = true;
      emit(TagSelected());
    } else {
      mealTagsMap[tag] = false;
      emit(TagUnselected());
    }
  }
}
