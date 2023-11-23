import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/home/model/baby.dart';
import 'package:pregnancy_flutter/local/cache.dart';
import 'package:pregnancy_flutter/routes/route_name.dart';
import 'package:pregnancy_flutter/routes/routes.dart';
import 'app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppModule.init();
  runApp(const PregnancyApp());
}

class PregnancyApp extends StatelessWidget {
  const PregnancyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Routes.instance.navigatorKey,
      themeMode: ThemeMode.light,
      onGenerateRoute: Routes.generateRoute,
      builder: (context, child) => MediaQuery(
          data:
          MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!),
      initialRoute: _generateFirstScreen(),
    );
  }

  String _generateFirstScreen() {
    Baby? baby = getIt<CacheData>().getBaby;
    return baby != null ? RoutesName.babyInformation : RoutesName.tabBarRoute;
  }
}
