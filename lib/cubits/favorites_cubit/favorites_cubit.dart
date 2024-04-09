import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/models/meal_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  Map<String, Mealmodel> favoriteMeals = {};

  void addMealToFavorites({required Mealmodel meal}) {
    favoriteMeals[meal.id] = meal;
    emit(AddToFaroitesState());
  }

  void removeMealFromFavorites({required Mealmodel meal}) {
    favoriteMeals.remove(meal.id);
    emit(RemoveFromFaroitesState());
  }
}
