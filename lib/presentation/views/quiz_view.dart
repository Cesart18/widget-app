import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/domain/domain.dart';
import 'package:widgets_app/presentation/presentation.dart';
import 'package:widgets_app/shared/shared.dart';

class QuizView extends ConsumerWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final quizState = ref.watch(quizProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title:SizedBox(
          width: 250,
          child: LinearProgressBar(
          labelColor: ThemeColors.primaryColor,
          percentage: quizState.completedQuestion * 100 / quizState.questions.length, percentageColor: ThemeColors.secondaryColor, primaryColor: ThemeColors.primaryColor,
        ),
        ),
      ),
      body: SafeArea(
        child: ( !quizState.isQuizOver  ) ? Center(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              const SizedBox(height: 10,),
              _QuestionView(
                question: quizState.currentQuestion,
                )
              
            ],
          ),
        ): Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Quiz terminado'),
              const SizedBox(height: 10,),
              ( quizState.score > 3 ) ?const Text('Felicidades',
              style: TextStyle(fontSize: 30),): const Text('Sigue practicando',style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10,),
              const Text('Has acertado'),
              Text('${quizState.score} preguntas correctamente'),
              const SizedBox(height: 40,),
              FilledButton(onPressed: (){
                ref.read(quizProvider.notifier).endQuiz();
              }, child: const Text('Salir'))
            ],
          ),
        )
        ,
      ),
    );
  }
}


class _QuestionView extends ConsumerWidget {
  final Question? question;
  const _QuestionView({required this.question });

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final quizState = ref.watch(quizProvider);
    if( question == null ){
      return const CircularProgressIndicator(strokeWidth: 2,);
    }
    return Column(
      children: [
        Text(question!.title,
        textAlign: TextAlign.center,
        style: textStyle.headlineLarge,),
        const SizedBox(height: 10,),
        Text('${quizState.currentQuestionIndex + 1} / ${quizState.questions.length}'),
        const SizedBox(height: 10,),
        const Divider(),
        const SizedBox(height: 20,),
        ...question!.options.map((option) {

          final optionIndex = question!.options.indexOf(option);
          bool selectedOption = optionIndex == quizState.selectedOption;
          if( quizState.selectedOption == null ){
            selectedOption = false;
          }
          final correctAnswer = optionIndex == question!.correctAnswer;
          
          return _QuestionOption(
            option: option,
            value: selectedOption,
            color: ( quizState.isAsnwerPosted && correctAnswer ) ? Colors.green : null,
            onChanged: quizState.isAsnwerPosted ? null :  (_) => ref.read(quizProvider.notifier).selectOption(optionIndex),
          );
        }
        ),

        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: ThemeColors.secondaryColor),
          onPressed: (){
          ref.read(quizProvider.notifier).validateAnswer();
        }, child: const Text('Aceptar')),

        ElevatedButton(onPressed: quizState.isAsnwerPosted? (){
          ref.read(quizProvider.notifier).nextQuestion();
        }: null, child: const Text('Siguiente')),
      ],
    );
  }
}


class _QuestionOption extends StatelessWidget {
  final String option;
  final bool value;
  final Color? color;
  final Function(bool?)? onChanged;
  const _QuestionOption({required this.option, required this.value, this.onChanged, this.color});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
        color: ThemeColors.primaryColor,
        border: Border.all(
          color: color ?? ThemeColors.primaryColor
        ),
        boxShadow:  const [
                BoxShadow(
                  offset: Offset(-3, 3), 
                  blurRadius: 4, 
                  color: Color(0xFF00060A), 
                ),
                BoxShadow(
                  offset: Offset(3, -3), 
                  blurRadius: 4, 
                  color: Color.fromARGB(51, 87, 230, 199), 
                )
              ]
      ),
      child: CheckboxListTile(
        checkboxShape: const CircleBorder(),
        activeColor: ThemeColors.secondaryColor,
        title: Text(option, style: textStyle.bodyMedium,),
        value: value, onChanged: onChanged));
  }
}
