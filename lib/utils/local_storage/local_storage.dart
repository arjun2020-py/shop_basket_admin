import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  setStringPrf(String role) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   await pref.setString('roleKey', role);
   print('role = ${role}');
  }

  getStringPrf() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return  pref.getString('roleKey');
  }
}
