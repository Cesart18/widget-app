


import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/presentation.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),),
    GoRoute(path: '/progress-bar',
    builder: (context, state) => const ProgressBarScreen(),)
  ]);