import 'package:equatable/equatable.dart';

class KnowledgeState extends Equatable {
  final bool? isSubmitting;

  const KnowledgeState({this.isSubmitting,});

  @override
  List<Object?> get props => [isSubmitting];
}

class StartLoadingState extends KnowledgeState {

  const StartLoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingSuccessfulState extends KnowledgeState {

  const LoadingSuccessfulState();

  @override
  List<Object?> get props => [];
}

class LoadingFailState extends KnowledgeState {

  const LoadingFailState();

  @override
  List<Object?> get props => [];
}