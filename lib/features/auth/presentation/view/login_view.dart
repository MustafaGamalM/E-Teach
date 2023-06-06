import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/widgets/custom_popup.dart';
import 'package:e_teach/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:e_teach/features/widgets/custom_button.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  final AppReference _appReference = instance<AppReference>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessfully) {
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
          _appReference.loggedInViewed();
          _appReference.setUserEmail(state.email);
          _appReference.setUserName(state.name);
        } else if (state is LoginFailed) {
          customPopUp(context, isLoading: false, onPressed: () async {
            await BlocProvider.of<AuthCubit>(context)
                .login(_emailController.text, _passwordController.text);
          }, errorMsg: state.errorMsg, title: '');
        } else if (state is LoginLoading) {
          customPopUp(context,
              isLoading: true,
              onPressed: () {},
              title: AppStrings.loading.tr());
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
                          AppStrings.login.tr(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.addYourDetails.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomAuthFormFiled(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: AppStrings.email.tr(),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return AppStrings.email.tr();
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomAuthFormFiled(
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: AppStrings.password.tr(),
                          obscureText: cubit.obsucre,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.password.tr();
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                            onTap: () {
                              cubit.chageObsucre();
                            },
                            child: cubit.eyeIcon,
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomButton(
                          title: AppStrings.login.tr(),
                          onPressd: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.login(_emailController.text,
                                  _passwordController.text);
                            }
                          }),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.forgotYourPassword.tr(),
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
                                AppStrings.resetPassword.tr(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.notHaveAccount.tr(),
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
                                AppStrings.signUp.tr(),
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
