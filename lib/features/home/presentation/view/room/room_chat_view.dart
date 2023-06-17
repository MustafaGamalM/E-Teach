import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utilis/di.dart';

class RoomChatView extends StatefulWidget {
  RoomChatView({super.key, required this.roomId});
  final int roomId;

  @override
  State<RoomChatView> createState() => _RoomChatViewState();
}

class _RoomChatViewState extends State<RoomChatView> {
  final TextEditingController _messageTextEditingController =
      TextEditingController();

//https://eteach.albayan-eg.com/files/

  @override
  void initState() {
    //BlocProvider.of<MainCubit>(context).getRoomChat(roomId: widget.roomId);
    initUser();
    super.initState();
  }

  AppReference prefs = instance<AppReference>();
  initUser() async {
    String str = await prefs.getUserName();
    setState(() {
      name = str;
    });
  }

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryLight,
      appBar: AppBar(
        leading: BackButton(color: ColorManager.white),
        centerTitle: true,
        title: Text(
          AppStrings.chat.tr(),
          style: TextStyle(
              color: ColorManager.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         BlocProvider.of<MainCubit>(context).roomMessages = [];
        //       },
        //       icon: Icon(
        //         Icons.file_download,
        //         size: 3.h,
        //         color: ColorManager.white,
        //       ))
        // ],
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          var cubit = MainCubit.get(context);

          return Padding(
            padding:
                EdgeInsets.only(left: 3.w, right: 3.w, bottom: 3.h, top: 1.h),
            child: Column(children: [
              Expanded(
                child: ListView(
                  children: cubit.roomMessages.map((e) {
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.w),
                        decoration: BoxDecoration(
                          color: (e.sender == name)
                              ? ColorManager.babyBlue
                              : ColorManager.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomLeft: (e.sender == name)
                                  ? Radius.circular(14)
                                  : Radius.circular(0),
                              bottomRight: (e.sender == name)
                                  ? Radius.circular(0)
                                  : Radius.circular(14)),
                        ),
                        child: Column(
                          crossAxisAlignment: (e.sender == name)
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: (e.sender == name)
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Text(
                                  e.sender.toString(),
                                  style: TextStyle(
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.w200,
                                    color: ColorManager.black.withOpacity(.5),
                                  ),
                                  textAlign: (e.sender == name)
                                      ? TextAlign.right
                                      : TextAlign.left,
                                ),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Text(
                                  e.createdAt.toString(),
                                  style: TextStyle(
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.w200,
                                    color: ColorManager.black.withOpacity(.5),
                                  ),
                                  textAlign: (e.sender == name)
                                      ? TextAlign.right
                                      : TextAlign.left,
                                )
                              ],
                            ),
                            Text(
                              e.messageText.toString(),
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorManager.black,
                              ),
                              textAlign: (e.sender == name)
                                  ? TextAlign.right
                                  : TextAlign.left,
                            )
                          ],
                        ));
                  }).toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomAuthFormFiled(
                    controller: _messageTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                  )),
                  SizedBox(
                    width: 2.w,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(360),
                    onTap: () async {
                      if (_messageTextEditingController.text.isNotEmpty) {
                        AppReference refs = instance<AppReference>();
                        var sender = await refs.getUserName();
                        cubit.getRoomChat(
                            roomId: widget.roomId,
                            message: _messageTextEditingController.text,
                            inChat: true,
                            sender: sender);
                      }
                    },
                    child: CircleAvatar(
                        backgroundColor: ColorManager.lightGrey,
                        radius: 2.7.h,
                        child: Icon(Icons.send,
                            size: 2.5.h, color: ColorManager.red)),
                  )
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
