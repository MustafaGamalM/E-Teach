import 'package:dartz/dartz.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/home/data/model/room_chat_model.dart';
import 'package:e_teach/features/home/data/model/room_mdel.dart';
import 'package:e_teach/features/home/data/model/single_course_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CourseModel>> getCourses();

  Future<Either<Failure, SingleCourseModel>> getCourseById(int courseId);
  Future<Either<Failure, RoomModel>> getRooms();
  Future<Either<Failure, RoomChatModel>> getRoomChat(int roomId);
}
