import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const CustomSearchWidget(
      {Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
      child: TextFormField(
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          //   maxLines: maxLines,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: InputDecoration(
            counterText: '',
            fillColor: ColorManager.lightGrey,
            filled: true,
            errorMaxLines: 1,
            hintText: AppStrings.searchCourse,
            suffixIcon: IconButton(
                icon: const Icon(Icons.delete_outline_outlined),
                onPressed: () {
                  controller.clear();
                }),
            border: InputBorder.none,
            prefixIcon: BackButton(color: ColorManager.black),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorManager.lightGrey, width: AppSize.s1),
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppSize.s10))),

            // focused border style
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorManager.lightGrey, width: AppSize.s1),
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppSize.s10))),
          )),
    );
  }
}
