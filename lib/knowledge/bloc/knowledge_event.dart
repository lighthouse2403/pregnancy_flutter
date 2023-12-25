import 'package:equatable/equatable.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';

abstract class KnowledgeEvent extends Equatable {
  const KnowledgeEvent();
}

class LoadKnowledgeEvent extends KnowledgeEvent {
  LoadKnowledgeEvent(this.type);
  KnowLedgeType type;

  @override
  List<Object?> get props => [type];
}

class LoadKnowledgeListEvent extends KnowledgeEvent {
  LoadKnowledgeListEvent(this.type);
  KnowLedgeType type;

  @override
  List<Object?> get props => [type];
}
