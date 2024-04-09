// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/components/custom_button.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/pages/meals_of_category_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.categorie,
  });

  final CategoryModel categorie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MealsOfCategoryPage(
            category: categorie,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(1, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.network(
                categorie.image,
              ),
            ),
            Text(
              categorie.name,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            CustomButton(
              text: 'List All',
              color: Colors.black,
              bold: true,
            )
          ],
        ),
      ),
    );
  }
}
