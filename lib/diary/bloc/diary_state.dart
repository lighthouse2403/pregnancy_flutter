import 'package:equatable/equatable.dart';

class DiaryState extends Equatable {

  const DiaryState();

  @override
  List<Object?> get props => [];
}

class StartLoadingDiariesState extends DiaryState {
  const StartLoadingDiariesState();

  @override
  List<Object?> get props => [];
}

class LoadDiariesSuccessful extends DiaryState {

  const LoadDiariesSuccessful();

  @override
  List<Object?> get props => [];
}

class LoadDiariesFail extends DiaryState {

  const LoadDiariesFail();

  @override
  List<Object?> get props => [];
}

class SaveDiarySuccessful extends DiaryState {

  const SaveDiarySuccessful();

  @override
  List<Object?> get props => [];
}

class SaveDiaryFail extends DiaryState {

  const SaveDiaryFail();

  @override
  List<Object?> get props => [];
}