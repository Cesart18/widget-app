

import 'package:get_it/get_it.dart';
import 'package:widgets_app/presentation/presentation.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit(){

  getIt.registerSingleton(ProgressBloc());
  getIt.registerSingleton(EducationProgressBloc());

}