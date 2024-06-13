import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'education_progress_event.dart';
part 'education_progress_state.dart';

class EducationProgressBloc
    extends Bloc<EducationProgressEvent, EducationProgressState> {
  EducationProgressBloc() : super(const EducationProgressState()) {
    on<IncrementProgress>(_incrementProgressHandler);
  }

  void incrementProgres(){
    add(IncrementProgress());
  }

  void _incrementProgressHandler(IncrementProgress event, Emitter<EducationProgressState> emit) {
    emit( state.copyWith( percentage: state.percentage + 10 ) );
    if ( state.percentage > 100 ){
      emit(state.copyWith(percentage: 0));
    }
  }
  
}
