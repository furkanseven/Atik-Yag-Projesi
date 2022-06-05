import 'package:shared_preferences/shared_preferences.dart';

class SPManager {
  SPManager() {
    init();
  }
  Future<SharedPreferences> sharedPreferences;

  void init() async {
    sharedPreferences = SharedPreferences.getInstance();
  }

  void setLoginStatus(bool isLogged) {
    sharedPreferences.then((value) {
      value.setBool("isLogin", isLogged);
    });
  }

  Future<bool> getLoginStatus() async {
    return await sharedPreferences.then((value) {
      return value.getBool("isLogin");
    });
  }
}
