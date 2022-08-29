import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/Meal.dart';

class Meal_provider with ChangeNotifier{

  Map <String,bool> filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };

  List<Meal> avilable_meals=DUMMY_MEALS;
  List<Meal> fav_meals=[];
  bool is_meal_fav=false;

  void toggaleFavourit(String mealId){
    final existingIndex=fav_meals.indexWhere((meal) => meal.id==mealId);

    if(existingIndex >= 0){

        fav_meals.removeAt(existingIndex);


    }else{

        fav_meals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));

    }
     is_meal_fav=fav_meals.any((meal) => meal.id==mealId);
    notifyListeners();
  }
/*

  bool is_meal_fav(String id){

    return fav_meals.any((meal) => meal.id==id);
    notifyListeners();

  }
*/

  void set_filters(Map <String,bool> _filters_data){

      filters=_filters_data;

      avilable_meals=DUMMY_MEALS.where((meal){
        var g=filters['gluten'];
        var l=filters['lactose'];
        var vegan=filters['vegan'];
        var vegi=filters['vegetarian'];

        if(g! && (!meal.isGlutenFree)){
          return false;
        }
        if(l! && (!meal.isLactoseFree)){
          return false;
        }
        if(vegan! && (!meal.isVegan)){
          return false;
        }
        if(vegi! && (!meal.isVegetarian)){
          return false;
        }
        return true;

      }).toList();

      notifyListeners();
  }
}
