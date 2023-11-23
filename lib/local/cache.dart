import 'package:hive_flutter/hive_flutter.dart';
import 'package:pregnancy_flutter/home/model/baby.dart';

class CacheKey {
  static String baby = 'baby';
}

abstract class CacheData {
  Baby? get getBaby;

  Future<void> saveBabyInformation(Baby baby);
}

class CacheDataImplement extends CacheData {
  Box _boxSettings;
  CacheDataImplement(this._boxSettings);

  @override
  Future<void> saveBabyInformation(Baby baby) async {
    // TODO: implement saveBabyInformation
    await _boxSettings.put(CacheKey.baby, baby);
  }

  @override
  // TODO: implement getBaby
  Baby? get getBaby => _boxSettings.get(CacheKey.baby);
}