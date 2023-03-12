import 'package:shared_preferences/shared_preferences.dart';
const String LOGGEDIN_VIEWED_KEY = "LOGGEDIN_VIEWED_KEY";
const String ONBOARDING_VIEWED_KEY = "ONBOARDING_VIEWED_KEY";

class AppReference{
SharedPreferences sharedPreferences;
AppReference(this.sharedPreferences);

Future<void> loggedInViewed()async{
 await sharedPreferences.setBool(LOGGEDIN_VIEWED_KEY, true);
}
Future<void> onBoardingViewed()async{
  await sharedPreferences.setBool(ONBOARDING_VIEWED_KEY, true);
}

}