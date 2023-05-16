import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:e_teach/core/utilis/app_manager/styles_manager.dart';
import 'package:e_teach/core/utilis/app_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomCourse extends StatelessWidget {
  const CustomCourse(
      {super.key,
      required this.courseName,
      required this.onTap,
      required this.rate});
  final String courseName;
  final VoidCallback onTap;
  final int rate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSize.s24),
      child: Container(
        width: 20.h,
        height: 20.h,
        padding: EdgeInsets.all(AppPadding.p1.h),
        margin: EdgeInsets.all(AppPadding.p1.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s24),
            color: ColorManager.cien),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                ImageAssets.course,
                height: AppSize.s10.h,
              ),
            ),
            Text(
              AppStrings.courseName + courseName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: getMediumText(
                  color: ColorManager.black, fontSize: AppSize.s9.sp),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: RatingBar.builder(
                initialRating: double.parse('$rate'),
                minRating: 1,
                itemSize: 4.w,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
