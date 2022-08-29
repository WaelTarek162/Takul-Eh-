
import 'package:flutter/material.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import 'package:meal/Widget/meal_item.dart';
import 'package:meal/dummy_data.dart';
import 'package:provider/provider.dart';

import '../models/Meal.dart';
import '../provider/meal_provider.dart';

class category_meal_screen extends StatefulWidget {
  static const route_name = '/categories';


  @override
  State<category_meal_screen> createState() => _category_meal_screenState();
}

class _category_meal_screenState extends State<category_meal_screen> {









  @override
  Widget build(BuildContext context) {



    final List<Meal>avilable_meals = Provider.of<Meal_provider>(context,listen: true).avilable_meals;

    List<Meal> display_meal;
    late String CatigoryTitle;

    final Args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = Args['id'];
    final title = Args['title'];
    CatigoryTitle=title!;
    display_meal =avilable_meals.where((meal) {
      return meal.categories.contains(id);
    }).toList();



    void _remove_meal(Map<String,String> id){

      setState(() {
        DUMMY_MEALS.removeWhere((element)=>element.id==id['id']);
      });
    }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(CatigoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Meal_item(

              id: display_meal[index].id,
              img_url: display_meal[index].imageUrl,
              complexity: display_meal[index].complexity,
              title: display_meal[index].title,
              affordability: display_meal[index].affordability,
              duration: display_meal[index].duration,
            );
          },
          itemCount: display_meal.length,

        ),

      ),
      routes: {
        MealDetailsScreen.routeName:(context) => MealDetailsScreen(),

      },
    );
  }
}
