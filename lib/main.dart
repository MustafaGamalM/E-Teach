import 'package:e_teach/core/bloc_observer.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/theme_manager.dart';
import 'package:e_teach/features/setting/presntation/viewmodel/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/utilis/di.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          //  BlocProvider(create: (context) => MainCubit()),
          BlocProvider(create: (context) => SettingsCubit()),
        ],
        child: MaterialApp(
          title: 'E-Teach',
          onGenerateRoute: RouteGenerator.getRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashRoute,
          theme: getApplicationTheme(),
        ),
      );
    });
  }
}
