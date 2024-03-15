import 'package:equatable/equatable.dart';

abstract class DiaryEvent extends Equatable {
  const DiaryEvent();
}

class LoadDiariesEvent extends DiaryEvent {
  const LoadDiariesEvent();

  @override
  List<Object?> get props => [];
}
