import 'package:bloc/bloc.dart';
import 'package:e_teach/constatns.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._appReference) : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);
  final AppReference _appReference;

  changeLanguage() {}

  changeTheme() {}

  shareApp() {
    Share.share(AppConstatns.appLink);
  }

  contactDeveloper() async {
    //  final Uri phoneNumber =  Uri.parse('');
    // final url = 'https://wa.me/01123142082';
    // final Uri url =  Uri.parse('')
    String phone = "+201123142082";
    Uri url2 = Uri.parse('https://wa.me/phone');
    //   await launchUrl(url2);
    if (await canLaunchUrl(url2)) {
      await launchUrl(url2);
    } else {
      print('cannnnt');
    }
  }
}
