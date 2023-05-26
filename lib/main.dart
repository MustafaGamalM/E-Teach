import 'package:e_teach/core/bloc_observer.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/language.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/theme_manager.dart';
import 'package:e_teach/features/home/data/repo/home_repo_impl.dart';
import 'package:e_teach/features/setting/presntation/viewmodel/cubit/settings_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sizer/sizer.dart';

import 'core/utilis/di.dart';
import 'features/home/presentation/viewmodel/cubit/main_cubit.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initModule();
  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: AEETS_LOCALISATION_PATH,
      child: Phoenix(child: MyApp())));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppReference _appPreferences = instance<AppReference>();
  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          //  BlocProvider(create: (context) => MainCubit()),
          BlocProvider(
              create: (context) => SettingsCubit(instance<AppReference>())),
          BlocProvider(
              create: (context) => MainCubit(instance<HomeRepoImpl>())),
        ],
        child: MaterialApp(
          title: 'E-Teach',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: RouteGenerator.getRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashRoute,
          theme: getApplicationTheme(),
        ),
      );
    });
  }
}
