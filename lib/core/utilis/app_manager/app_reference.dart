import 'package:e_teach/core/utilis/app_manager/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LOGGEDIN_VIEWED_KEY = "LOGGEDIN_VIEWED_KEY";
const String ONBOARDING_VIEWED_KEY = "ONBOARDING_VIEWED_KEY";
const String USER_TOKEN_KEY = "USER_TOKEN_KEY";

class AppReference {
  SharedPreferences sharedPreferences;
  AppReference(this.sharedPreferences);

  Future<void> loggedInViewed() async {
    await sharedPreferences.setBool(LOGGEDIN_VIEWED_KEY, true);
  }

  Future<void> onBoardingViewed() async {
    await sharedPreferences.setBool(ONBOARDING_VIEWED_KEY, true);
  }

// ****** setter and getter user data *****
  Future<void> setToken(String token) async {
    await sharedPreferences.setString(USER_TOKEN_KEY, token);
  }

  Future<String> getToken() async {
    return sharedPreferences.getString(USER_TOKEN_KEY) ?? AppConstants.empty;
  }
}
