import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pregnancy_flutter/data/cache.dart';
import 'package:pregnancy_flutter/home/model/baby.dart';

GetIt getIt = GetIt.instance;

class AppModule {
  AppModule._();

  static const _boxSettings = 'box_settings';

  static Future init() async {
    Hive.registerAdapter(BabyAdapter());

    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    await _provideCacheDataModule();
  }

  static Future _provideCacheDataModule() async {
    try {
      final Box<dynamic> boxSettings = await Hive.openBox(_boxSettings);
      getIt.registerSingleton<CacheData>(CacheDataImplement(boxSettings));
    } catch (error) {
      if (error.runtimeType == RangeError) {
        Hive.deleteBoxFromDisk(_boxSettings);
        final Box<dynamic> boxSettings = await Hive.openBox(_boxSettings);
        getIt.registerSingleton<CacheData>(CacheDataImplement(boxSettings));
      }
    }
  }
}
