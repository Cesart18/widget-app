import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/presentation/presentation.dart';
import 'package:widgets_app/shared/shared.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  void _showModal( BuildContext context, Function() callback, bool isCompleted ){
      showDialog(context: context, builder: (context) {
          return AlertDialog(
            content: IntrinsicHeight(
              child: Text(isCompleted ? '¿Quieres repetir el quiz': '¿Quieres comenzar el quiz?',
              style: const TextStyle(color: Colors.black),
              ),
            ),
            actions: [
              ActionChip(
                label: const Text('Cancelar'),
                onPressed: (){
                  context.pop();
                },
              color: const MaterialStatePropertyAll(Colors.red),),
              ActionChip(label: const Text('Aceptar'),
              onPressed: (){
                context.pop();
                callback();
              },)
            ],
          );
      },);

  }

  @override
  Widget build(BuildContext context, ref) {
    final quizState = ref.watch(quizProvider);
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
                onTap: () => _showModal(
                  context,
                quizState.isQuizOver ? () => ref.read(quizProvider.notifier).restartQuiz() : () => ref.read(quizProvider.notifier).startQuiz()
                 , quizState.isQuizOver),
                backgroundColor: ThemeColors.primaryColor,
                borderColor: ThemeColors.primaryColor,
                progressPercentageColor: ThemeColors.secondaryColor,
                backgroundImage: SvgPicture.asset('assets/svgs/quiz.svg'),
                 labelTitle: 'Capitales de venezuela',
                  labelSubtitle: 'Preguntas ${quizState.completedQuestion}/${quizState.questions.length}',
                   percentage: quizState.completedQuestion * 100 / quizState.questions.length),
            ),
          ),
           Text('Tu puntuacion: ${quizState.score} / ${quizState.questions.length}')
        ],
      ),
    );
  }
}