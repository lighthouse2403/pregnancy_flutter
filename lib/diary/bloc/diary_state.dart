import 'package:equatable/equatable.dart';

class DiaryState extends Equatable {
  final bool? isSubmitting;

  const DiaryState({this.isSubmitting,});

  @override
  List<Object?> get props => [isSubmitting];
}

class StartLoadingState extends DiaryState {

  const StartLoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingSuccessfulState extends DiaryState {

  const LoadingSuccessfulState();

  @override
  List<Object?> get props => [];
}

class LoadingFailState extends DiaryState {

  const LoadingFailState();

  @override
  List<Object?> get props => [];
}