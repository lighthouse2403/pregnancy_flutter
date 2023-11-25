import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/home/components/src/liquid_custom_progress_indicator.dart';

class HeartIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _HeartIndicatorState();
}

class _HeartIndicatorState extends State<HeartIndicator> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LiquidCustomProgressIndicator(
        value: 0.4,
        direction: Axis.vertical,
        backgroundColor: Constants.secondaryTextColor().withOpacity(0.5),
        valueColor: AlwaysStoppedAnimation(Constants.pinkTextColor()),
        shapePath: _buildHeartPath(),
        center: Text("40%").w600().primaryTextColor().text20(),
      ),
    );
  }

  Path _buildHeartPath() {
    return Path()
      ..moveTo(55, 15)
      ..cubicTo(55, 12, 50, 0, 30, 0)
      ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
      ..cubicTo(0, 55, 20, 77, 55, 95)
      ..cubicTo(90, 77, 110, 55, 110, 37.5)
      ..cubicTo(110, 37.5, 110, 0, 80, 0)
      ..cubicTo(65, 0, 55, 12, 55, 15)
      ..close();
  }
}
