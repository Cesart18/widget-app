import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(const ProgressState()) {
    on<IncreasePercentage>(_increasePercentageHandler);
  }

  void increasePercentage(){
    add(IncreasePercentage());
  }

  void _increasePercentageHandler( IncreasePercentage event, Emitter<ProgressState> emit ){
    emit( state.copyWith( percentage: state.percentage + 10 ) );
    if ( state.percentage > 100 ){
      emit(state.copyWith(percentage: 0));
    }
  }
}
