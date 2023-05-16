import 'package:dartz/dartz.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/rooms/data/model/create_room.dart';
import 'package:e_teach/features/rooms/data/model/my_room.dart';

abstract class MyRoomRepo {
  Future<Either<Failure, CreateRoomModel>> createRoom(
      String name, String description);
  Future<Either<Failure, MyRoomModel>> getMyRooms();
}
