import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightPrimary,
    // primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.lightGrey,
    splashColor: ColorManager.lightGrey,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.lightGrey,
      elevation: AppSize.s0,
    ),
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      centerTitle: true,
      elevation: AppSize.s0,
      titleTextStyle:
          getRegularText(color: ColorManager.white, fontSize: AppSize.s16),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.cien,
      shape: const StadiumBorder(),
      splashColor: ColorManager.lightGrey,
      disabledColor: ColorManager.lightGrey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: ColorManager.white,
            textStyle:
                getRegularText(color: ColorManager.cien, fontSize: AppSize.s17),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldText(color: ColorManager.black, fontSize: AppSize.s16),
      headlineLarge:
          getBoldText(color: ColorManager.black, fontSize: AppSize.s24),
      headlineMedium:
          getRegularText(color: ColorManager.black, fontSize: AppSize.s16),
      titleMedium:
          getMediumText(color: ColorManager.black, fontSize: AppSize.s12),
      titleSmall:
          getRegularText(color: ColorManager.black, fontSize: AppSize.s14),
      labelSmall:
          getRegularText(color: ColorManager.black, fontSize: AppSize.s12),
      bodyMedium:
          getRegularText(color: ColorManager.black, fontSize: AppSize.s16),
      bodyLarge: getBoldText(color: ColorManager.black, fontSize: AppSize.s16),
      bodySmall: getRegularText(color: ColorManager.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:
          getMediumText(color: ColorManager.grey2, fontSize: AppSize.s14),
      labelStyle:
          getMediumText(color: ColorManager.grey2, fontSize: AppSize.s14),
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      border: InputBorder.none,
    ),
  );
}
