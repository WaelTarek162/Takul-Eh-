

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
var primary_color= Colors.pink;
var accent_color =Colors.amber;
var theme_mode=ThemeMode.system;
String theme_text='s';


   onChanged(new_color,n)async {
     n == 1 ?
     primary_color=_toMaterialColor(new_color.value)
         :
     accent_color = _toMaterialColor(new_color.value);

     SharedPreferences prefs =await SharedPreferences.getInstance();
     prefs.setInt('primary_color', primary_color.value);
     prefs.setInt('accent_color', accent_color.value);
     notifyListeners();

   }
   getThemeColors()async{
     SharedPreferences prefs =await SharedPreferences.getInstance();
     primary_color=_toMaterialColor(prefs.getInt('primary_color')??0xFFF06292);
     accent_color=_toMaterialColor(prefs.getInt('accent_color')??0xFFFFA000);
     notifyListeners();

   }

   MaterialColor _toMaterialColor(colorVal){

   return  MaterialColor(
       colorVal,
       <int, Color>{
         50: Color(0xFFFCE4EC),
         100: Color(0xFFF8BBD0),
         200: Color(0xFFF48FB1),
         300: Color(0xFFF06292),
         400: Color(0xFFEC407A),
         500: Color(colorVal),
         600: Color(0xFFD81B60),
         700: Color(0xFFC2185B),
         800: Color(0xFFAD1457),
         900: Color(0xFF880E4F),
       },
     );

   }
void ThemeModeChange(newThemeVal)async{

     theme_mode=newThemeVal;
     _getTheme_text(theme_mode);
     SharedPreferences prefs =await SharedPreferences.getInstance();
     prefs.setString('theme_text', theme_text);
     notifyListeners();
}

_getTheme_text(ThemeMode tm){

     if(tm==ThemeMode.dark){
       theme_text='d';
     }else if(tm==ThemeMode.light){
       theme_text='l';
     }else if(tm==ThemeMode.system){
       theme_text='s';
     }
}

get_theme_mode()async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
  theme_text=prefs.getString('theme_text')??'s';
  if(theme_text=='d'){
    theme_mode=ThemeMode.dark;
  }else if(theme_text=='l'){
    theme_mode=ThemeMode.light;
  }else if(theme_text=='s'){
    theme_mode=ThemeMode.system;
  }
notifyListeners();
}

}