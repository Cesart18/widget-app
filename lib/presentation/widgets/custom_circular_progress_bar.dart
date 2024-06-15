import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/presentation/presentation.dart';
import 'package:widgets_app/shared/shared.dart';

class CustomCircularProgressBar extends ConsumerWidget {
  const CustomCircularProgressBar({super.key});
  @override
  Widget build(BuildContext context, ref) {

    final percentage = ref.watch(progressBarProvider);

    return  CircularProgressBar(
      percentage: percentage,
      backgroundColor: Colors.grey,
      percentageColor: ThemeColors.secondaryColor,
      strokeWidth: 10,
    );
  }
}