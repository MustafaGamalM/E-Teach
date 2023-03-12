import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavigtionIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  const NavigtionIcon(this.onPressed, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 3.h,
      backgroundColor: ColorManager.cien,
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        color: ColorManager.white,
      ),
    );
  }
}
