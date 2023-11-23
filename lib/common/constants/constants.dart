import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/bottom_tab_bar/bottom_tab_bar_item.dart';
import 'package:pregnancy_flutter/common/constants/models/homeItem.dart';

class Constants {
  static List<HomeItem> homeItems = [
    HomeItem(Assets.icons.chat.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Góc chia sẻ'),
    HomeItem(Assets.icons.babyKick.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Số lần đạp'),
    HomeItem(Assets.icons.weight.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Cân nặng'),
    HomeItem(Assets.icons.knowledge.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Kiến thức'),
    HomeItem(Assets.icons.music.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Âm nhạc'),
    HomeItem(Assets.icons.doctors.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Danh sách bác sỹ'),
    HomeItem(Assets.icons.babyClothes.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Đồ sơ sinh'),
    HomeItem(Assets.icons.babyName.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Tên hay'),
    HomeItem(Assets.icons.injection.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Địa chỉ phòng tiêm'),
    HomeItem(Assets.icons.alarm.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Nhắc nhở'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Ứng dụng chu kỳ kinh'),
    HomeItem(Assets.icons.group.svg(width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)), 'Nhóm thảo luận'),
  ];

  static List<BottomTabBarItem> bottomTabBarItems = [
    BottomTabBarItem(Assets.icons.home, 'Trang chủ'),
    BottomTabBarItem(Assets.icons.baby, 'Thai kỳ'),
    BottomTabBarItem(Assets.icons.diary, 'Nhật ký'),
    BottomTabBarItem(Assets.icons.weight, 'Chỉ số'),
    BottomTabBarItem(Assets.icons.calendar, 'Lịch'),
  ];
}