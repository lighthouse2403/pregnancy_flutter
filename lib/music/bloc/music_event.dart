import 'package:equatable/equatable.dart';
import 'package:pregnancy_flutter/music/model/music_model.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class PlayMusicEvent extends MusicEvent {
  MusicModel music;
  PlayMusicEvent(this.music);

  @override
  List<Object?> get props => [music];
}

class PauseMusicEvent extends MusicEvent {
  MusicModel music;
  PauseMusicEvent(this.music);

  @override
  List<Object?> get props => [music];
}