import 'package:dio/dio.dart';
import 'package:e_teach/core/utilis/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/features/auth/data/repo/auth_repo_impl.dart';
import 'package:e_teach/features/auth/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:e_teach/features/home/data/repo/home_repo_impl.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/my_courses/data/repo/my_course_repo_impl.dart';
import 'package:e_teach/features/my_courses/presentation/viewmodel/cubit/course_cubit.dart';
import 'package:e_teach/features/profile/data/repo/repo_impl.dart';
import 'package:e_teach/features/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:e_teach/features/search/data/repo/search_impl.dart';
import 'package:e_teach/features/search/presentation/viewmodel/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt instance = GetIt.instance;

Future<void> initModule() async {
  final shared = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => shared);
  instance.registerSingleton<ApiService>(ApiService(Dio()));
  instance.registerLazySingleton<AppReference>(() => AppReference(instance()));
}

Future<void> initAuthModule() async {
  if (!GetIt.I.isRegistered<AuthReoImpl>()) {
    instance.registerFactory<AuthReoImpl>(
      () => AuthReoImpl(
        instance.get<ApiService>(),
      ),
    );
    instance.registerFactory<AuthCubit>(
      () => AuthCubit(instance(), instance()),
    );
  }
}

Future<void> initHomeModule() async {
  if (!GetIt.I.isRegistered<HomeRepoImpl>()) {
    instance.registerFactory<HomeRepoImpl>(
      () => HomeRepoImpl(
        instance.get<ApiService>(),
        instance.get<AppReference>(),
      ),
    );
    instance.registerFactory<MainCubit>(
      () => MainCubit(instance()),
    );
  }
}

Future<void> initProfileModule() async {
  if (!GetIt.I.isRegistered<ProfileRepoImpl>()) {
    instance.registerFactory<ProfileRepoImpl>(
      () => ProfileRepoImpl(
        instance.get<ApiService>(),
        instance.get<AppReference>(),
      ),
    );
    instance.registerFactory<ProfileCubit>(
      () => ProfileCubit(instance()),
    );
  }
}

Future<void> initSearchModule() async {
  if (!GetIt.I.isRegistered<SearchRepoImpl>()) {
    instance.registerFactory<SearchRepoImpl>(
      () => SearchRepoImpl(
        instance.get<ApiService>(),
        instance.get<AppReference>(),
      ),
    );
    instance.registerFactory<SearchCubit>(
      () => SearchCubit(instance()),
    );
  }
}

Future<void> initMyCoursesModule() async {
  if (!GetIt.I.isRegistered<MyCoursesRepoImpl>()) {
    instance.registerFactory<MyCoursesRepoImpl>(
      () => MyCoursesRepoImpl(
        instance.get<ApiService>(),
        instance.get<AppReference>(),
      ),
    );
    instance.registerFactory<MyCoursesCubit>(
      () => MyCoursesCubit(instance()),
    );
  }
}
