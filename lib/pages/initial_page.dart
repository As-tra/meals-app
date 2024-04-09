import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/pages/add_recipe_page.dart';
import 'package:meals_app/pages/favorite_page.dart';
import 'package:meals_app/pages/home_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List<Widget> myScreens = const [
    HomePage(),
    FavoritePage(),
    ShareMealPage(),
  ];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[currentPageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: kmainColor,
        index: currentPageIndex,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        items: const [
          Icon(Icons.home_outlined),
          Icon(Icons.favorite_outline),
          Icon(Icons.lightbulb_outline),
        ],
      ),
    );
  }
}
