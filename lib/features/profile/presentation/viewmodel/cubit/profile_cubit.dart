import 'package:bloc/bloc.dart';
import 'package:e_teach/features/profile/data/data/myprofile_model.dart';
import 'package:e_teach/features/profile/data/repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);

  updateUser(String name, String email, String password) async {
    emit(UpdateAccountLoading());
    var res = await _profileRepo.updateAccount(name, email, password);
    res.fold((l) => emit(UpdateAccountFailed(l.errMessage)), (r) {
      getAccount();
      emit(UpdateAccountSuccessfully());
    });
  }

  logout() async {
    emit(LogoutLoading());
    var res = await _profileRepo.logout();
    res.fold((l) => emit(LogoutFailed(l.errMessage)),
        (r) => emit(LogoutSuccessfully()));
  }

  removeAccount() async {
    emit(RemoveAccountLoading());
    var res = await _profileRepo.removeAccount();
    res.fold((l) => emit(RemoveAccountFailed(l.errMessage)),
        (r) => emit(RemoveAccountSuccessfully()));
  }

  getAccount() async {
    emit(GetAccountLoading());
    var res = await _profileRepo.getAccount();
    res.fold((l) => emit(GetAccountFailed(l.errMessage)),
        (r) => emit(GetAccountSuccessfully(r)));
  }
}
