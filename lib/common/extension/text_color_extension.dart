import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension FontWeightExtension on TextStyle? {
  TextStyle mainColor() {
    return TextStyle(
        fontWeight: this?.fontWeight,
        fontSize: this?.fontSize,
        color:  Colors.green,
        overflow: this?.overflow
    );
  }

  TextStyle blackColor() {
    return TextStyle(
        fontWeight: this?.fontWeight,
        fontSize: this?.fontSize,
        color:  Colors.black,
        overflow: this?.overflow
    );
  }

  TextStyle whiteColor() {
    return TextStyle(
        fontWeight: this?.fontWeight,
        fontSize: this?.fontSize,
        color:  Colors.white,
        overflow: this?.overflow
    );
  }

  TextStyle greyColor() {
    return TextStyle(
        fontWeight: this?.fontWeight,
        fontSize: this?.fontSize,
        color:  Colors.grey,
        overflow: this?.overflow
    );
  }

  TextStyle customColor(Color? color) {
    return TextStyle(
        fontWeight: this?.fontWeight,
        fontSize: this?.fontSize,
        color:  color,
        overflow: this?.overflow
    );
  }
}
