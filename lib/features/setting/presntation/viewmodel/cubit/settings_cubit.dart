import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._appReference) : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);
  final AppReference _appReference;

  changeLanguage() {
    _appReference.changeLanguage();
    emit(ChangeLanguageState());
  }

  changeTheme() {}

  shareApp() {
    Share.share(AppConstants.appLink);
  }

  contactDeveloper() async {
    String phone = "+201112891588";
    Uri url2 = Uri.parse(
        "whatsapp://send?phone=$phone&text=${Uri.encodeFull('عمنا')}");
    //   await launchUrl(url2);
    if (await canLaunchUrl(url2)) {
      print('doneeeeeeeeeeeeee');
      await launchUrl(url2);
    } else {
      print('cannnnt');
    }
  }
}
