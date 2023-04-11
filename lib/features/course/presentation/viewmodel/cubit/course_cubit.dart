import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
}
