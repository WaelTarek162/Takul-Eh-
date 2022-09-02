import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal/Screens/category_meal_screen.dart';
import 'package:meal/Screens/category_screen.dart';
import 'package:meal/Screens/tabs_screen.dart';
import 'package:meal/dummy_data.dart';
import 'package:provider/provider.dart';
import '../provider/meal_provider.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_detail';

  @override
  Widget build(BuildContext context) {
    @override
    bool is_landscabe =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var accent_color = Theme.of(context).colorScheme.secondary;

    final meal_id =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final idd = meal_id['id'];
    final filterd_meal =
        DUMMY_MEALS.firstWhere((element) => element.id == meal_id['id']);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if(Navigator.canPop(context)) {
                  Navigator.pop(context);
                }else{
                  Navigator.pushNamed(context, TabsScreen.route_name);
                //  Navigator.popAndPushNamed(context, TabsScreen.route_name);
                }
              },
            ),
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(filterd_meal.title),
              background: Hero(
                tag: idd!,
                child: InteractiveViewer(
                  maxScale: 2,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/a2.png'),
                    image: NetworkImage(
                      filterd_meal.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildContainer(context, 'Ingredients'),
                build_container(ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(ctx).colorScheme.surface,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          filterd_meal.ingredients[index],
                          style: TextStyle(
                              color: useWhiteForeground(accent_color)
                                  ? Colors.white
                                  : Colors.black),
                        )),
                  ),
                  itemCount: filterd_meal.ingredients.length,
                  padding: EdgeInsets.all(0),
                )),
                buildContainer(context, 'Steps'),
                build_container(ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          filterd_meal.steps[index],
                          style: TextStyle(
                              color: useWhiteForeground(accent_color)
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: filterd_meal.steps.length,
                )),
                SizedBox(
                  height: 700,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => Provider.of<Meal_provider>(context, listen: false)
            .toggaleFavourit(idd),
        child: Icon(
            Provider.of<Meal_provider>(context, listen: true).is_favourit(idd)
                ? Icons.favorite
                : Icons.favorite_border),
      ),
    );
  }

  Container buildContainer(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget build_container(Widget childd) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsetsDirectional.all(10),
      padding: EdgeInsets.all(10),
      width: 300,
      height: 100,
      child: childd,
    );
  }
}
