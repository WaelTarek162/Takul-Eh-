import 'package:flutter/material.dart';
import 'package:meal/Screens/tabs_screen.dart';
import 'package:meal/Widget/main_drawer.dart';
import 'package:meal/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../provider/meal_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Filter_screen extends StatefulWidget {
  static const route_name = '/filter_screen';

  @override
  State<Filter_screen> createState() => _Filter_screenState();
}

class _Filter_screenState extends State<Filter_screen> {

  void nothing(){}

  Widget build_switch_tile(String titlle,String sub_tit,VoidCallback func(bool) ,bool switch_val,BuildContext ctx){
    return  SwitchListTile(
        title: Text(titlle),
        inactiveTrackColor: Provider.of<ThemeProvider>(ctx,listen: true).theme_mode==ThemeMode.light?null:Colors.black,
        subtitle: Text(sub_tit),
        value: switch_val,
        onChanged: func
    );

  }


  @override
  Widget build(BuildContext context) {

    final Map<String,bool>current_filter = Provider.of<Meal_provider>(context,listen: false).filters;
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),

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
                    .headline6,
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    build_switch_tile('Gluten-Free', 'Only include gluten-free meals.',(x) {
                      setState(() {
                    current_filter['gluten'] = x;
                      });
                      Provider.of<Meal_provider>(context,listen: false).set_filters();
                     // return current_filter['gluten'] = x;
                      return nothing;
                    } ,
                        current_filter['gluten']!, context),

                    build_switch_tile('Lactos-Free', 'Only include lactos-free meals.',
                            (x) {
                          setState(() {
                            current_filter['lactose'] = x;
                          });
                          Provider.of<Meal_provider>(context,listen: false).set_filters();
                         // return current_filter['lactose'] = x;
                          return nothing;

                        }

                        ,current_filter['lactose']!, context),


                    build_switch_tile('Vegan', 'Only include Vegan meals.',(x) {
                      setState(() {
                        current_filter['vegan'] = x;
                      });
                      Provider.of<Meal_provider>(context,listen: false).set_filters();
                    //  return current_filter['vegan'] = x;
                      return nothing;

                    } ,current_filter['vegan']!, context),
                    build_switch_tile('Vegetarian', 'Only include Vegetarian meals.',(x){
                      setState(() {
                        current_filter['vegetarian'] = x;
                      });
                      Provider.of<Meal_provider>(context,listen: false).set_filters();
                     // return current_filter['vegetarian'] = x;
                      return nothing;
                    } ,current_filter['vegetarian']!, context),
                  ],
                ))
          ],
        ),
        drawer: Main_Drawer(),
    //  ),

    );
  }
}
