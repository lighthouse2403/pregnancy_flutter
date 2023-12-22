import 'package:bloc/bloc.dart';
import 'package:pregnancy_flutter/common/firebase/firebase_vaccination.dart';
import 'package:pregnancy_flutter/vaccination/bloc/vaccination_event.dart';
import 'package:pregnancy_flutter/vaccination/bloc/vaccination_state.dart';
import 'package:pregnancy_flutter/vaccination/vaccination_model.dart';

class VaccinationBloc extends Bloc<VaccinationEvent, VaccinationState> {
  int paging = 100;
  List<VaccinationModel> vaccinations = [];

  VaccinationBloc() : super(const VaccinationState()) {
    on<LoadVaccination>(_loadVaccinations);
    on<UpdateRatingEvent>(_updateRating);
    on<UpdateNumberOfViewEvent>(_updateNumberOfView);

  }

  Future<void> _loadVaccinations(VaccinationEvent event, Emitter<VaccinationState> emit) async {
    try {
      emit(const LoadingVaccinationState());
      vaccinations = await FirebaseVaccination.instance.loadVaccination();
      emit(const LoadingVaccinationSuccessfulState());
    } catch (error) {
      emit(const LoadingVaccinationFailState());
    }
  }

  Future<void> _updateRating(UpdateRatingEvent event, Emitter<VaccinationState> emit) async {
    try {
      emit(const LoadingVaccinationState());
      await FirebaseVaccination.instance.updateRating(event.vaccination, event.rating);
      emit(const UpdateVaccinationRatingSuccessfulState());
    } catch (error) {
      emit(const UpdateVaccinationRatingFailState());
    }
  }

  Future<void> _updateNumberOfView(UpdateNumberOfViewEvent event, Emitter<VaccinationState> emit) async {
    try {
      emit(const LoadingVaccinationState());
      await FirebaseVaccination.instance.updateView(event.vaccination);
      emit(const UpdateVaccinationNumberOfViewSuccessfulState());
    } catch (error) {
      emit(const UpdateVaccinationNumberOfViewFailState());
    }
  }
}
