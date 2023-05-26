import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/widgets/custom_popup.dart';
import 'package:e_teach/features/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:e_teach/features/widgets/custom_button.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _newPassdowrdController = TextEditingController();

  final TextEditingController _conrimNewPassdowrdController =
      TextEditingController();
  final AppReference _appReference = instance<AppReference>();
  @override
  void initState() {
    setterController();
    super.initState();
  }

  setterController() async {
    _nameController.text = await _appReference.getUserName();
    _emailController.text = await _appReference.getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutSuccessfully || state is RemoveAccountSuccessfully) {
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
          _appReference.clearShared();
        } else if (state is LogoutFailed) {
          customPopUp(
            context,
            isLoading: false,
            errorMsg: state.errorMessage,
            onPressed: () {
              ProfileCubit.get(context).logout();
            },
          );
        } else if (state is LogoutLoading || state is RemoveAccountLoading) {
          customPopUp(context, isLoading: true);
        } else if (state is RemoveAccountFailed) {
          customPopUp(
            context,
            isLoading: false,
            errorMsg: state.errorMessage,
            onPressed: () {
              ProfileCubit.get(context).logout();
            },
          );
        }
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(
                AppStrings.profile.tr(),
                style: getSemiBoldText(
                    color: ColorManager.white, fontSize: AppSize.s14.sp),
                textAlign: TextAlign.left,
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.settings);
                  },
                  icon: const Icon(Icons.settings)),
            ),
            body: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is GetAccountSuccessfully) {
                  _nameController.text =
                      state.profileModel.response!.data!.name!;
                  _emailController.text =
                      state.profileModel.response!.data!.email!;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.p2.h,
                          right: AppPadding.p2.h,
                          top: AppPadding.p8.h,
                          bottom: AppPadding.p4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            AppStrings.moreInfo.tr(),
                            style: getSemiBoldText(
                                color: ColorManager.black,
                                fontSize: AppSize.s10.sp),
                          ),
                          SizedBox(
                            height: AppSize.s2.h,
                          ),
                          CustomAuthFormFiled(
                            keyboardType: TextInputType.text,
                            controller: _nameController,
                            labelText: AppStrings.name.tr(),
                          ),
                          SizedBox(
                            height: AppSize.s1.h,
                          ),
                          CustomAuthFormFiled(
                            keyboardType: TextInputType.text,
                            controller: _emailController,
                            labelText: AppStrings.email.tr(),
                          ),
                          SizedBox(
                            height: AppSize.s1.h,
                          ),
                          CustomAuthFormFiled(
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            labelText: AppStrings.password.tr(),
                          ),
                          SizedBox(
                            height: AppSize.s1.h,
                          ),
                          CustomAuthFormFiled(
                            keyboardType: TextInputType.text,
                            controller: _conrimNewPassdowrdController,
                            labelText: AppStrings.confirmPassword.tr(),
                          ),
                          SizedBox(
                            height: AppSize.s1.h,
                          ),
                          CustomButton(
                            onPressd: () {
                              ProfileCubit.get(context).updateUser(
                                  _nameController.text,
                                  _emailController.text,
                                  _passwordController.text);
                            },
                            title: AppStrings.update.tr(),
                          ),
                          SizedBox(
                            height: AppSize.s1.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                cubit.logout();
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              label: Text(
                                AppStrings.logout.tr(),
                                textAlign: TextAlign.right,
                                style: getRegularText(
                                    color: Colors.grey, fontSize: AppSize.s16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  cubit.removeAccount();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  AppStrings.removeAccount.tr(),
                                  textAlign: TextAlign.right,
                                  style: getRegularText(
                                      color: Colors.grey,
                                      fontSize: AppSize.s16),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is GetAccountFailed) {
                  return CustomErrorWidget(
                      voidCallback: () =>
                          ProfileCubit.get(context).getAccount());
                } else {
                  return const CustomLoading();
                }
              },
            ));
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _newPassdowrdController.dispose();
    super.dispose();
  }
}
