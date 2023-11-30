import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/bottom_tab_bar/bottom_tab_bar_item.dart';
import 'package:pregnancy_flutter/common/constants/models/homeItem.dart';

class Constants {
  static List<HomeItem> homeItems = [
    HomeItem(Assets.icons.chat.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Góc chia sẻ'),
    HomeItem(Assets.icons.babyKick.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Số lần đạp'),
    HomeItem(Assets.icons.weight.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Cân nặng'),
    HomeItem(Assets.icons.knowledge.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Kiến thức'),
    HomeItem(Assets.icons.music.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Âm nhạc'),
    HomeItem(Assets.icons.clinic.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Danh sách bác sỹ'),
    HomeItem(Assets.icons.babyClothes.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Đồ sơ sinh'),
    HomeItem(Assets.icons.babyName.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Tên hay'),
    HomeItem(Assets.icons.injection.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Địa chỉ phòng tiêm'),
    HomeItem(Assets.icons.alarm.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Nhắc nhở'),
    HomeItem(Assets.icons.diary.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)),
        'Ứng dụng chu kỳ kinh'),
    HomeItem(Assets.icons.group.svg(width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
            Constants.pinkTextColor(), BlendMode.srcIn)), 'Nhóm thảo luận'),
  ];

  static List<BottomTabBarItem> bottomTabBarItems = [
    BottomTabBarItem(Assets.icons.home, 'Trang chủ'),
    BottomTabBarItem(Assets.icons.baby, 'Thai kỳ'),
    BottomTabBarItem(Assets.icons.diary, 'Nhật ký'),
    BottomTabBarItem(Assets.icons.weight, 'Chỉ số'),
    BottomTabBarItem(Assets.icons.calendar, 'Lịch'),
  ];

  /// Color
  static Color mainColor() {
    return const Color(0xFF47AC66);
  }

  static Color pinkTextColor() {
    return const Color(0xFFFF66A3);
  }

  static Color primaryTextColor() {
    return const Color(0xFF0B0B1E);
  }

  static Color secondaryTextColor() {
    return const Color(0xFFA3A3AC);
  }

  /// Spacer
  static Widget vSpacer2 = const SizedBox(height: 2);
  static Widget vSpacer4 = const SizedBox(height: 4);
  static Widget vSpacer6 = const SizedBox(height: 6);
  static Widget vSpacer8 = const SizedBox(height: 8);
  static Widget vSpacer10 = const SizedBox(height: 10);
  static Widget vSpacer12 = const SizedBox(height: 12);
  static Widget vSpacer16 = const SizedBox(height: 16);
  static Widget vSpacer20 = const SizedBox(height: 20);

  static Widget hSpacer2 = const SizedBox(width: 2);
  static Widget hSpacer4 = const SizedBox(width: 4);
  static Widget hSpacer6 = const SizedBox(width: 6);
  static Widget hSpacer8 = const SizedBox(width: 8);
  static Widget hSpacer10 = const SizedBox(width: 10);
  static Widget hSpacer12 = const SizedBox(width: 12);
  static Widget hSpacer16 = const SizedBox(width: 16);
  static Widget hSpacer20 = const SizedBox(width: 20);
  ///Border

  static const double marginEdge = 16;
  static const double radius = 8;
  static const double dividerHeight = 1;
  static const double borderWidth = 1;
}