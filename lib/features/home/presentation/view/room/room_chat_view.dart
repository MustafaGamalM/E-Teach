import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoomChatView extends StatelessWidget {
  RoomChatView({super.key, required this.roomId});
  final int roomId;
  final TextEditingController _messageTextEditingController =
      TextEditingController();
//https://eteach.albayan-eg.com/files/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryLight,
      appBar: AppBar(
        leading: BackButton(color: ColorManager.white),
        centerTitle: true,
        title: Text(
          AppStrings.chat,
          style: TextStyle(
              color: ColorManager.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.file_download,
                size: 3.h,
                color: ColorManager.white,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 3.h),
        child: Column(children: [
          Expanded(
            child: ListView(
              reverse: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  constraints: BoxConstraints(
                    minWidth: 20.w,
                    maxWidth: 80.w,
                  ),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "msuatafa gamal",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        color: ColorManager.black),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: CustomAuthFormFiled(
                controller: _messageTextEditingController,
                keyboardType: TextInputType.datetime,
              )),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(360),
                onTap: () {
                  // clicked
                },
                child: CircleAvatar(
                    backgroundColor: ColorManager.lightGrey,
                    radius: 2.7.h,
                    child:
                        Icon(Icons.send, size: 2.5.h, color: ColorManager.red)),
              )
            ],
          )
        ]),
      ),
    );
  }
}
