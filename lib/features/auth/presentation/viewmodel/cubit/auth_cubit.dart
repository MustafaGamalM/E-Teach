import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool obsucre = false;
  Icon eyeIcon = Icon(
    Icons.remove_red_eye_rounded,
    color: ColorManager.black,
  );

  String userType = "Student";
  chageObsucre() {
    obsucre = !obsucre;
    eyeIcon = obsucre == true
        ? Icon(
            Icons.remove_red_eye,
            color: ColorManager.black,
          )
        : Icon(
            Icons.remove_red_eye_outlined,
            color: ColorManager.black,
          ); //remove_red_eye_outlined
    emit(ObsucreChanged());
  }

  changeType(String type) {
    userType = type;
    emit(TypeChanged());
  }

  login(String email, String password, String type) async {
    // emit(LoginLoading());
    // todo add functions
    emit(LoginSuccessfully());
    //emit(LoginFailed(AppStrings.noInternetConnection));
  }

  register() async {
    emit(RegisterLoading());
    // todo add functions
    emit(LoginFailed(AppStrings.noInternetConnection));
  }

  forgetPassword() async {
    emit(ForgetPasswordLoading());
    // todo add functions
    emit(ForgetPasswordFailed(AppStrings.noInternetConnection));
  }
}
