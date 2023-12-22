import 'package:bloc/bloc.dart';
import 'package:pregnancy_flutter/common/firebase/firebase_doctor.dart';
import 'package:pregnancy_flutter/doctor/bloc/doctor_event.dart';
import 'package:pregnancy_flutter/doctor/bloc/doctor_state.dart';
import 'package:pregnancy_flutter/doctor/doctor_model.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  int paging = 100;
  List<DoctorModel> doctors = [];

  DoctorBloc() : super(const DoctorState()) {
    on<LoadDoctor>(_loadDoctors);
    on<UpdateRatingEvent>(_updateRating);
    on<UpdateNumberOfViewEvent>(_updateNumberOfView);

  }

  Future<void> _loadDoctors(LoadDoctor event, Emitter<DoctorState> emit) async {
    try {
      emit(const LoadingState());
      doctors = await FirebaseDoctor.instance.loadDoctors();
      emit(const LoadingSuccessfulState());
    } catch (error) {
      emit(const LoadingSuccessfulState());
    }
  }

  Future<void> _updateRating(UpdateRatingEvent event, Emitter<DoctorState> emit) async {
    try {
      emit(const LoadingState());
      await FirebaseDoctor.instance.updateRating(event.doctor, event.rating);
      emit(const UpdateRatingSuccessfulState());
    } catch (error) {
      emit(const UpdateRatingFailState());
    }
  }

  Future<void> _updateNumberOfView(UpdateNumberOfViewEvent event, Emitter<DoctorState> emit) async {
    try {
      emit(const LoadingState());
      await FirebaseDoctor.instance.updateView(event.doctor);
      emit(const UpdateNumberOfViewSuccessfulState());
    } catch (error) {
      emit(const UpdateNumberOfViewFailState());
    }
  }
}
