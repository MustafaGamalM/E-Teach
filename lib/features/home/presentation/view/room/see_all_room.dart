import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/data/model/room_mdel.dart';
import 'package:e_teach/features/widgets/custom_room.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SellAllRoomsView extends StatelessWidget {
  const SellAllRoomsView({super.key, required this.roomData});
  final List<RoomData> roomData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.rooms.tr(),
            style: getSemiBoldText(
                color: ColorManager.white, fontSize: AppSize.s10.sp),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            child: GridView.builder(
              itemCount: roomData.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 20.h,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: AppSize.s4.w, // width
                mainAxisSpacing: AppSize.s2.h, // height
              ),
              itemBuilder: (context, index) {
                return CustomRoonWidget(
                  roomId: roomData[index].id!,
                  roomName: roomData[index].name!,
                  roomDesc: roomData[index].description!,
                );
              },
            )));
  }
}
