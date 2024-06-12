part of 'progress_bloc.dart';

sealed class ProgressEvent extends Equatable {
  const ProgressEvent();

  @override
  List<Object> get props => [];
}


class IncreasePercentage extends ProgressEvent{}