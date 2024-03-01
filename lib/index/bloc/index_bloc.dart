import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_flutter/index/bloc/index_event.dart';
import 'package:pregnancy_flutter/index/bloc/index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  var knowledgeDetail;

  IndexBloc() : super(const IndexState()) {
    on<LoadIndexEvent>(_loadIndex);
  }

  Future<void> _readJson() async {
    final String response = await rootBundle.loadString('assets/data/json/baby_index_detail.json');
    knowledgeDetail = await json.decode(response);
  }

  Future<void> _loadIndex(LoadIndexEvent event, Emitter<IndexState> emit) async {
    try {
      emit(const StartIndexState());
      await _readJson();
      emit(const LoadingSuccessfulIndexState());
    } catch (error) {
      emit(const LoadingFailIndexState());
    }
  }
}
