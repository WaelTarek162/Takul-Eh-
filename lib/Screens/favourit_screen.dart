import 'package:flutter/material.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import '../provider/meal_provider.dart';
import 'package:provider/provider.dart';
import '../Widget/meal_item.dart';
import '../models/Meal.dart';

class FavouriteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final List<Meal>fav_meal=Provider.of<Meal_provider>(context,listen: false).fav_meals as List<Meal>;

    if(fav_meal.isEmpty){
      return Center(
        child: Text('You have no favorite meals.'),
      );
    }
    else{
      return ListView.builder(

        itemBuilder: (ctx, index) {
          return Meal_item(
            id: fav_meal[index].id,
            img_url: fav_meal[index].imageUrl,
            complexity: fav_meal[index].complexity,
            title: fav_meal[index].title,
            affordability: fav_meal[index].affordability,
            duration: fav_meal[index].duration,
          );
        },
        itemCount: fav_meal.length,

      );
    }


  }
}
