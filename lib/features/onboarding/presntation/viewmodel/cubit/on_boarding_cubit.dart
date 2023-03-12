import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  late int currentPage = 0;
  changePage(int page) {
    emit(PageChanged());
  }
}
