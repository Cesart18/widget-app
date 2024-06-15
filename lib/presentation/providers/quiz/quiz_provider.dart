import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/config/constants/first_questions.dart';
import 'package:widgets_app/domain/domain.dart';

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});


class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState());


  void startQuiz(){
      state = state.copyWith(
        isQuizStarted: true,
        // currentQuestion: state.questions[state.currentQuestionIndex]
      );
      // print(state.isQuizStarted);
  }
  void enQuiz(){
    state = state.copyWith(
      isQuizStarted: false
    );
  }

  void nextQuestion() {
    if (state.currentQuestionIndex < FirstQuestions.firstQuestions.length) {}
  }
}



class QuizState{

    final String name;
    final List<Question> questions;
    final Question? currentQuestion;
    final bool isQuizStarted;
    final int? selectedQuestion;
    final int currentQuestionIndex;
    final int completedQuestion;

  QuizState({
     this.name = 'Capitales de Venezuela',
     this.questions =  FirstQuestions.firstQuestions, 
     this.currentQuestion,
     this.isQuizStarted = false,
     this.selectedQuestion,
     this.currentQuestionIndex = 0,
     this.completedQuestion = 0
});

  QuizState copyWith({
    String? name,
    List<Question>? questions,
    Question? currentQuestion,
    bool? isQuizStarted,
    int? selectedQuestion,
    int? currentQuestionIndex,
    int? completedQuestion,
  }) => QuizState(
    name: name ?? this.name,
    questions: questions ?? this.questions,
    currentQuestion: currentQuestion ?? this.currentQuestion,
    isQuizStarted: isQuizStarted ?? this.isQuizStarted,
    selectedQuestion: selectedQuestion ?? this.selectedQuestion,
    currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    completedQuestion:  completedQuestion ?? this.completedQuestion
  );

  }