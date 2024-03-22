import 'package:equatable/equatable.dart';
import 'package:pregnancy_flutter/diary/model/diary.dart';

abstract class DiaryEvent extends Equatable {
  const DiaryEvent();
}

class LoadDiariesEvent extends DiaryEvent {
  const LoadDiariesEvent();

  @override
  List<Object?> get props => [];
}

class CreateDiary extends DiaryEvent {
  CreateDiary(this.title, this.time, this.content);
  String title;
  String content;
  DateTime time;

  @override
  List<Object?> get props => [title, content, time];
}

class EditDiary extends DiaryEvent {
  EditDiary(this.diary, this.time, this.title, this.content);
  Diary? diary;
  String title;
  String content;
  DateTime time;

  @override
  List<Object?> get props => [diary];
}

class Delete extends DiaryEvent {
  Delete(this.id);
  String id;

  @override
  List<Object?> get props => [id];
}
