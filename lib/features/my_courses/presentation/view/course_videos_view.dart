import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/routes_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:e_teach/core/widgets/custom_popup.dart';
import 'package:e_teach/features/home/presentation/viewmodel/cubit/main_cubit.dart';
import 'package:e_teach/features/my_courses/presentation/viewmodel/cubit/course_cubit.dart';
import 'package:e_teach/features/widgets/custom_error_view.dart';
import 'package:e_teach/features/widgets/custom_loading.dart';
import 'package:e_teach/features/widgets/custom_search_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MyCoursesView extends StatefulWidget {
  const MyCoursesView({Key? key}) : super(key: key);

  @override
  State<MyCoursesView> createState() => _MyCoursesViewState();
}

class _MyCoursesViewState extends State<MyCoursesView> {
  final TextEditingController _courseTextField = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: Text(
            AppStrings.yourLearining,
            style: getSemiBoldText(
                color: ColorManager.white, fontSize: AppSize.s10.sp),
          ),
          centerTitle: false,
        ),
        body: BlocConsumer<MyCoursesCubit, CourseState>(
          listener: (context, state) {
            if (state is MyCoursesFailed) {
              customPopUp(context, isLoading: false, onPressed: () async {
                Navigator.pop(context);
              }, errorMsg: state.message, title: 'Error');
            } else if (state is MyCoursesLoading) {
              customPopUp(context,
                  isLoading: true, onPressed: () {}, title: 'Loading');
            } else if (state is CreateCourseSucess) {
              Navigator.pop(context);
              MyCoursesCubit.get(context).getMyCourses();
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 2.w, right: 2.w, top: 3.h, bottom: 5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _courseTextField,
                          validator: (name) {
                            if (name!.isEmpty) {
                              return AppStrings.addCuourseName;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: ColorManager.red,
                              hintText: AppStrings.addCuourseName,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10))),
                        ),
                      )),
                      SizedBox(
                        width: 2.w,
                      ),
                      TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              MyCoursesCubit.get(context)
                                  .createMyCourses(_courseTextField.text);
                            }
                          },
                          child: Text(
                            AppStrings.addCourse,
                            style: getMediumText(
                                color: ColorManager.darkBlue, fontSize: 10.sp),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                if (state is MyCoursesSucess)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(AppPadding.p2.w),
                      child: ListView.separated(
                        itemCount: state.myCoursesModel.response!.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.uploadCourse, arguments: {
                                  'id': state
                                      .myCoursesModel.response!.data![index].id
                                });
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: ColorManager.move,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 2.5.h,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.lightbulb_circle,
                                            color: ColorManager.move,
                                            size: 2.5.h,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          state.myCoursesModel.response!
                                              .data![index].name!,
                                          style: getRegularText(
                                                  color: ColorManager.white,
                                                  fontSize: 16.sp)
                                              .copyWith(
                                                  overflow: TextOverflow.fade),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: -13.w,
                                    top: -4.h,
                                    child: Container(
                                      padding: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          border: Border.all(
                                              width: 18,
                                              color: ColorManager.darkBlue)),
                                    ),
                                  )
                                ],
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 3.h,
                          );
                        },
                      ),
                    ),
                  ),
                if (state is MyCoursesFailed)
                  CustomErrorWidget(
                      voidCallback: () =>
                          MyCoursesCubit.get(context).getMyCourses()),
                if (state is MyCoursesLoading) const CustomLoading(),
              ],
            );
          },
        ));
  }
}
