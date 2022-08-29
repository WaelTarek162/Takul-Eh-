import 'package:flutter/material.dart';
import 'package:meal/Screens/category_meal_screen.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/filters_screen.dart';

class Main_Drawer extends StatelessWidget {

  Widget build_list_tile(String title, IconData iconData,Object TabHandler){

   return ListTile(
      leading: Icon(iconData,size: 26,),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondenced',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap:(){TabHandler;},
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text('Cooking Up!',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).secondaryHeaderColor
            ),),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.restaurant_sharp,size: 26,),
            title: Text(
              'Meal',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondenced',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap:(){Navigator.of(context).pushReplacementNamed('/');},
          ),
          ListTile(
            leading: Icon(Icons.filter_alt_sharp,size: 26,),
            title: Text(
              'Filter',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondenced',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap:(){Navigator.of(context).pushReplacementNamed(Filter_screen.route_name);},
          )



        ],
      ),
    );
  }
}
