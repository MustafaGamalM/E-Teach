import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/auth/data/repo/auth_repo.dart';
import 'package:e_teach/features/auth/data/repo/auth_repo_impl.dart';
import 'package:e_teach/features/auth/presentation/view/login_view.dart';
import 'package:e_teach/features/auth/presentation/view/register_view.dart';
import 'package:e_teach/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:e_teach/features/auth/presentation/view/forget_password_view.dart';
import 'package:e_teach/features/home/data/repo/home_repo_impl.dart';
import 'package:e_teach/features/home/presentation/view/main_view.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/onboarding/presntation/view/onboarding_view.dart';
import 'package:e_teach/features/onboarding/presntation/viewmodel/cubit/on_boarding_cubit.dart';
import 'package:e_teach/features/splash/presentation/view/splash_view.dart';
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
        initAuthModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthCubit(instance<AuthReoImpl>(), instance<AppReference>()),
            child: LoginScreen(),
          ),
        );

      case Routes.registerRoute:
        initAuthModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthCubit(instance<AuthReoImpl>(), instance<AppReference>()),
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
        initHomeModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                MainCubit(instance<HomeRepoImpl>())..getCourses(),
            child: MainScreen(),
          ),
        );

      case Routes.forgetPasswordRoute:
        initAuthModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthCubit(instance<AuthReoImpl>(), instance<AppReference>()),
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
