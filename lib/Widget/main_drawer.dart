import 'package:flutter/material.dart';
import 'package:meal/Screens/category_meal_screen.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/filters_screen.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import 'package:meal/Screens/tabs_screen.dart';
import 'package:meal/Screens/theme_screen.dart';

class Main_Drawer extends StatelessWidget {
  Widget build_list_tile(String title, IconData iconData,
      VoidCallback TabHandler, BuildContext ctx) {
    return ListTile(
      selected: true,
      hoverColor:Theme.of(ctx).hoverColor,
      leading: Icon(
        iconData, size: 26,color: Theme.of(ctx).colorScheme.secondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(ctx).colorScheme.secondary,
          fontSize: 24,
          fontFamily: 'RobotoCondenced',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: TabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          const SizedBox(height: 20),
          build_list_tile('All Categories', Icons.restaurant, () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TabsScreen()));
          }, context),
          build_list_tile('Filter', Icons.filter_alt_sharp, () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Filter_screen()));
          }, context),
          build_list_tile('Theme', Icons.color_lens, () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Theme_Screen()));
          }, context)
        ],
      ),
    );
  }
}
