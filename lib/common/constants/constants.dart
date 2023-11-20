import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/bottom_tab_bar/bottom_tab_bar_item.dart';
import 'package:pregnancy_flutter/common/constants/models/homeItem.dart';

class Constants {
  static List<HomeItem> homeItems = [
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Góc chia sẻ'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Số lần đạp'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Cân nặng'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Kiến thức'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Âm nhạc'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Danh sách bác sỹ'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Đồ sơ sinh'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Tên hay'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Địa chỉ phòng tiêm'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Nhắc nhở'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Ứng dụng chu kỳ kinh'),
    HomeItem(Assets.icons.diary.svg(width: 30, height: 30), 'Nhóm thảo luận'),
  ];

  static List<BottomTabBarItem> bottomTabBarItems = [
    BottomTabBarItem(Assets.icons.home.svg(width: 16, height: 16), 'Trang chủ'),
    BottomTabBarItem(Assets.icons.baby.svg(width: 16, height: 16), 'Thai kỳ'),
    BottomTabBarItem(Assets.icons.diary.svg(width: 16, height: 16), 'Nhật ký'),
    BottomTabBarItem(Assets.icons.weight.svg(width: 16, height: 16), 'Chỉ số'),
    BottomTabBarItem(Assets.icons.calendar.svg(width: 16, height: 16), 'Lịch'),
  ];
}