import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FullPopScreen extends StatelessWidget {
  final String title;
  final String errorMsg;
  final Function retryFunction;
  final bool isError;
  const FullPopScreen(this.errorMsg, this.title, this.retryFunction,this.isError,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
