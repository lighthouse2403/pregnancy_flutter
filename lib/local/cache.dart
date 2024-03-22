import 'package:hive_flutter/hive_flutter.dart';

class CacheKey {
  static String motherName = 'mother_name';
  static String babyName = 'baby_name';
  static String birthDate = 'birth_date';
}

abstract class CacheData {

  /// Mother name
  String? get getMotherName;
  Future<void> saveMotherName(String name);

  /// Baby name
  String? get getBabyName;
  Future<void> saveBabyName(String name);

  /// Birth date
  DateTime? get getBirthDate;
  Future<void> saveBirthDate(DateTime time);
}

class CacheDataImplement extends CacheData {
  Box _boxSettings;
  CacheDataImplement(this._boxSettings);

  /// Mother name
  @override
  Future<void> saveMotherName(String name) async {
    await _boxSettings.put(CacheKey.motherName, name);
  }

  @override
  String? get getMotherName => _boxSettings.get(CacheKey.motherName);

  /// Baby name
  @override
  Future<void> saveBabyName(String name) async {
    await _boxSettings.put(CacheKey.babyName, name);
  }

  @override
  String? get getBabyName => _boxSettings.get(CacheKey.babyName);

  /// Birth date
  @override
  Future<void> saveBirthDate(DateTime time) async {
    await _boxSettings.put(CacheKey.birthDate, time);
  }

  @override
  DateTime? get getBirthDate => _boxSettings.get(CacheKey.birthDate);
}