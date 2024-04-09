import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/components/custom_header.dart';
import 'package:meals_app/components/meal_overview.dart';
import 'package:meals_app/cubits/favorites_cubit/favorites_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return BlocProvider.of<FavoritesCubit>(context).favoriteMeals.isNotEmpty
            ? ListView(
                children: [
                  const SizedBox(
                    height: 36,
                  ),
                  const CustomHeader(
                    text: 'F A V O R I T E S',
                    myIcon: Icons.favorite,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: BlocProvider.of<FavoritesCubit>(context)
                        .favoriteMeals
                        .length,
                    itemBuilder: (context, index) {
                      var entry = BlocProvider.of<FavoritesCubit>(context)
                          .favoriteMeals
                          .entries
                          .elementAt(index)
                          .value;
                      return MealOverView(meal: entry);
                    },
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '(,,>﹏<,,)',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'No Meals Selected ',
                      style: GoogleFonts.epilogue(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
