import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/presentation/presentation.dart';
import 'package:widgets_app/shared/shared.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({super.key});

  @override
  Widget build(BuildContext context) {

    final percentage = context.watch<ProgressBloc>().state.percentage;

    return CircularProgressBar(
      percentage: percentage,
      backgroundColor: Colors.grey,
      percentageColor: ThemeColors.secondaryColor,
    );
  }
}