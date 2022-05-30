import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = 'fulanito';
  static bool _darkmode = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    _name = _prefs.getString('name') ?? 'fulanito';
    return _name;
  }

  static set name(String value) {
    _name = value;
    _prefs.setString('name', value);
  }

  static bool get darkmode {
    _darkmode = _prefs.getBool('darkmode') ?? false;
    return _darkmode;
  }

  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }

  static int get gender {
    _gender = _prefs.getInt('gender') ?? 1;

    return _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }
}
