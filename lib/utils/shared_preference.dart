import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String accountType = "accountType";
  Future<String?> getAccountType() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(accountType);
  }

  void setAccountType(String account) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(accountType, account);
  }
}
