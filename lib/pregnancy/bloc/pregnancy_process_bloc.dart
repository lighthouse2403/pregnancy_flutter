import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_flutter/pregnancy/bloc/pregnancy_process_event.dart';
import 'package:pregnancy_flutter/pregnancy/bloc/pregnancy_process_state.dart';
import 'package:pregnancy_flutter/pregnancy/pregnancy_model.dart';

class PregnancyProcessBloc extends Bloc<PregnancyProcessEvent, PregnancyProcessState> {
  List<PregnancyProcessModel> process = [];
  late PregnancyProcessModel currentWeek;

  PregnancyProcessBloc() : super(const PregnancyProcessState()) {
    on<LoadPregnancyProcessEvent>(_loadProcess);
    on<ChangedWeekEvent>(_changedWeek);

  }

  Future<List<PregnancyProcessModel>> _readJson() async {
    final String response = await rootBundle.loadString('assets/data/json/pregnancy_process.json');
    final datas = await json.decode(response);
    List<dynamic> pregnancyJson = datas['pregnancy'];
    List<PregnancyProcessModel> process = List<PregnancyProcessModel>.from(pregnancyJson.map((e) => PregnancyProcessModel.fromJson(e)));

    return process;
  }

  Future<void> _loadProcess(LoadPregnancyProcessEvent event, Emitter<PregnancyProcessState> emit) async {
    try {
      emit(const StartLoadingState());
      process = await _readJson();
      if (process.isNotEmpty) {
        currentWeek = process.first;
      }
      emit(const LoadingSuccessfulState());
    } catch (error) {
      emit(const LoadingFailState());
    }
  }

  Future<void> _changedWeek(ChangedWeekEvent event, Emitter<PregnancyProcessState> emit) async {
    try {
      emit(const StartLoadingState());
      if (process.length > event.week) {
        currentWeek = process[event.week];
      }
      emit(const LoadingSuccessfulState());
    } catch (error) {
      emit(const LoadingFailState());
    }
  }
}
