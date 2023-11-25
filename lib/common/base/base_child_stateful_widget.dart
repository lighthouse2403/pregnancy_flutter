import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/app_module.dart';
import 'package:pregnancy_flutter/local/cache.dart';

class BaseChildStatefulWidget extends StatefulWidget {
  const BaseChildStatefulWidget({super.key});

  @override
  State<StatefulWidget> createState() => BaseChildStatefulState<BaseChildStatefulWidget>();
}

class BaseChildStatefulState<T extends StatefulWidget> extends State<T> {
  late double screenWidth;
  CacheData cache = getIt<CacheData>();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return buildBody() ?? Container();
  }

  Widget? buildBody() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

