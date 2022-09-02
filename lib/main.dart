import 'package:flutter/material.dart';
import 'package:meal/Screens/category_meal_screen.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/favourit_screen.dart';
import 'package:meal/Screens/filters_screen.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import 'package:meal/Screens/on_boarding_screnn.dart';
import 'package:meal/Screens/tabs_screen.dart';
import 'package:meal/Screens/theme_screen.dart';
import 'package:meal/provider/meal_provider.dart';
import 'package:meal/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs =await SharedPreferences.getInstance();
  Widget home_screen= (prefs.getBool('watched')?? false) ? TabsScreen() : On_boarding();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Meal_provider>(create: (ctx) => Meal_provider()),
        ChangeNotifierProvider<ThemeProvider>(create: (ctx) => ThemeProvider()),
      ],
      child: MyApp(home_screen),
    ),
  );

}

class MyApp extends StatefulWidget {

  final Widget main_screen;
  MyApp(this.main_screen);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var primary_color =
        Provider.of<ThemeProvider>(context, listen: true).primary_color;
    var accent_color =
        Provider.of<ThemeProvider>(context, listen: true).accent_color;
    var Theme__mode =
        Provider.of<ThemeProvider>(context, listen: true).theme_mode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: Theme__mode,//ThemeMode.light,
      theme: ThemeData(
          // primaryColor: primary_color,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          unselectedWidgetColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primary_color)
              .copyWith(secondary: accent_color),
          fontFamily: 'Raleway',
          cardColor: Colors.black87,
          shadowColor: Colors.white70,
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontFamily: 'RobotoCondenced',
                  fontWeight: FontWeight.bold))),
      darkTheme: ThemeData(
          canvasColor: Color.fromRGBO(14, 22, 33, 1),
          hoverColor: Colors.grey ,
          unselectedWidgetColor: Theme.of(context).colorScheme.secondary,
          scaffoldBackgroundColor:Colors.black87 ,
          backgroundColor: Colors.black87 ,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primary_color)
              .copyWith(secondary: accent_color),
          fontFamily: 'Raleway',
          cardColor: Colors.white70,//Color.fromRGBO(14, 22, 33, 1),
          shadowColor: Colors.black,
          textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white60),
              headline6: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontFamily: 'RobotoCondenced',
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),

      routes: {
        '/':(context)=>On_boarding(),
        TabsScreen.route_name: (context) => TabsScreen(),
        category_meal_screen.route_name: (context) => category_meal_screen(),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        Filter_screen.route_name: (context) => Filter_screen(),
        Theme_Screen.route_name: (context) => Theme_Screen(),
        CategoriesScreen.route_name:(context)=>CategoriesScreen(),
        FavouriteScreen.route_name:(context)=>FavouriteScreen()

      },
    );
  }
}
