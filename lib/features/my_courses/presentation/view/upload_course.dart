import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_teach/core/utilis/api_services/api_services.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/my_courses/presentation/viewmodel/cubit/course_cubit.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class UploadCourse extends StatefulWidget {
  UploadCourse({super.key, required this.roomId});
  final int roomId;

  @override
  State<UploadCourse> createState() => _UploadCourseState();
}

class _UploadCourseState extends State<UploadCourse> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _videoTextController = TextEditingController();
  double progressVal = 0;
  pickVideo(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      sendVideo(File(pickedFile.path), context);
      // return File(pickedFile.path);
    } else {
      return null;
    }
  }

  void sendVideo(File file, BuildContext context) async {
    File? videoFile = file;
    AppReference _appRef = instance<AppReference>();
    String token = await _appRef.getToken();
    if (videoFile != null) {
      FormData formData = FormData.fromMap({
        'videos': await MultipartFile.fromFile(videoFile.path),
        'course_id': widget.roomId,
        'token': token,
        "name": _videoTextController.text
      });

      MyCoursesCubit.get(context).uploadMyCourses(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0.0,
        leading: BackButton(color: ColorManager.primary),
      ),
      body: BlocConsumer<MyCoursesCubit, CourseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = MyCoursesCubit.get(context);
          return Padding(
            padding:
                EdgeInsets.only(top: 10.h, left: 7.w, right: 7.w, bottom: 5.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    AppStrings.canSubmitVideo,
                    style:
                        getBoldText(color: ColorManager.black, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Theme(
                      data: ThemeData(
                          inputDecorationTheme: InputDecorationTheme(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2)))),
                      child: CustomAuthFormFiled(
                        controller: _videoTextController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppStrings.courseName,
                        labelText: AppStrings.courseName,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return AppStrings.courseName;
                          }
                        },
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: ColorManager.babyBlue),
                      icon: Icon(
                        Icons.download,
                        color: ColorManager.black,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          pickVideo(context);
                        }
                      },
                      label: Text(
                        AppStrings.uploadVideo,
                        style: getMediumText(
                            color: ColorManager.black, fontSize: 10.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 4.h,
                    width: double.infinity,
                    child: LiquidLinearProgressIndicator(
                      value: (cubit.fullProg) / 100,
                      valueColor: AlwaysStoppedAnimation(
                        ColorManager.babyBlue,
                      ),
                      backgroundColor: Colors
                          .white, // Defaults to the current Theme's backgroundColor.
                      borderColor: ColorManager.grey,
                      borderWidth: 1.0,
                      borderRadius: 12.0,
                      direction: Axis
                          .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                      center: Text("Loading..."),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
