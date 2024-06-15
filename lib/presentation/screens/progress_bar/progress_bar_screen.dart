import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/constants/app_menu_items.dart';
import 'package:widgets_app/presentation/presentation.dart';

class ProgressBarScreen extends ConsumerWidget {
  const ProgressBarScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final percentage = ref.watch(progressBarProvider);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Barra de progreso',
        style: textStyle.titleLarge,
          )
      ),
      body: const Center(
        child: Hero(tag: ConstantsItems.progressHeroTag, child:  CustomCircularProgressBar()),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        if ( percentage < 100.0 ){
          ref.read(progressBarProvider.notifier).state += 10;
        }else{
          ref.read(progressBarProvider.notifier).state = 0;
        }
      },
      child: const Icon(Icons.refresh),),
    );
  }
}