import 'package:e_teach/core/utilis/functions/dismiss_dialog.dart';
import 'package:e_teach/core/widgets/custom_popup.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/rooms/presentation/view/custom_my_room.dart';
import 'package:e_teach/features/rooms/presentation/viewmodel/cubit/my_room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MyRoomView extends StatefulWidget {
  MyRoomView({super.key});

  @override
  State<MyRoomView> createState() => _MyRoomViewState();
}

class _MyRoomViewState extends State<MyRoomView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _roomNameTextController = TextEditingController();

  final TextEditingController _roomDescTextController = TextEditingController();

  @override
  void initState() {
    MyRoomCubit.get(context).getMyRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: Text(
            AppStrings.yourRoom,
            style: getSemiBoldText(
                color: ColorManager.white, fontSize: AppSize.s10.sp),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<MyRoomCubit, MyRoomState>(
                listener: (context, state) async {
                  if (state is GetMyRoomsStateFailed) {
                    customPopUp(context, isLoading: false, onPressed: () async {
                      dismissDialog(context);
                      MyRoomCubit.get(context).getMyRooms();
                    }, errorMsg: state.msg, title: 'Error');
                  } else if (state is GetMyRoomsStateLoading) {
                    dismissDialog(context);
                    customPopUp(context,
                        isLoading: true, onPressed: () {}, title: 'Loading');
                  } else if (state is CreateMyRoomsStateSuccess) {
                    //  dismissDialog(context);
                    await MyRoomCubit.get(context).getMyRooms();
                    dismissDialog(context);
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 3.w, right: 3.w, top: 3.h, bottom: 2.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: TextFormField(
                                controller: _roomNameTextController,
                                validator: (name) {
                                  if (name!.isEmpty) {
                                    return AppStrings.addCuourseName;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    fillColor: ColorManager.red,
                                    hintText: AppStrings.addRoom,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppSize.s10))),
                              )),
                              SizedBox(
                                width: 2.w,
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      MyRoomCubit.get(context).createRoom(
                                          _roomNameTextController.text,
                                          _roomDescTextController.text);
                                    }
                                  },
                                  child: Text(
                                    AppStrings.addRoom,
                                    style: getMediumText(
                                        color: ColorManager.darkBlue,
                                        fontSize: 10.sp),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 3.w, right: 3.w, bottom: 3.h),
                          child: TextFormField(
                            controller: _roomDescTextController,
                            maxLines: 6,
                            minLines: 4,
                            validator: (name) {
                              if (name!.isEmpty) {
                                return AppStrings.addRoom;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                //  fillColor: ColorManager.red,
                                hintText: AppStrings.yourRoomDesc,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 3.w, right: 3.w, top: 2.h, bottom: 3.h),
                          child: Text(
                            AppStrings.yourRoom,
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (state is GetMyRoomsStateSuccess)
                          SizedBox(
                            // height: 50.h,
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.w, right: 3.w),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => CustomMyRoom(
                                      desc: state.roomModel.response!
                                          .data![index].description!,
                                      title: state.roomModel.response!
                                          .data![index].name!),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                  itemCount:
                                      state.roomModel.response!.data!.length),
                            ),
                          )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
