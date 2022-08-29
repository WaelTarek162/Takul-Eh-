import 'package:flutter/material.dart';
import 'package:meal/Widget/main_drawer.dart';
import 'package:provider/provider.dart';
import '../provider/meal_provider.dart';

class Filter_screen extends StatefulWidget {
  static const route_name = '/filter_screen';





  @override
  State<Filter_screen> createState() => _Filter_screenState();
}

class _Filter_screenState extends State<Filter_screen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    final Map<String,bool>current_filter = Provider.of<Meal_provider>(context,listen: false).filters;

    _isGlutenFree = current_filter['gluten']!;
    _isVegan = current_filter['vegan']!;
    _isVegetarian = current_filter['vegetarian']!;
    _isLactoseFree = current_filter['lactose']!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(onPressed:() {
             final _filters={
                'gluten':_isGlutenFree,
                'lactose':_isLactoseFree,
                'vegan':_isVegan,
                'vegetarian':_isVegetarian
              };
             Provider.of<Meal_provider>(context,listen: false).set_filters(_filters);
              }, icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Sealection',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    SwitchListTile(
                        title: Text('Gluten-Free'),
                        subtitle: Text('Only include gluten-free meals.'),
                        value: _isGlutenFree,

                        onChanged: (x) {
                          setState(() {
                            _isGlutenFree = x;
                          });
                        }),
                    SwitchListTile(
                        title: Text('Lactos-Free'),
                        subtitle: Text('Only include lactos-free meals.'),
                        value: _isLactoseFree,

                        onChanged: (x) {
                          setState(() {
                            _isLactoseFree = x;
                          });
                        }),
                    SwitchListTile(
                        title: Text('Vegan'),
                        subtitle: Text('Only include Vegan meals.'),
                        value: _isVegan,

                        onChanged: (x) {
                          setState(() {
                            _isVegan = x;
                          });
                        }),
                    SwitchListTile(
                        title: Text('Vegetarian'),
                        subtitle: Text('Only include Vegetarian meals.'),
                        value: _isVegetarian,

                        onChanged: (x) {
                          setState(() {
                            _isVegetarian = x;
                          });
                        }),
                  ],
                ))
          ],
        ),
        drawer: Main_Drawer(),
      ),
    );
  }
}
