import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_teach/core/utilis/app_manager/app_reference.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/di.dart';
import 'package:e_teach/features/my_courses/presentation/viewmodel/cubit/course_cubit.dart';
import 'package:e_teach/features/widgets/text_form_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

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

  double per = 0;

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

      MyCoursesCubit.get(context).uploadMyCourses(
        formData,
        (count, total) {
          setState(() {
            double percentage = (count / total) * 100;
            per = percentage;
          });
          // print('dio   ${percentage.toInt()}');
        },
      );
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
      body: BlocBuilder<MyCoursesCubit, CourseState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10.h, left: 7.w, right: 7.w, bottom: 5.h),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      AppStrings.canSubmitVideo.tr(),
                      style: getBoldText(
                          color: ColorManager.black, fontSize: 18.sp),
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
                          hintText: AppStrings.courseName.tr(),
                          labelText: AppStrings.courseName.tr(),
                          validator: (e) {
                            if (e!.isEmpty) {
                              return AppStrings.courseName.tr();
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
                          AppStrings.uploadVideo.tr(),
                          style: getMediumText(
                              color: ColorManager.black, fontSize: 10.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: AppStrings.percentage.tr(),
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorManager.black)),
                      TextSpan(
                          text: '${per.toInt()}',
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorManager.babyBlue)),
                    ])),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 10.h,
                        height: 10.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.w,
                          value: per.toInt() / 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
