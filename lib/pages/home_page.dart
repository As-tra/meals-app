import 'package:flutter/material.dart';
import 'package:meals_app/components/custom_card.dart';
import 'package:meals_app/components/custom_header.dart';
import 'package:meals_app/components/custom_meals_list.dart';
import 'package:meals_app/components/custom_search.dart';
import 'package:meals_app/components/heading_title.dart';
import 'package:meals_app/components/loader.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/services/get_all_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: GetAllData().getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else {
            if (snapshot.hasData && snapshot.data![2]) {
              List<Mealmodel> meals = snapshot.data![1];
              List<CategoryModel> categories = snapshot.data![0];
              return ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomHeader(
                    text: 'R E C I P E S',
                    myIcon: Icons.local_dining,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const CustomSearchField(),
                  const SizedBox(
                    height: 50,
                  ),
                  const Heading(
                    title: "What's popular",
                    size: 20,
                  ),
                  const SizedBox(height: 30),
                  MealsListView(meals: meals),
                  const SizedBox(
                    height: 20,
                  ),
                  const Heading(
                    title: "Pick Up Your Category",
                    size: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(categorie: categories[index]);
                    },
                  )
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'NO INTERNET CONNECTION',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset('assets/images/404.png'),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
