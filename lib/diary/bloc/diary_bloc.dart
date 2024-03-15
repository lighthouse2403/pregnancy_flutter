import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_flutter/diary/bloc/diary_event.dart';
import 'package:pregnancy_flutter/diary/bloc/diary_state.dart';
import 'package:pregnancy_flutter/index/bloc/index_event.dart';
import 'package:pregnancy_flutter/index/bloc/index_state.dart';
import 'package:pregnancy_flutter/index/model/index_model.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  List<IndexModel> indexList = [];

  DiaryBloc() : super(const DiaryState()) {
    on<LoadDiariesEvent>(_loadDiaries);
  }

  Future<void>_readJson() async {
    final String response = await rootBundle.loadString('assets/data/json/baby_index_detail.json');

    var jsonString = await json.decode(response);


    indexList = (jsonString['index_detail'] as List)
        .map((data) => IndexModel.fromJson(data))
        .toList();

  }

  Future<void>_loadDiaries(LoadDiariesEvent event, Emitter<DiaryState> emit) async {
    try {
      emit(const StartLoadingDiariesState());
      await _readJson();
      emit(const LoadDiariesSuccessful());
    } catch (error) {
      emit(const LoadDiariesFail());
    }
  }
}
