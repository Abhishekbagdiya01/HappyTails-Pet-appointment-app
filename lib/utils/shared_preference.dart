import 'package:shared_preferences/shared_preferences.dart';

String accounntType = "accounntType";
String currentRefreshToken = "refreshToken";

class SharedPref {
  //set accountType
  void setAccountType(String uid) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(accounntType, uid);
  }

  //get accountType
  Future<String?> getAccountType() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(accounntType);
  }
}
