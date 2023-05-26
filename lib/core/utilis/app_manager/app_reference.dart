import 'package:e_teach/core/utilis/app_manager/constants_manager.dart';
import 'package:e_teach/core/utilis/app_manager/language.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LOGGEDIN_VIEWED_KEY = "LOGGEDIN_VIEWED_KEY";
const String ONBOARDING_VIEWED_KEY = "ONBOARDING_VIEWED_KEY";
const String USER_TOKEN_KEY = "USER_TOKEN_KEY";
const String USER_NAME_KEY = "USER_NAME_KEY";
const String USER_EMAIL_KEY = "USER_EMAIL_KEY";

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppReference {
  SharedPreferences sharedPreferences;
  AppReference(this.sharedPreferences);
// lang *********
  Future<String> getPrefsLanguage() async {
    String? language = sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeLanguage() async {
    String currentLanguage = await getPrefsLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getPrefsLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

// *****
  Future<void> loggedInViewed() async {
    await sharedPreferences.setBool(LOGGEDIN_VIEWED_KEY, true);
  }

  Future<void> onBoardingViewed() async {
    await sharedPreferences.setBool(ONBOARDING_VIEWED_KEY, true);
  }

  Future<void> clearShared() async {
    await sharedPreferences.clear();
  }

// ****** setter and getter user data *****
  Future<void> setToken(String token) async {
    await sharedPreferences.setString(USER_TOKEN_KEY, token);
  }

  Future<String> getToken() async {
    return sharedPreferences.getString(USER_TOKEN_KEY) ??
        ConstantsManager.empty;
  }

  Future<void> setUserName(String token) async {
    await sharedPreferences.setString(USER_NAME_KEY, token);
  }

  Future<String> getUserName() async {
    return sharedPreferences.getString(USER_NAME_KEY) ?? ConstantsManager.empty;
  }

  Future<void> setUserEmail(String token) async {
    await sharedPreferences.setString(USER_EMAIL_KEY, token);
  }

  Future<String> getUserEmail() async {
    return sharedPreferences.getString(USER_EMAIL_KEY) ??
        ConstantsManager.empty;
  }
}
