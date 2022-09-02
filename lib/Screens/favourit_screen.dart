import 'package:flutter/material.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import '../provider/meal_provider.dart';
import 'package:provider/provider.dart';
import '../Widget/meal_item.dart';
import '../models/Meal.dart';

class FavouriteScreen extends StatelessWidget {
  static final route_name = 'fav_screen';


  @override
  Widget build(BuildContext context) {
    bool is_landscabe=MediaQuery.of(context).orientation==Orientation.landscape;
    var dw=MediaQuery.of(context).size.width;
    var dh=MediaQuery.of(context).size.height;


     final List<Meal>fav_meal=Provider.of<Meal_provider>(context,listen: false).fav_meals;

    if(fav_meal.isEmpty){
      return Center(
        child: Text('You have no favorite meals.',style: Theme.of(context).textTheme.bodyText1,),
      );
    }
    else{
        return Scaffold(
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:dw <= 400 ? 400 : 500 ,
              childAspectRatio: is_landscabe?dw/(dw*0.85):dw/(dw*0.75),
              crossAxisSpacing: 0,
              mainAxisSpacing: 0
            ),

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

          ),
      );
    }


  }
}
