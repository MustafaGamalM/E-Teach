import 'package:e_teach/core/utilis/app_manager/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: FontConstants.fontFamily);
}

// regular text

TextStyle getRegularText(
    {required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(color, fontSize, FontWeightManager.regular);
}

// medium text

TextStyle getMediumText(
    {required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(color, fontSize, FontWeightManager.medium);
}

// light text

TextStyle getLightText({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(color, fontSize, FontWeightManager.light);
}

// bold text

TextStyle getBoldText({required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(color, fontSize, FontWeightManager.bold);
}

// semiBold text

TextStyle getSemiBoldText(
    {required Color color, double fontSize = FontSize.s12}) {
  return _getTextStyle(color, fontSize, FontWeightManager.semiBold);
}
