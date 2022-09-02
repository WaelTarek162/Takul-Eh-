import 'package:flutter/material.dart';
import 'package:meal/Widget/main_drawer.dart';
import 'package:provider/provider.dart';
import 'package:meal/provider/theme_provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';



class Theme_Screen extends StatelessWidget {
  static String route_name='theme_screen';
  final bool from_onBoarding;

  const Theme_Screen({this.from_onBoarding=false});

  Widget build_radio_list_tile(ThemeMode tm ,String tx, IconData icn, BuildContext ctx){

    return RadioListTile(value: tm, groupValue: Provider.of<ThemeProvider>(ctx,listen:true).theme_mode, onChanged: (n_theme_val){
      Provider.of<ThemeProvider>(ctx,listen:false).ThemeModeChange(n_theme_val);
    },title: Text(tx));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:from_onBoarding?AppBar(backgroundColor: Theme.of(context).canvasColor,elevation: 0,): AppBar(
        title: Text('Your Themes'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your themes selection.',style: Theme.of(context).textTheme.headline6,),
          ),
          Expanded(child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text('Choose your theme mode',style: Theme.of(context).textTheme.headline6,),
              ),
              build_radio_list_tile(ThemeMode.system, 'System Theme', Icons.settings_system_daydream, context),
              build_radio_list_tile(ThemeMode.dark, 'Dark Theme', Icons.dark_mode, context),
              build_radio_list_tile(ThemeMode.light, 'Light Theme', Icons.light_mode_outlined, context),
              build_list_tile(context, 'primary'),
              build_list_tile(context, 'accent'),
              SizedBox(height: from_onBoarding?80:0,)

            ],
          ))
        ],
      ),
      drawer:from_onBoarding?null: Main_Drawer(),


    );
  }

  ListTile build_list_tile(BuildContext ctx,String txt){

    var primary_color=Provider.of<ThemeProvider>(ctx,listen: true).primary_color;
    var accent_color=Provider.of<ThemeProvider>(ctx,listen: true).accent_color;

    return ListTile(

      title: Text('Choose your $txt color',style: Theme.of(ctx).textTheme.headline6,),
      trailing: CircleAvatar(
        backgroundColor: txt=='primary'?primary_color:accent_color,
      ),
      onTap:() {showDialog(
        context: ctx,
        builder: (BuildContext ctxx){
          return AlertDialog(
            elevation: 4,
              titlePadding: EdgeInsets.all(0.0),
            contentPadding: EdgeInsets.all(0.0),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: txt=='primary'?
                Provider.of<ThemeProvider>(ctx,listen: true).primary_color:
                Provider.of<ThemeProvider>(ctx,listen: true).accent_color,
                onColorChanged: (new_val){
                  Provider.of<ThemeProvider>(ctx,listen: false).onChanged(new_val, txt=='primary'?1:2);
                }
                ,
                colorPickerWidth: 300.0,
                pickerAreaHeightPercent: 0.7,
                enableAlpha: false,
                displayThumbColor: true,
              ),
            ),
          );
        }
      );}

    );
  }
}
