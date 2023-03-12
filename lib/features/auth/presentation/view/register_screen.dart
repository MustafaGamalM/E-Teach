import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:e_teach/features/widgets/popup_dialog.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:e_teach/features/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class RegistertionScreen extends StatelessWidget {
  AppReference appReference = instance<AppReference>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();
  RegistertionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessfully) {
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
          appReference.loggedInViewed();
        } else if (state is LoginFailed) {
          popDialog(context, errorMsg: state.errorMsg, isLoading: false);
        } else if (state is LoginLoading) {
          popDialog(context, title: AppStrings.loading, isLoading: true);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
            backgroundColor: ColorManager.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, top: 10.h, right: 5.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.signUp,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.addDetailsSignUp,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomAuthFormFiled(
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: AppStrings.name,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomAuthFormFiled(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: AppStrings.email,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomAuthFormFiled(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.number,
                        labelText: AppStrings.mobileNumber,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomAuthFormFiled(
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: AppStrings.password,
                          obscureText: cubit.obsucre,
                          suffixIcon: InkWell(
                            onTap: () {
                              cubit.chageObsucre();
                            },
                            child: cubit.eyeIcon,
                          )),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomAuthFormFiled(
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: AppStrings.confirmPassword,
                          obscureText: cubit.obsucre,
                          suffixIcon: InkWell(
                            onTap: () {
                              cubit.chageObsucre();
                            },
                            child: cubit.eyeIcon,
                          )),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: RadioListTile(
                                  selectedTileColor: ColorManager.black,
                                  activeColor: ColorManager.black,
                                  value: AppStrings.student,
                                  title: Text(AppStrings.student,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(fontSize: 9.sp)),
                                  groupValue: cubit.userType,
                                  onChanged: (value) {
                                    cubit.changeType(value!);
                                  })),
                          Expanded(
                              child: RadioListTile(
                                  selectedTileColor: ColorManager.black,
                                  activeColor: ColorManager.black,
                                  value: AppStrings.instructor,
                                  title: const Text(AppStrings.instructor),
                                  groupValue: cubit.userType,
                                  onChanged: (value) {
                                    cubit.changeType(value!);
                                  })),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: ColorManager.cien,
                          onPressed: () {
                            (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty &&
                                    confirmPasswordController.text.isNotEmpty &&
                                    nameController.text.isNotEmpty &&
                                    mobileNumberController.text.isNotEmpty)
                                ? (confirmPasswordController.text ==
                                        passwordController.text)
                                    ? cubit.register()
                                    : showToast(AppStrings.passwordNotMatch)
                                : showToast(AppStrings.addYourDetails);
                          },
                          child: Text(AppStrings.signUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: ColorManager.white)),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.alreadyHaveAnAccount,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: ColorManager.darkGrey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(Routes.loginRoute);
                              },
                              child: Text(
                                AppStrings.login,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
