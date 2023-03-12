import 'package:e_teach/core/utilis/app_manager/strings_manager.dart';
import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  const CustomRowWidget(this.title, this.onpressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        TextButton(
          child: Text(AppStrings.seeMore),
          onPressed: onpressed,
        )
      ],
    );
  }
}
