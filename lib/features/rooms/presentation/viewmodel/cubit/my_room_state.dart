part of 'my_room_cubit.dart';

@immutable
abstract class MyRoomState {}

class MyRoomInitial extends MyRoomState {}

// create room

class CreateMyRoomsStateSuccess extends MyRoomState {}

class CreateMyRoomsStateLoading extends MyRoomState {}

class CreateMyRoomsStateFailed extends MyRoomState {
  final String msg;

  CreateMyRoomsStateFailed(this.msg);
}

//get room

class GetMyRoomsStateSuccess extends MyRoomState {
  final MyRoomModel roomModel;

  GetMyRoomsStateSuccess(this.roomModel);
}

class GetMyRoomsStateLoading extends MyRoomState {}

class GetMyRoomsStateFailed extends MyRoomState {
  final String msg;

  GetMyRoomsStateFailed(this.msg);
}
