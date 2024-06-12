import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets_app/config/constants/app_menu_items.dart';
import 'package:widgets_app/presentation/presentation.dart';

class ProgressBarScreen extends StatelessWidget {
  const ProgressBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen')
      ),
      body: const Center(
        child: Hero(tag: ConstantsItems.progressHeroTag, child:  CustomCircularProgressBar()),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<ProgressBloc>().increasePercentage();
      },
      child: const Icon(Icons.refresh),),
    );
  }
}