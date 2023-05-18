import 'package:e_teach/features/my_rooms/data/model/my_room.dart';
import 'package:e_teach/features/my_rooms/data/repo/my_room_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_room_state.dart';

class MyRoomCubit extends Cubit<MyRoomState> {
  MyRoomCubit(this._myRoomRepo) : super(MyRoomInitial());

  final MyRoomRepo _myRoomRepo;
  static MyRoomCubit get(context) => BlocProvider.of(context);

  getMyRooms() async {
    emit(GetMyRoomsStateLoading());
    var res = await _myRoomRepo.getMyRooms();
    res.fold((failure) {
      emit(GetMyRoomsStateFailed(failure.errMessage));
    }, (rooms) {
      emit(GetMyRoomsStateSuccess(rooms));
    });
  }

  createRoom(String name, String description) async {
    emit(CreateMyRoomsStateLoading());
    var res = await _myRoomRepo.createRoom(name, description);
    res.fold((failure) {
      emit(CreateMyRoomsStateFailed(failure.errMessage));
    }, (rooms) {
      emit(CreateMyRoomsStateSuccess());
    });
  }
}
