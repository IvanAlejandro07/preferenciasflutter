

import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {

  static late SharedPreferences _prefs;

  static String _nombre = '';
  static bool _isDarkMode = false;
  static int _genero = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name{
    return _prefs.getString('nombre') ?? _nombre;
  }

  static bool get isDarkMode{
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }
  static int get genero{
    return _prefs.getInt('genero') ?? _genero;
  }

  static set genero(int value){
  _genero = genero;
  _prefs.setInt('genero', value);
  }
  static set idDarkMode(bool values){
    _isDarkMode = values;
    _prefs.setBool('isDarkMode', values);
  }

  static set name(String values){
    _nombre = values;
    _prefs.setString('nombre', values);
  }

}