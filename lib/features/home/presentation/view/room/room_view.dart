import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class RoomDesriptionView extends StatelessWidget {
  const RoomDesriptionView(
      {super.key,
      required this.roomId,
      required this.roomName,
      required this.roomDesc});
  final int roomId;
  final String roomName;
  final String roomDesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: ColorManager.white),
          centerTitle: true,
          title: Text(
            roomName,
            maxLines: 2,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            BlocListener<MainCubit, MainState>(
              listener: (context, state) {
                if (state is GetRoomChatSuccessfully) {
                  Navigator.of(context).pushNamed(Routes.roomChatView,
                      arguments: {"id": roomId});
                }
              },
              child: IconButton(
                  onPressed: () {
                    MainCubit.get(context).getRoomChat(roomId);
                  },
                  icon: Icon(
                    Icons.chat_bubble,
                    color: ColorManager.white,
                  )),
            ),
          ]),
      body: ListView(children: [
        SvgPicture.asset(
          ImageAssets.onlineRoomView,
          fit: BoxFit.cover,
          height: 25.h,
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: Row(
              children: [
                Icon(
                  Icons.report,
                  size: 3.h,
                  color: ColorManager.red,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  AppStrings.description,
                  maxLines: 2,
                  style: TextStyle(
                    color: ColorManager.red,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 3.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: Text(
            roomDesc,
            style: TextStyle(
              color: ColorManager.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ]),
    );
  }
}
