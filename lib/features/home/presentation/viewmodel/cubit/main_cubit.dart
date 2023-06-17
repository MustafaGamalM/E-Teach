import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/home/data/model/room_chat_model.dart';
import 'package:e_teach/features/home/data/model/room_mdel.dart';
import 'package:e_teach/features/home/data/model/single_course_model.dart';
import 'package:e_teach/features/home/data/repo/home_repo.dart';
import 'package:e_teach/features/home/presentation/view/home_view.dart';
import 'package:e_teach/features/my_courses/presentation/view/course_videos_view.dart';
import 'package:e_teach/features/my_rooms/presentation/view/my_room_view.dart';
import 'package:e_teach/features/profile/presentation/view/profile_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._homeRepo) : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  int page = 2;

  final HomeRepo _homeRepo;

  List<Widget> mainScreen = [
    MyRoomView(),
    const MyCoursesView(),
    const HomeView(),
    const ProfileView()
  ];

  void changePage(int screenIndex) {
    page = screenIndex;
    emit(ScreenChangedSucceed());
  }

  CourseModel? courseModel;
  getCourses() async {
    emit(GetCourseLoading());
    var res = await _homeRepo.getCourses();
    res.fold((failure) {
      emit(GetCourseFailed(failure.errMessage));
    }, (courses) {
      courseModel = courses;
      emit(GetCourseSuccessfully(courses));
    });
  }

  getCourseById(int courseId) async {
    emit(GetCourseByIdLoading());
    var res = await _homeRepo.getCourseById(courseId);
    res.fold((failure) {
      emit(GetCourseByIdFailed(failure.errMessage));
    }, (course) {
      emit(GetCourseByIdSuccessfully(course));
    });
  }

  List<RoomData> roomsModel = [];
  getRooms() async {
    emit(GetRoomsLoading());
    var res = await _homeRepo.getRooms();
    res.fold((failure) {
      emit(GetRoomsFailed(failure.errMessage));
    }, (rooms) {
      roomsModel = [];
      roomsModel = rooms.response!.data!;
      emit(GetRoomsSuccessfully(rooms));
    });
  }

  List<RoomChat> roomMessages = [];
  getRoomChat(
      {required int roomId,
      String? message,
      bool? inChat,
      String? sender}) async {
    emit(GetRoomChatLoading());
    var res = await _homeRepo.getRoomChat(
      roomId: roomId,
    );
    res.fold((failure) {
      emit(GetRoomChatFailed(failure.errMessage));
    }, (rooModel) {
      if (inChat == true) {
        DateTime dateTime = DateTime.now();
        int hour = dateTime.hour;
        int minute = dateTime.minute;
        int second = dateTime.second;
        String must = '$hour : $minute : $second';
        RoomChat ch =
            RoomChat(createdAt: must, messageText: message, sender: sender);
        roomMessages.add(ch);
      } else {
        roomMessages = [];
        roomMessages = rooModel.roomChat!;
        //Joined Successfully
        roomMessages.removeWhere(
            (element) => element.messageText == "Joined Successfully");
        for (int n = 0; n < roomMessages.length; n++) {
          roomMessages[n].createdAt;

          DateTime dateTime = DateTime.parse(roomMessages[n].createdAt!);
          int hour = dateTime.hour;
          int minute = dateTime.minute;
          int second = dateTime.second;
          roomMessages[n].createdAt = '$hour : $minute : $second';
        }
        //            DateTime dateTime = DateTime.parse(dateString);
        // int hour = dateTime.hour;
        // int minute = dateTime.minute;
        // int second = dateTime.second;
        // print('$hour : $minute : $second');
      }
      emit(GetRoomChatSuccessfully(rooModel));
    });
  }
}
