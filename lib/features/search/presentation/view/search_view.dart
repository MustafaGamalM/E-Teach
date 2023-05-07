import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/features/search/presentation/viewmodel/cubit/search_cubit.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_gird_courses.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:e_teach/features/widgets/custom_search_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(AppPadding.p1.h),
            child: Column(
              children: [
                CustomSearchWidget(
                  controller: searchController,
                  onChanged: (v) {
                    SearchCubit.get(context)
                        .serachCourse(searchController.text);
                  },
                ),
                SizedBox(
                  height: AppSize.s3.h,
                ),
                if (state is SearchSuccessfully)
                  Expanded(
                    child: CustomGridCourses(
                      courses: state.searchModel.response!.data!,
                    ),
                  ),
                if (state is SearchFailed)
                  CustomErrorWidget(
                      voidCallback: () => SearchCubit.get(context)
                          .serachCourse(searchController.text)),
                if (state is SearchLoading) const CustomLoading()
              ],
            ),
          )),
        );
      },
    );
  }
}
