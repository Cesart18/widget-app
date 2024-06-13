part of 'education_progress_bloc.dart';

 class EducationProgressState extends Equatable {
  final double percentage;
  const EducationProgressState({
     this.percentage = 0
  });

  EducationProgressState copyWith({
    double? percentage
  }) => EducationProgressState(
    percentage: percentage ?? this.percentage
  );
  
  @override
  List<Object> get props => [percentage];
}


