
import 'package:flutter/material.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/favourit_screen.dart';
import 'package:provider/provider.dart';
import '../provider/meal_provider.dart';
import '../Widget/main_drawer.dart';
import '../models/Meal.dart';
import 'filters_screen.dart';



class TabsScreen extends StatefulWidget {





  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  late final List<Map<String,Object>>_pages;

  int _selected_page=0;

  @override
  void initState() {
   // final List<Meal>fav_meals=Provider.of<Meal_provider>(context,listen: true).fav_meals;


    _pages=[
      {
        'page':CategoriesScreen(),
        'title':'Categories'
      },
      {
        'page':FavouriteScreen(),
        'title':'Favorite'
      }
    ];

    super.initState();
  }


  void _select_page(int value) {
    setState(() {
      _selected_page=value;
    });

  }


  @override
  Widget build(BuildContext context) {



    Widget? page =_pages[_selected_page]['page'] as Widget?;
    Object? tit=_pages[_selected_page]['title'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('$tit'),
        ),
        body:page ,
        bottomNavigationBar: BottomNavigationBar(unselectedItemColor:Theme.of(context).colorScheme.onPrimary ,selectedItemColor:Theme.of(context).colorScheme.onPrimary,backgroundColor: Theme.of(context).primaryColor,onTap: _select_page,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Favorites'),
        ],),
        drawer: Main_Drawer(),
      ),
      routes: {
       // '/':(context)=>TabsScreen(),
        //'/':(context)=>TabsScreen(),
        Filter_screen.route_name:(context) => Filter_screen()

      },
    );
  }
}
