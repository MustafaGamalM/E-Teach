import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/toast_widget.dart';
import '../../../widgets/text_form_filed.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
            backgroundColor: ColorManager.white,
            elevation: 0.0,
            leading: BackButton(
              color: ColorManager.primary,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h, right: 2.h, left: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppStrings.resetPassword.tr()),
                SizedBox(height: 2.h),
                Text(AppStrings.enterAndReceiveEmail.tr()),
                SizedBox(height: 2.h),
                CustomAuthFormFiled(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: AppStrings.email.tr(),
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    color: ColorManager.cien,
                    onPressed: () async {
                      (_emailController.text.isNotEmpty)
                          ? () {}
                          : showToast(AppStrings.addYourDetails.tr());
                    },
                    child: Text(AppStrings.send,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ColorManager.white)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
