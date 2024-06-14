import 'package:flutter/material.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/shared/shared.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({super.key});

  @override
  Widget build(BuildContext context) {



    return const CircularProgressBar(
      percentage: 10,
      backgroundColor: Colors.grey,
      percentageColor: ThemeColors.secondaryColor,
      strokeWidth: 10,
    );
  }
}