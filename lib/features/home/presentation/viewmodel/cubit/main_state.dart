part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class ScreenChangedSucceed extends MainState {}

// courses state

class GetCourseLoading extends MainState {}

class GetCourseFailed extends MainState {
  final String errorMessage;

  GetCourseFailed(this.errorMessage);
}

class GetCourseSuccessfully extends MainState {
  final CourseModel courses;

  GetCourseSuccessfully(this.courses);
}

// get courses by id

class GetCourseByIdLoading extends MainState {}

class GetCourseByIdFailed extends MainState {
  final String errorMessage;

  GetCourseByIdFailed(this.errorMessage);
}

class GetCourseByIdSuccessfully extends MainState {
  final SingleCourseModel singleCourseModel;
  GetCourseByIdSuccessfully(this.singleCourseModel);
}

// get rooms

class GetRoomsLoading extends MainState {}

class GetRoomsFailed extends MainState {
  final String errorMessage;

  GetRoomsFailed(this.errorMessage);
}

class GetRoomsSuccessfully extends MainState {
  final RoomModel roomModel;
  GetRoomsSuccessfully(this.roomModel);
}

// room chat
class GetRoomChatLoading extends MainState {}

class GetRoomChatFailed extends MainState {
  final String errorMessage;

  GetRoomChatFailed(this.errorMessage);
}

class GetRoomChatSuccessfully extends MainState {
  final RoomChatModel roomChatModel;
  GetRoomChatSuccessfully(this.roomChatModel);
}
