import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/components/heading_title.dart';
import 'package:meals_app/components/loader.dart';
import 'package:meals_app/components/tags_list.dart';
import 'package:meals_app/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:meals_app/helpers/fix_instructions.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/services/get_meal_by_id.dart';

class MealPage extends StatelessWidget {
  final String id;
  MealPage({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: FutureBuilder(
            future: GetMealById().getMealById(id: id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Mealmodel myMeal = snapshot.data!;
                List<String> ingredients = myMeal.ingredients!;
                List<String> mesures = myMeal.measures!;
                List<String> instructions =
                    fixInstruction(myMeal.instructions!);
                return ListView(
                  children: [
                    Stack(
                      children: [
                        Image.network(myMeal.image!),
                        Positioned(
                          right: 8,
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: BlocProvider.of<FavoritesCubit>(context)
                                      .favoriteMeals
                                      .containsKey(id)
                                  ? Colors.red
                                  : Colors.black,
                              size: 36,
                            ),
                            onPressed: () {
                              if (BlocProvider.of<FavoritesCubit>(context)
                                  .favoriteMeals
                                  .containsKey(myMeal.id)) {
                                BlocProvider.of<FavoritesCubit>(context)
                                    .removeMealFromFavorites(meal: myMeal);
                              } else {
                                BlocProvider.of<FavoritesCubit>(context)
                                    .addMealToFavorites(meal: myMeal);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Heading(
                              title: myMeal.name!,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TagsList(tags: myMeal.tags),
                          const SizedBox(height: 20),
                          const Heading(
                            title: 'Ingredients',
                            size: 20,
                          ),
                          const SizedBox(height: 20),
                          //bubble_chart_outlined
                          for (int index = 0;
                              index < ingredients.length;
                              index++)
                            ListTile(
                              leading: const Icon(
                                Icons.bubble_chart_outlined,
                                color: Colors.black87,
                              ),
                              title: Text(
                                ingredients[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(mesures[index]),
                            ),
                          const SizedBox(height: 20),
                          const Heading(
                            title: 'Instructions',
                            size: 20,
                          ),
                          for (int i = 0; i < instructions.length; i++)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFFEDEDED),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                instructions[i],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Loader();
              }
            },
          ),
        );
      },
    );
  }
}
