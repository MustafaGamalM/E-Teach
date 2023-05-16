import 'dart:async';

import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo, this._appReference) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool obsucre = false;
  Icon eyeIcon = Icon(
    Icons.remove_red_eye_rounded,
    color: ColorManager.black,
  );

  final AuthRepo _authRepo;
  final AppReference _appReference;

  String userType = "instructor";
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

  login(String email, String password) async {
    print(email);
    print(password);
    emit(LoginLoading());
    var res = await _authRepo.login(email, password);
    res.fold((failure) {
      emit(LoginFailed(failure.errMessage));
    }, (succes) {
      emit(LoginSuccessfully(
          succes.response!.data!.name!, succes.response!.data!.email!));
      _appReference.setToken(succes.response!.data!.token!);
    });
  }

  register(String email, String password, String type, String name) async {
    //  emit(RegisterLoading());
    emit(RegisterLoading());
    var res = await _authRepo.register(email, name, password, userType);
    res.fold((failure) {
      emit(RegisterFailed(failure.errMessage));
    }, (succes) {
      print(succes.response!.data!.type);
      print('========');
      emit(RegisterSuccessfully(
          succes.response!.data!.name!, succes.response!.data!.email!));
      _appReference.setToken(succes.response!.data!.token!);
    });
  }

  forgetPassword() async {
    emit(ForgetPasswordLoading());
    // todo add functions
    emit(ForgetPasswordFailed(AppStrings.noInternetConnection));
  }
}
