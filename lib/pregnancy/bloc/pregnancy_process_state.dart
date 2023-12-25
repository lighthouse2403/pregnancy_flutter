import 'package:equatable/equatable.dart';

class PregnancyProcessState extends Equatable {
  final bool? isSubmitting;

  const PregnancyProcessState({this.isSubmitting,});

  @override
  List<Object?> get props => [isSubmitting];
}

class StartLoadingState extends PregnancyProcessState {

  const StartLoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingSuccessfulState extends PregnancyProcessState {

  const LoadingSuccessfulState();

  @override
  List<Object?> get props => [];
}

class LoadingFailState extends PregnancyProcessState {

  const LoadingFailState();

  @override
  List<Object?> get props => [];
}

class ChangedWeekState extends PregnancyProcessState {

  const ChangedWeekState();

  @override
  List<Object?> get props => [];
}