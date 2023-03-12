import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';

class CustomAuthFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? upHintText;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? labelColor;
  final Color? cursorColor;
  final double radius;
  final double? height;
  //final int? maxLines;
  final double horizontalPadding;
  final double verticalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final int? maxLength;
  final int? errorMaxLines;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final bool autofocus;

  const CustomAuthFormFiled(
      {Key? key,
      required this.controller,
      this.validator,
      this.onTap,
      this.labelText,
      required this.keyboardType,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.onChanged,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.initialValue,
      this.hintText,
      this.upHintText,
      this.backgroundColor,
      this.height,
      this.radius = 30.0,
      // this.maxLines,
      this.enabled = true,
      this.inputBorder =
          const OutlineInputBorder(borderSide: BorderSide(width: 1)),
      this.inputEnabledBorder,
      this.inputFocusedBorder,
      this.inputDisabledBorder,
      this.horizontalPadding = 0,
      this.verticalPadding = 0,
      this.textColor,
      this.labelColor = Colors.white,
      this.contentPadding,
      this.containerAlignment,
      this.suffixText,
      this.suffixTextStyle,
      this.suffixIconConstraints,
      this.readOnly = false,
      this.cursorColor,
      this.maxLength,
      this.errorMaxLines = 2,
      this.textDirection = TextDirection.ltr,
      this.textAlign = TextAlign.start,
      this.textInputAction,
      this.autofocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(AppSize.s17)),
      child: TextFormField(
          autofocus: autofocus,
          textInputAction: textInputAction,
          maxLength: maxLength,
          readOnly: readOnly,
          cursorColor: cursorColor,
          enabled: enabled,
          textAlignVertical: TextAlignVertical.center,
          textAlign: textAlign,
          //   maxLines: maxLines,
          textDirection: textDirection,
          initialValue: initialValue,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          onChanged: onChanged,
          onTap: onTap,
          obscureText: obscureText,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: InputDecoration(
            counterText: '',
            suffixStyle: suffixTextStyle,
            suffixText: suffixText,
            errorMaxLines: errorMaxLines,
            contentPadding: contentPadding,
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            border: InputBorder.none,
            suffixIcon: suffixIcon,
          )),
    );
  }
}
