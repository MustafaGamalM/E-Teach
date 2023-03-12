import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt instance = GetIt.instance;

Future<void> initModule() async {
  final shared = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => shared);
  instance.registerLazySingleton<AppReference>(() => AppReference(instance()));
}
