import 'package:equatable/equatable.dart';
import 'package:pregnancy_flutter/vaccination/vaccination_model.dart';

abstract class VaccinationEvent extends Equatable {
  const VaccinationEvent();
}

class LoadVaccination extends VaccinationEvent {
  const LoadVaccination();

  @override
  List<Object?> get props => [];
}

class UpdateRatingEvent extends VaccinationEvent {
  VaccinationModel vaccination;
  int rating;
  UpdateRatingEvent(this.rating, this.vaccination);

  @override
  List<Object?> get props => [rating, vaccination];
}

class UpdateNumberOfViewEvent extends VaccinationEvent {
  VaccinationModel vaccination;
  UpdateNumberOfViewEvent(this.vaccination);

  @override
  List<Object?> get props => [vaccination];
}