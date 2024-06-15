import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgets_app/presentation/presentation.dart';

class QuizView extends ConsumerWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final quizState = ref.watch(quizProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregunta ${quizState.currentQuestionIndex} / ${quizState.questions.length}')
      ),
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset('assets/svgs/quiz.svg'),
            FilledButton(onPressed: (){
              ref.read(quizProvider.notifier).enQuiz();
            }, child: Text('Click'))
          ],
        ),
      ),
    );
  }
}

