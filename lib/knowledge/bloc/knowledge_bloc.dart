import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/knowledge/bloc/knowledge_event.dart';
import 'package:pregnancy_flutter/knowledge/bloc/knowledge_state.dart';

class KnowledgeBloc extends Bloc<KnowledgeEvent, KnowledgeState> {
  var knowledgeDetail;

  KnowledgeBloc() : super(const KnowledgeState()) {
    on<LoadKnowledgeListEvent>(_loadKnowledgeList);
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

  Future<void> _loadKnowledgeList(LoadKnowledgeListEvent event, Emitter<KnowledgeState> emit) async {
    try {
      emit(const StartLoadingState());
      await _readJson(event.type);
      emit(const LoadingSuccessfulState());
    } catch (error) {
      emit(const LoadingFailState());
    }
  }
}
