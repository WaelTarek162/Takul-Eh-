import 'package:flutter/material.dart';
import 'package:meal/Screens/meal_details_screen.dart';
import 'package:meal/models/Meal.dart';

class Meal_item extends StatelessWidget {
  final String id;
  final String img_url;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get comlexity_string{
    switch(complexity){
      case Complexity.Simple:return 'Simple';break;
      case Complexity.Challenging:return 'Challenging';break;
      case Complexity.Hard:return 'Hard';break;
      default :return 'Unknown';break;
    }
  }
  String get affordably_string{
    switch(affordability){
      case Affordability.Affordable:return 'Affordable';break;
      case Affordability.Luxurious:return 'Luxurious';break;
      case Affordability.Pricey:return 'Pricey';break;
      default :return 'Unknown';break;
    }
  }

  void select_meal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName,arguments: {
      'id':id,
    }).then((result) {
     /* if(result !=null){
        //print(result);
        remove_item(result);
      }*/
    });
  }

  Meal_item(
      {required this.img_url,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,required this.id,
        });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>select_meal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    img_url,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54.withOpacity(0.5),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsetsDirectional.all(15),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.timer),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work_history),
                    SizedBox(
                      width: 6,
                    ),
                    Text(comlexity_string),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(affordably_string),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
