import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/diary/bloc/diary_event.dart';
import 'package:pregnancy_flutter/diary/bloc/diary_state.dart';


class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  var knowledgeDetail;

  DiaryBloc() : super(const DiaryState()) {
    on<LoadDiariesEvent>(_loadDiaries);
    on<CreateDiary>(_createDiary);

  }

  Future<void> _readJson(KnowLedgeType type) async {
    String knowLedgeType = '';
    switch (type) {
      case KnowLedgeType.story:
        knowLedgeType = 'stories';
        break;
      case KnowLedgeType.beforePregnancy:
        knowLedgeType = 'before_pregnancy_knowledge';
        break;
      case KnowLedgeType.inPregnancy:
        knowLedgeType = 'knowledge';
        break;
      case KnowLedgeType.inHospital:
        knowLedgeType = 'labor_and_birth';
        break;
      case KnowLedgeType.afterPregnancy:
        knowLedgeType = 'after_knowledge';
        break;
      case KnowLedgeType.experiences:
        knowLedgeType = 'stories';
        break;
      default:
        break;
    }

    final String response = await rootBundle.loadString('assets/data/json/$knowLedgeType.json');
    knowledgeDetail = await json.decode(response);
  }

  Future<void> _loadDiaries(LoadDiariesEvent event, Emitter<DiaryState> emit) async {
    try {
      emit(const StartLoadingState());
      emit(const LoadingSuccessfulState());
    } catch (error) {
      emit(const LoadingFailState());
    }
  }

  Future<void> _createDiary(CreateDiary event, Emitter<DiaryState> emit) async {
    try {
      emit(const StartLoadingState());

      emit(const LoadingSuccessfulState());
    } catch (error) {
      emit(const LoadingFailState());
    }
  }
}
