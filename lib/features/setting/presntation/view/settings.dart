import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/features/setting/presntation/viewmodel/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.settings,
          style: getRegularText(color: ColorManager.white, fontSize: 15.sp),
        ),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = SettingsCubit.get(context);
          return ListView(
            children: [
              ListTile(
                onTap: () {
                  cubit.changeLanguage();
                },
                leading: SvgPicture.asset(ImageAssets.changeLanguage),
                trailing: SvgPicture.asset(ImageAssets.settingsIc),
                title: Text(
                  AppStrings.changeLanguage,
                  style:
                      getRegularText(color: ColorManager.grey, fontSize: 12.sp),
                ),
              ),
              ListTile(
                onTap: () {
                  cubit.changeTheme();
                },
                leading: SvgPicture.asset(ImageAssets.settingsIc),
                trailing: SvgPicture.asset(ImageAssets.settingsIc),
                title: Text(AppStrings.changeTheme,
                    style: getRegularText(
                        color: ColorManager.grey, fontSize: 12.sp)),
              ),
              ListTile(
                onTap: () {
                  cubit.shareApp();
                },
                leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
                trailing: SvgPicture.asset(ImageAssets.settingsIc),
                title: Text(AppStrings.intviteFrineds,
                    style: getRegularText(
                        color: ColorManager.grey, fontSize: 12.sp)),
              ),
              ListTile(
                onTap: () {
                  cubit.contactDeveloper();
                },
                leading: SvgPicture.asset(
                  ImageAssets.contactUs,
                ),
                trailing: SvgPicture.asset(
                  ImageAssets.whatsAppIc,
                  width: 8.w,
                  height: 8.w,
                  fit: BoxFit.cover,
                ),
                title: Text(AppStrings.contactUs,
                    style: getRegularText(
                        color: ColorManager.grey, fontSize: 12.sp)),
              ),
            ],
          );
        },
      ),
    );
  }
}
