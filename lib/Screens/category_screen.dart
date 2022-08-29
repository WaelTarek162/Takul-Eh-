import 'package:flutter/material.dart';
import 'package:meal/Widget/category_item.dart';
import 'package:meal/dummy_data.dart';

import 'category_meal_screen.dart';
import 'filters_screen.dart';

class CategoriesScreen extends StatelessWidget {
static const route_name='/CategScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: GridView(
          padding: EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((categ) => Category_item(
                  id: categ.id, title: categ.title, color: categ.color)).toList(),
        ),
      ),
      routes: {

        category_meal_screen.route_name: (context) => category_meal_screen(),

      },
    );
  }
}
