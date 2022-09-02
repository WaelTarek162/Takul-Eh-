import 'package:flutter/material.dart';
import 'package:meal/Screens/category_meal_screen.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/favourit_screen.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import 'package:meal/Screens/theme_screen.dart';
import 'package:meal/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../provider/meal_provider.dart';
import '../Widget/main_drawer.dart';
import '../models/Meal.dart';
import 'filters_screen.dart';

class TabsScreen extends StatefulWidget {
  static final route_name = 'tabscreen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, Object>> _pages;

  int _selected_page = 0;

  @override
  void initState() {
    Provider.of<Meal_provider>(context, listen: false).getData();
    Provider.of<ThemeProvider>(context, listen: false).get_theme_mode();
    Provider.of<ThemeProvider>(context, listen: false).getThemeColors();

    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(), 'title': 'Favorite'}
    ];

    super.initState();
  }

  void _select_page(int value) {


    setState(() {
      _selected_page = value;
    });

  }

  @override
  Widget build(BuildContext context) {
    Widget? page = _pages[_selected_page]['page'] as Widget?;
    Object? tit = _pages[_selected_page]['title'];
    // return MaterialApp(
    // debugShowCheckedModeBanner: false,
    return Scaffold(
      appBar: AppBar(
        title: Text('$tit'),
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selected_page,
        onTap: _select_page,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Favorites'),
        ],
      ),
      drawer: Main_Drawer(),

    );
  }
}
