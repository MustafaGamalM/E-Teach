import 'package:e_teach/core/utilis/app_manager/color_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressd});

  final String title;
  final VoidCallback onPressd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: ColorManager.cien,
        onPressed: onPressd,
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorManager.white)),
      ),
    );
  }
}
