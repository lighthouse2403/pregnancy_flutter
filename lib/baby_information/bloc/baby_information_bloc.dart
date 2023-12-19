import 'package:bloc/src/bloc.dart';
import 'package:pregnancy_flutter/app_module.dart';
import 'package:pregnancy_flutter/baby_information/bloc/baby_information_event.dart';
import 'package:pregnancy_flutter/baby_information/bloc/baby_information_state.dart';
import 'package:pregnancy_flutter/common/base/bloc/base_bloc.dart';
import 'package:pregnancy_flutter/common/base/bloc/base_state.dart';
import 'package:pregnancy_flutter/common/extension/date_time_extension.dart';
import 'package:pregnancy_flutter/local/cache.dart';

class BabyInformationBloc extends BaseBloc {
  BabyInformationBloc() : super() {
    on<SaveMotherNameEvent>(_saveMotherName);

    on<SaveBabyNameEvent>(_saveBabyName);

    on<SaveBirthDateEvent>(_saveBirthDate);

    on<SaveLastPriodEvent>(_saveLastPeriod);

  }
}

void _saveMotherName(SaveMotherNameEvent event, Emitter<BaseState> emit) async {
  getIt<CacheData>().saveMotherName(event.name);
}

void _saveBabyName(SaveBabyNameEvent event, Emitter<BaseState> emit) async {
  getIt<CacheData>().saveBabyName(event.name);
}

void _saveBirthDate(SaveBirthDateEvent event, Emitter<BaseState> emit) async {
  emit(StartToChangeBabyInformation());
  await getIt<CacheData>().saveBirthDate(event.time ?? DateTime.now());
  emit(SavedBirthDateSuccessful());
}

void _saveLastPeriod(SaveLastPriodEvent event, Emitter<BaseState> emit) async {
  emit(StartToChangeBabyInformation());
  DateTime lastPeriod = event.time ?? DateTime.now();
  await getIt<CacheData>().saveBirthDate(lastPeriod.convertFromLastPeriodToBirthDate());
  print('lastPeriod $lastPeriod');
  emit(SavedBirthDateSuccessful());
}