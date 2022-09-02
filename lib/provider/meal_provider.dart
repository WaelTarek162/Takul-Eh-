import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/Category.dart' as categ;
import '../dummy_data.dart';
import '../models/Meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Meal_provider with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> avilable_meals = DUMMY_MEALS;
  List<Meal> fav_meals = [];
  List<String> prefsMealId = [];
  List<categ.Category> avilable_category = DUMMY_CATEGORIES;

  void toggaleFavourit(String mealId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final existingIndex = fav_meals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      fav_meals.removeAt(existingIndex);
      prefsMealId.remove(mealId);
    } else {
     fav_meals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));

      prefsMealId.add(mealId);

    }
    //   is_meal_fav=fav_meals.any((meal) => meal.id==mealId);
    prefs.setStringList('prefsId', prefsMealId);
    notifyListeners();

  }

  void set_filters() async {
    avilable_meals = DUMMY_MEALS.where((meal) {
      var g = filters['gluten'];
      var l = filters['lactose'];
      var vegan = filters['vegan'];
      var vegi = filters['vegetarian'];

      if (g! && (!meal.isGlutenFree)) {
        return false;
      }
      if (l! && (!meal.isLactoseFree)) {
        return false;
      }
      if (vegan! && (!meal.isVegan)) {
        return false;
      }
      if (vegi! && (!meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();




    /////////////filter category
    List<categ.Category>ac=[];
    avilable_meals.forEach((meal) {
        meal.categories.forEach((catId) {
          DUMMY_CATEGORIES.forEach((cat) {
            if(cat.id==catId){
              if(! ac.any((cat) => cat.id==catId)) ac.add(cat);

            }
          });
        });
      });
    avilable_category = ac;
///////////////////////////////filter category


    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('gluten', filters['gluten']!);
    prefs.setBool('lactose', filters['lactose']!);
    prefs.setBool('vegan', filters['vegan']!);
    prefs.setBool('vegetarian', filters['vegetarian']!);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    filters['gluten'] = prefs.getBool('gluten') ?? false;
    filters['lactose'] = prefs.getBool('lactose') ?? false;
    filters['vegan'] = prefs.getBool('vegan') ?? false;
    filters['vegetarian'] = prefs.getBool('vegetarian') ?? false;
    prefsMealId = prefs.getStringList('prefsId') ?? [];

    for (var mealId in prefsMealId) {
      fav_meals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }

    ////filter avilable meals

    List<Meal>fm=[];
    fav_meals.forEach((favMeals){
      avilable_meals.forEach((avMeals) {
        if(favMeals.id==avMeals.id)fm.add(favMeals);
      });
    });
    fav_meals=fm;

    ////// filter avilable meals

    notifyListeners();
  }

  bool is_favourit(String meal_id) {
    print('fav in pov');
    print(fav_meals);
    return fav_meals.any((meal) => meal.id == meal_id);
  }

}
