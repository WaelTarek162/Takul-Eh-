import 'package:flutter/material.dart';
import 'package:meal/Screens/category_meal_screen.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/filters_screen.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import 'package:meal/Screens/tabs_screen.dart';
import 'package:meal/provider/meal_provider.dart';
import 'package:provider/provider.dart';

void main() {


  runApp(
      ChangeNotifierProvider<Meal_provider>(
        create:(ctx) =>Meal_provider(),
        child: MyApp(),
      ),
  );
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        category_meal_screen.route_name: (context) => category_meal_screen(),
        MealDetailsScreen.routeName:(context) => MealDetailsScreen(),
        Filter_screen.route_name:(context) => Filter_screen()
      },
    );
  }
}
