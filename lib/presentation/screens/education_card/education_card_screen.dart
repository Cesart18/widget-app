import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/shared/shared.dart';
// import '../../presentation.dart';

class EducationCardScreen extends StatelessWidget {
  const EducationCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

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
                   percentage: 20)),
          ),
          const SizedBox(height: 50,),
          FilledButton(onPressed: (){
          }, child: const Text('Siguiente clase'))
        ],
      ),
    );
  }
}