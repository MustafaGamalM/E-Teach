import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/core/utilis/functions/dismiss_dialog.dart';
import 'package:e_teach/core/widgets/custom_popup.dart';
import 'package:e_teach/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:e_teach/features/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  final AppReference _appReference = instance<AppReference>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessfully) {
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
          _appReference.loggedInViewed();
        } else if (state is LoginFailed) {
          customPopUp(context, isLoading: false, onPressed: () async {
            await BlocProvider.of<AuthCubit>(context)
                .login(_emailController.text, _passwordController.text, "1");
          }, errorMsg: state.errorMsg, title: 'Error');
        } else if (state is LoginLoading) {
          customPopUp(context,
              isLoading: true, onPressed: () {}, title: 'Loading');
        } else if (state is LoginSuccessfully) {
          _appReference.loggedInViewed();
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Scaffold(
            backgroundColor: ColorManager.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, top: 15.h, right: 5.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.login,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.addYourDetails,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomAuthFormFiled(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: AppStrings.email,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomAuthFormFiled(
                          controller: _passwordController,
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
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: RadioListTile(
                                  dense: true,
                                  selectedTileColor: ColorManager.black,
                                  activeColor: ColorManager.black,
                                  value: AppStrings.student,
                                  title: const Text(AppStrings.student),
                                  groupValue: cubit.userType,
                                  onChanged: (value) {
                                    cubit.changeType(value!);
                                  })),
                          Expanded(
                              child: RadioListTile(
                                  selectedTileColor: ColorManager.black,
                                  activeColor: ColorManager.black,
                                  value: AppStrings.instructor,
                                  title: Text(AppStrings.instructor),
                                  groupValue: cubit.userType,
                                  onChanged: (value) {
                                    cubit.changeType(value!);
                                  })),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: ColorManager.cien,
                          onPressed: () async {
                            (_emailController.text.isNotEmpty &&
                                    _passwordController.text.isNotEmpty)
                                ? cubit.login(_emailController.text,
                                    _passwordController.text, cubit.userType)
                                : showToast(AppStrings.addYourDetails);
                          },
                          child: Text(AppStrings.login,
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
                            AppStrings.forgotYourPassword,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: ColorManager.darkGrey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.forgetPasswordRoute);
                              },
                              child: Text(
                                AppStrings.resetPassword,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.notHaveAccount,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: ColorManager.darkGrey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(Routes.registerRoute);
                              },
                              child: Text(
                                AppStrings.signUp,
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
