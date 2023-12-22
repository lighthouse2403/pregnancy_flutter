import 'package:equatable/equatable.dart';
import 'package:pregnancy_flutter/doctor/doctor_model.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();
}

class LoadDoctor extends DoctorEvent {
  const LoadDoctor();

  @override
  List<Object?> get props => [];
}

class UpdateRatingEvent extends DoctorEvent {
  DoctorModel doctor;
  int rating;
  UpdateRatingEvent(this.rating, this.doctor);

  @override
  List<Object?> get props => [rating, doctor];
}

class UpdateNumberOfViewEvent extends DoctorEvent {
  DoctorModel doctor;
  UpdateNumberOfViewEvent(this.doctor);

  @override
  List<Object?> get props => [doctor];
}