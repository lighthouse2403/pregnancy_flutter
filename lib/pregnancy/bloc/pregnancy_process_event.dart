import 'package:equatable/equatable.dart';
import 'package:pregnancy_flutter/doctor/doctor_model.dart';

abstract class PregnancyProcessEvent extends Equatable {
  const PregnancyProcessEvent();
}

class LoadPregnancyProcessEvent extends PregnancyProcessEvent {
  const LoadPregnancyProcessEvent();

  @override
  List<Object?> get props => [];
}

class ChangedWeekEvent extends PregnancyProcessEvent {
  int week;
  ChangedWeekEvent(this.week);

  @override
  List<Object?> get props => [week];
}