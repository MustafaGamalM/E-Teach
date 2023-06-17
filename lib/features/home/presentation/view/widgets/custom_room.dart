import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/home/data/model/room_mdel.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:e_teach/features/widgets/custom_room.dart';
import 'package:e_teach/features/widgets/custom_row_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CustomRoomsWidget extends StatefulWidget {
  const CustomRoomsWidget({super.key});

  @override
  State<CustomRoomsWidget> createState() => _CustomRoomsWidgetState();
}

class _CustomRoomsWidgetState extends State<CustomRoomsWidget> {
  @override
  void initState() {
    MainCubit.get(context).getRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        List<RoomData> rooms = MainCubit.get(context).roomsModel;
        if (rooms.isNotEmpty) {
          return Column(
            children: [
              CustomRowWidget(AppStrings.rooms.tr(), () {
                Navigator.pushNamed(context, Routes.sellAllRoomsView,
                    arguments: {"roomsModel": rooms});
              }),
              SizedBox(
                height: AppSize.s1.h,
              ),
              SizedBox(
                height: 21.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return CustomRoonWidget(
                      roomId: rooms[index].id!,
                      roomName: rooms[index].name!,
                      roomDesc: rooms[index].description!,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: AppSize.s2.w,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CustomLoading());
        }
      },
    );
  }
}
