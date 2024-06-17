import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/config/constants/first_questions.dart';
import 'package:widgets_app/domain/domain.dart';

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});


class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState());

  void selectOption( int value ){
    state = state.copyWith(
      selectedOption: value
    );
  }

  void startQuiz(){
      state = state.copyWith(
        isQuizStarted: true,
        currentQuestion: state.questions[state.currentQuestionIndex]
      );
  }

  void restartQuiz(){
    state = state.copyWith(
      isQuizStarted: true,
      currentQuestionIndex: 0,
      completedQuestion: 0,
      score: 0,
      isAsnwerPosted: false,
      isQuizOver:  false
    );
    state = state.copyWith(
      currentQuestion: state.questions[state.currentQuestionIndex]
    );
  }

  void endQuiz(){
    state = state.copyWith(
      isQuizStarted: false
    );
  }

  void validateAnswer(){
    if ( state.isAsnwerPosted ) return;

    if ( state.selectedOption == null || state.selectedOption == -1) return;

    state = state.copyWith(isAsnwerPosted: true, completedQuestion: state.completedQuestion + 1);

    if( state.selectedOption == state.currentQuestion?.correctAnswer ){
      state = state.copyWith(score: state.score + 1);
    }

  }

  void nextQuestion() async {
    if ( state.currentQuestionIndex < state.questions.length - 1 ){
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        selectedOption: -1,
        isAsnwerPosted: false,
        currentQuestion: state.questions[state.currentQuestionIndex + 1]);
    }else{
      state = state.copyWith(
        isQuizOver:  true,
      );
    }
  }

}



class QuizState{

    final String name;
    final List<Question> questions;
    final Question? currentQuestion;
    final bool isQuizStarted;
    final bool isAsnwerPosted;
    final bool isQuizOver;
    final int? selectedOption;
    final int currentQuestionIndex;
    final int completedQuestion;
    final int score;
    

  QuizState({
     this.name = 'Capitales en Venezuela',
     this.questions =  FirstQuestions.firstQuestions, 
     this.currentQuestion,
     this.isQuizStarted = false,
     this.isAsnwerPosted = false,
     this.isQuizOver = false,
     this.selectedOption,
     this.currentQuestionIndex = 0,
     this.completedQuestion = 0,
     this.score = 0
});

  QuizState copyWith({
    String? name,
    List<Question>? questions,
    Question? currentQuestion,
    bool? isQuizStarted,
    bool? isAsnwerPosted,
    bool? isQuizOver,
    int? selectedOption,
    int? currentQuestionIndex,
    int? completedQuestion,
    int? score,
  }) => QuizState(
    name: name ?? this.name,
    questions: questions ?? this.questions,
    currentQuestion: currentQuestion ?? this.currentQuestion,
    isQuizStarted: isQuizStarted ?? this.isQuizStarted,
    isAsnwerPosted: isAsnwerPosted ?? this.isAsnwerPosted,
    selectedOption: selectedOption ?? this.selectedOption,
    isQuizOver: isQuizOver ?? this.isQuizOver,
    currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    completedQuestion:  completedQuestion ?? this.completedQuestion,
    score: score ?? this.score
  );

  }