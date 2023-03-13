import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/features/auth/presentation/view/login_view.dart';
import 'package:e_teach/features/auth/presentation/view/register_view.dart';
import 'package:e_teach/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:e_teach/features/auth/presentation/view/forget_password_view.dart';
import 'package:e_teach/features/home/presentation/view/main_screen.dart';
import 'package:e_teach/features/onboarding/presntation/view/onboarding.dart';
import 'package:e_teach/features/onboarding/presntation/viewmodel/cubit/on_boarding_cubit.dart';
import 'package:e_teach/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: RegistertionScreen(),
          ),
        );

      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: OnBoardingScreen(),
          ),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
        );

      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: ForgetPasswordScreen(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
