import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/presentation/presentation.dart';

final appRouterProvider = Provider((ref) {
  final goRouterNotifer = ref.watch(goRouterNotifierProvider);

  return GoRouter(
    refreshListenable: goRouterNotifer,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
          path: 'quiz',
          builder: (context, state) => const QuizScreen(),
          routes: [
            GoRoute(
              path: 'quiz',
              builder: (context, state) => const QuizView(),
            )
          ]),
        ]
      ),
      GoRoute(
        path: '/progress-bar',
        builder: (context, state) => const ProgressBarScreen(),
      ),
      GoRoute(
        path: '/education-card',
        builder: (context, state) => const EducationCardScreen(),
      ),
      
    ],
    redirect: (context, state) {
      final isGoingTo = state.fullPath;
      final quizStatus = goRouterNotifer.quizStatus;

      if (!quizStatus) {
        if (isGoingTo == '/quiz' || isGoingTo == '/') return null;
        if( isGoingTo == '/quiz/quiz' ) return '/quiz';
      }

      if (quizStatus) {
        if (isGoingTo == '/' || isGoingTo == '/quiz') {
          return '/quiz/quiz';
        }
      }

      return null;
    },
  );
});
