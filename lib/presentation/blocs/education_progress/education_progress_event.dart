part of 'education_progress_bloc.dart';

sealed class EducationProgressEvent extends Equatable {
  const EducationProgressEvent();

  @override
  List<Object> get props => [];
}

class IncrementProgress extends EducationProgressEvent{}