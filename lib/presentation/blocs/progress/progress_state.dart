part of 'progress_bloc.dart';

 class ProgressState extends Equatable {

  final double percentage;

  const ProgressState({ this.percentage = 0.0});

  ProgressState copyWith({
    double? percentage
  }) => ProgressState(
    percentage: percentage ?? this.percentage
  );
  
  @override
  List<Object> get props => [ percentage ];
}


