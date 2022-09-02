import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal/Screens/filters_screen.dart';
import 'package:meal/Screens/tabs_screen.dart';
import 'package:meal/Screens/theme_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class On_boarding extends StatefulWidget {
  const On_boarding({Key? key}) : super(key: key);


  @override
  State<On_boarding> createState() => _On_boardingState();
}

class _On_boardingState extends State<On_boarding> {

  int _current_index=0;

  @override
  Widget build(BuildContext context) {
    var primary_color=Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: Stack(
        children: [
          PageView(

            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/it.jpg"),
                  fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 150,
                      color: Theme.of(context).shadowColor.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: Text('Cooking Up!',style: Theme.of(context).textTheme.headline3,
                      softWrap: true,
                      overflow: TextOverflow.fade,),
                    )
                  ],
                ),
              ),
              Theme_Screen(from_onBoarding: true),
              Filter_screen()
            ],
            onPageChanged: (val){
              setState(() {
                _current_index=val;
                print(_current_index);
              });
            },
          ),
          Indecator(_current_index),
          Builder(builder: (context)=>Align(
            alignment: Alignment(0,0.85),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(style:ElevatedButton.styleFrom(primary: primary_color ) ,
                child:Text('Start',style: TextStyle(
                  color: useWhiteForeground(primary_color)?Colors.white:Colors.black,
                  fontSize: 25
                ),),
                onPressed: ()async {Navigator.of(context).pushNamed(TabsScreen.route_name);
                SharedPreferences prefs=await SharedPreferences.getInstance();
                prefs.setBool('watched', true);
                },),
            ),
          ))
        ],
      ),
    );
  }
}

class Indecator extends StatelessWidget {
  final int index;
  Indecator(this.index);


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          build_container(context, 0),
          build_container(context, 1),
          build_container(context, 2)
        ],
      ),

    );
  }
  Widget build_container(BuildContext ctx,int i){
    return index==i?
    Icon(Icons.circle_sharp,color: Theme.of(ctx).colorScheme.primary):
        Container(
    margin: EdgeInsets.all(4),
    height: 15,
    width: 15,
    decoration: BoxDecoration(
    color: Theme.of(ctx).colorScheme.secondary,
    shape: BoxShape.circle
    ),);
  }

}
