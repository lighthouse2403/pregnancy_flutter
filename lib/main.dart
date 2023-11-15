import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/home/home.dart';
import 'app_module.dart';

void main() async {
  await AppModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
