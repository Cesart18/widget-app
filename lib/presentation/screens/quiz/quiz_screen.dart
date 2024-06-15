import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/presentation/presentation.dart';
import 'package:widgets_app/shared/shared.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100,),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow:  [
                BoxShadow(
                  offset: Offset(-40, 40), 
                  blurRadius: 40, 
                  color: Color(0xFF00060A), 
                ),
                BoxShadow(
                  offset: Offset(40, -40), 
                  blurRadius: 40, 
                  color: Color(0x1657E6C7), 
                )
              ]
              ),
              child: EducationCard(
                onTap: () => ref.read(quizProvider.notifier).startQuiz(),
                backgroundColor: ThemeColors.primaryColor,
                borderColor: ThemeColors.primaryColor,
                progressPercentageColor: ThemeColors.secondaryColor,
                backgroundImage: SvgPicture.asset('assets/svgs/quiz.svg'),
                 labelTitle: 'Capitales de venezuela',
                  labelSubtitle: 'Preguntas 0/5',
                   percentage: 0),
            ),
          )
        ],
      ),
    );
  }
}