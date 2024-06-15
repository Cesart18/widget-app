


import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/presentation.dart';



final goRouterNotifierProvider = Provider((ref) {

  final quizNotifier = ref.watch(quizProvider.notifier);
  return GoRouterNotifier(quizNotifier);
});


class GoRouterNotifier extends ChangeNotifier{

  final QuizNotifier _quizNotifier;

  bool _quizStatus = false;

  GoRouterNotifier(this._quizNotifier){
    _quizNotifier.addListener((state) {
      quizStatus = state.isQuizStarted;
     });
  }

  bool get quizStatus => _quizStatus;

  set quizStatus(bool value){
    _quizStatus = value;
    notifyListeners();
  }

}