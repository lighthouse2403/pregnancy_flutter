import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/extension/font_size_extension.dart';
import 'package:pregnancy_flutter/common/extension/font_weight_extension.dart';
import 'package:pregnancy_flutter/common/extension/text_color_extension.dart';


extension TextExtension on Text? {
  /// Setup color for text
  Text customColor(Color? color) {
    return Text(this?.data ?? '', style: this?.style?.customColor(color), textAlign: this?.textAlign);
  }

  Text greyColor() {
    return Text(this?.data ?? '', style: this?.style?.greyColor(), textAlign: this?.textAlign);
  }

  Text whiteColor() {
    return Text(this?.data ?? '', style: this?.style?.whiteColor(), textAlign: this?.textAlign);
  }

  Text blackColor() {
    return Text(this?.data ?? '', style: this?.style?.blackColor(), textAlign: this?.textAlign);
  }

  /// Setup font weight for text
  Text w400() {
    return Text(this?.data ?? '', style: this?.style?.textW400(), textAlign: this?.textAlign);
  }

  Text w500() {
    return Text(this?.data ?? '', style: this?.style.textW500());
  }

  Text w600() {
    return Text(this?.data ?? '', style: this?.style.textW600(), textAlign: this?.textAlign);
  }

  Text w700() {
    return Text(this?.data ?? '', style: this?.style.textW700(), textAlign: this?.textAlign);
  }

  Text w800() {
    return Text(this?.data ?? '', style: this?.style.textW800(), textAlign: this?.textAlign);
  }

  Text customWeight(FontWeight? weight) {
    return Text(this?.data ?? '', style: this?.style?.customWeight(weight), textAlign: this?.textAlign);
  }

  /// Setup font size for text

  Text text8() {
    return Text(this?.data ?? '', style: this?.style?.text8(), textAlign: this?.textAlign);
  }

  Text text10() {
    return Text(this?.data ?? '', style: this?.style.text10(), textAlign: this?.textAlign);
  }

  Text text12() {
    return Text(this?.data ?? '', style: this?.style.text12(), textAlign: this?.textAlign);
  }

  Text text13() {
    return Text(this?.data ?? '', style: this?.style.text13(), textAlign: this?.textAlign);
  }

  Text text14() {
    return Text(this?.data ?? '', style: this?.style.text14(), textAlign: this?.textAlign);
  }

  Text text15() {
    return Text(this?.data ?? '', style: this?.style.text15(), textAlign: this?.textAlign);
  }

  Text text16() {
    return Text(this?.data ?? '', style: this?.style.text16(), textAlign: this?.textAlign);
  }

  Text text17() {
    return Text(this?.data ?? '', style: this?.style.text17(), textAlign: this?.textAlign);
  }

  Text text18() {
    return Text(this?.data ?? '', style: this?.style.text18(), textAlign: this?.textAlign);
  }

  Text text20() {
    return Text(this?.data ?? '', style: this?.style.text20(), textAlign: this?.textAlign);
  }

  Text customSize(double size) {
    return Text(this?.data ?? '', style: this?.style?.customSize(size), textAlign: this?.textAlign);
  }

  /// Setup textEllipsis
  Text ellipsis() {
    return Text(this?.data ?? '', style: this?.style.textEllipsis(), textAlign: this?.textAlign, maxLines: 1);
  }

  Text clip() {
    return Text(this?.data ?? '', style: this?.style.textClip(), textAlign: this?.textAlign);
  }

  Text customHeight(double height) {
    return Text(this?.data ?? '', style: this?.style?.customHeight(height), textAlign: this?.textAlign);
  }

  /// Setup allignment
  Text center() {
    return Text(this?.data ?? '', style: this?.style, textAlign: TextAlign.center);
  }

  Text left() {
    return Text(this?.data ?? '', style: this?.style, textAlign: TextAlign.left);
  }
}