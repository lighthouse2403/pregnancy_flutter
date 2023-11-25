import 'package:pregnancy_flutter/common/base/bloc/base_event.dart';

class BabyInformationEvent extends BaseEvent {

  const BabyInformationEvent();

  @override
  List<Object?> get props => [];
}

class SaveMotherNameEvent extends BaseEvent {
  final String name;
  const SaveMotherNameEvent(this.name);

  @override
  List<Object?> get props => [this.name];
}

class SaveBabyNameEvent extends BaseEvent {
  final String name;
  const SaveBabyNameEvent(this.name);

  @override
  List<Object?> get props => [this.name];
}

class SaveBirthDateEvent extends BaseEvent {
  final DateTime time;
  const SaveBirthDateEvent(this.time);

  @override
  List<Object?> get props => [this.time];
}

class SaveLastPriodEvent extends BaseEvent {
  final DateTime time;
  const SaveLastPriodEvent(this.time);

  @override
  List<Object?> get props => [this.time];
}