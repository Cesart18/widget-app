import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/shared/shared.dart';
import '../../presentation.dart';

class EducationCardScreen extends ConsumerWidget {
  const EducationCardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final percentage = ref.watch(educationCardProvider);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Tarjeta Educativa',
        style: textStyle.titleLarge,),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          Center(
            child: Hero(
              tag: ConstantsItems.educationHeroTag,
              child: EducationCard(
                backgroundImage: SvgPicture.asset('assets/svgs/educador.svg'),
                 labelTitle: 'Lección 1',
                  labelSubtitle: '¿Que es Excuela?',
                  progressPercentageColor: ThemeColors.secondaryColor,
                   percentage: percentage)),
          ),
          const SizedBox(height: 50,),
          FilledButton(onPressed: (){
            if ( percentage < 100 ){
              ref.read(educationCardProvider.notifier).state += 20;
            }else{
              ref.read(educationCardProvider.notifier).state = 0;
            }

          }, child: const Text('Siguiente clase'))
        ],
      ),
    );
  }
}