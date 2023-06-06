import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/auth/data/repo/auth_repo_impl.dart';
import 'package:e_teach/features/auth/presentation/view/login_view.dart';
import 'package:e_teach/features/auth/presentation/view/register_view.dart';
import 'package:e_teach/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:e_teach/features/auth/presentation/view/forget_password_view.dart';
import 'package:e_teach/features/home/data/model/course_model.dart';
import 'package:e_teach/features/home/data/repo/home_repo_impl.dart';
import 'package:e_teach/features/home/presentation/view/course/paly_course.dart';
import 'package:e_teach/features/home/presentation/view/course/see_all_courses.dart';
import 'package:e_teach/features/home/presentation/view/course/videos_course.dart';
import 'package:e_teach/features/home/presentation/view/main_view.dart';
import 'package:e_teach/features/home/presentation/view/room/room_chat_view.dart';
import 'package:e_teach/features/home/presentation/view/room/room_view.dart';
import 'package:e_teach/features/home/presentation/view/room/see_all_room.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/my_courses/data/repo/my_course_repo_impl.dart';
import 'package:e_teach/features/my_courses/presentation/view/course_videos_view.dart';
import 'package:e_teach/features/my_courses/presentation/view/upload_course.dart';
import 'package:e_teach/features/my_courses/presentation/viewmodel/cubit/course_cubit.dart';
import 'package:e_teach/features/my_rooms/data/repo/my_room_repo_impl.dart';
import 'package:e_teach/features/my_rooms/presentation/viewmodel/cubit/my_room_cubit.dart';
import 'package:e_teach/features/onboarding/presntation/view/onboarding_view.dart';
import 'package:e_teach/features/onboarding/presntation/viewmodel/cubit/on_boarding_cubit.dart';
import 'package:e_teach/features/payment/presentation/view/payment_view.dart';
import 'package:e_teach/features/profile/data/repo/repo_impl.dart';
import 'package:e_teach/features/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:e_teach/features/search/data/repo/search_impl.dart';
import 'package:e_teach/features/search/presentation/view/search_view.dart';
import 'package:e_teach/features/search/presentation/viewmodel/cubit/search_cubit.dart';
import 'package:e_teach/features/setting/presntation/view/settings.dart';
import 'package:e_teach/features/setting/presntation/viewmodel/cubit/settings_cubit.dart';
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
  static const String courseDetails = '/CourseDetails';
  static const String userCourses = '/userCourses';
  static const String videosCourse = '/videosCourse';
  static const String searchCourse = '/searchCourse';
  static const String uploadCourse = '/uploadCourse';
  static const String settings = '/settings';
  static const String paymentView = "/PaymentView";
  static const String roomDescView = "/roomDescView";
  static const String roomChatView = "/roomChatView";
  static const String sellAllCoursesView = "/sellAllCoursesView";
  static const String sellAllRoomsView = "/sellAllRoomsView";
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
        initProfileModule();
        initMyCoursesModule();
        initMyRoomModule();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) =>
                            MainCubit(instance<HomeRepoImpl>())..getRooms()),
                    BlocProvider(
                        create: (context) =>
                            ProfileCubit(instance<ProfileRepoImpl>())
                              ..getAccount()),
                    BlocProvider(
                        create: (context) =>
                            MyCoursesCubit(instance<MyCoursesRepoImpl>())
                              ..getMyCourses()),
                    BlocProvider(
                        create: (context) =>
                            MyRoomCubit(instance<MyRoomRepoImpl>())
                              ..getMyRooms()),
                  ],
                  child: const MainScreen(),
                ));

      case Routes.forgetPasswordRoute:
        initAuthModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthCubit(instance<AuthReoImpl>(), instance<AppReference>()),
            child: ForgetPasswordScreen(),
          ),
        );

      case Routes.courseDetails:
        return MaterialPageRoute(builder: (_) {
          var courseId = routeSettings.arguments as Map;
          return BlocProvider(
            create: (context) => MainCubit(instance<HomeRepoImpl>()),
            child: CourseDetails(id: courseId['id']),
          );
        });

      case Routes.userCourses:
        return MaterialPageRoute(builder: (_) => const MyCoursesView());

      case Routes.videosCourse:
        return MaterialPageRoute(builder: (_) {
          var courseId = routeSettings.arguments as Map;
          return BlocProvider(
            create: (context) => MainCubit(instance<HomeRepoImpl>())
              ..getCourseById(courseId['id']),
            child: VideosCourseView(courseId: courseId['id']),
          );
        });

      case Routes.searchCourse:
        initSearchModule();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SearchCubit(instance<SearchRepoImpl>()),
                  child: SearchView(),
                ));

      case Routes.uploadCourse:
        return MaterialPageRoute(builder: (_) {
          var id = routeSettings.arguments as Map;
          return BlocProvider(
            create: (context) => MyCoursesCubit(instance<MyCoursesRepoImpl>()),
            child: UploadCourse(
              roomId: id['id'],
            ),
          );
        });

      case Routes.paymentView:
        return MaterialPageRoute(
          builder: (context) {
            return PaymentView();
          },
        );

      case Routes.settings:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SettingsCubit(instance<AppReference>()),
                  child: const SettingsView(),
                ));
      case Routes.roomDescView:
        return MaterialPageRoute(builder: (_) {
          var room = routeSettings.arguments as Map;
          return RoomDesriptionView(
            roomId: room['id'],
            roomDesc: room['roomDesc'],
            roomName: room['roomName'],
          );
        });
      case Routes.roomChatView:
        return MaterialPageRoute(builder: (_) {
          var room = routeSettings.arguments as Map;
          return RoomChatView(roomId: room['id']);
        });

      case Routes.sellAllCoursesView:
        return MaterialPageRoute(builder: (_) {
          var courseModelMap = routeSettings.arguments as Map;
          return SellAllCoursesView(
            courseModel: courseModelMap['courseModel'],
          );
        });
      case Routes.sellAllRoomsView:
        return MaterialPageRoute(builder: (_) {
          var roomModelMap = routeSettings.arguments as Map;
          return SellAllRoomsView(
            roomData: roomModelMap['roomsModel'],
          );
        });
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
