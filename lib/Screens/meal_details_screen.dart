import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:provider/provider.dart';
import '../provider/meal_provider.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_detail';




  @override
  Widget build(BuildContext context) {




    final meal_id = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final idd = meal_id['id'];
    final filterd_meal =
        DUMMY_MEALS.firstWhere((element) => element.id == meal_id['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(filterd_meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                filterd_meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainer(context,'Ingredients'),
            build_container(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(ctx).colorScheme.primary,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(filterd_meal.ingredients[index])),
              ),
              itemCount: filterd_meal.ingredients.length,
            )),
            buildContainer(context,'Steps'),
            build_container(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title: Text(filterd_meal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: filterd_meal.steps.length,
            ))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>Provider.of<Meal_provider>(context,listen: false).toggaleFavourit(idd!) ,
        child: Icon(Provider.of<Meal_provider>(context,listen: true).is_meal_fav ?Icons.favorite:Icons.favorite_border),
      ),
    );
  }

  Container buildContainer(BuildContext ctx,String text) {
    return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: Theme.of(ctx).textTheme.bodyLarge,
          ),
        );
  }

  Widget build_container(Widget childd){

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
