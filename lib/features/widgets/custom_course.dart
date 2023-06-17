import 'package:e_teach/core/utilis/app_manager/assets_manager.dart';
import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
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
        width: 18.h,
        height: 15.h,
        padding: EdgeInsets.all(AppPadding.p1.h),
        margin: EdgeInsets.all(AppPadding.p1.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s24),
            color: ColorManager.cien),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                ImageAssets.course,
                height: AppSize.s10.h,
              ),
            ),
            SizedBox(
              height: .5.h,
            ),
            Text(
              courseName,
              textAlign: TextAlign.center,
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
                itemSize: 3.5.w,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                itemBuilder: (context, _) => const Icon(
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
