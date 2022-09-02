import 'package:flutter/material.dart';
import 'package:meal/Screens/category_meal_screen.dart';


class Category_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  Category_item({required this.id, required this.title, required this.color});

  void select_category(BuildContext ctx){

    Navigator.of(ctx).pushNamed(category_meal_screen.route_name,arguments: {
      'id':id,
      'title':title
    });

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>select_category(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.bodyText2
        ),
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.3), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
