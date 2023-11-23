import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/calendar/calendar.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/font_size_extension.dart';
import 'package:pregnancy_flutter/common/extension/font_weight_extension.dart';
import 'package:pregnancy_flutter/common/extension/text_color_extension.dart';
import 'package:pregnancy_flutter/diary/diary.dart';
import 'package:pregnancy_flutter/home/home.dart';
import 'package:pregnancy_flutter/index/index.dart';
import 'package:pregnancy_flutter/pregnancy/pregnancy.dart';

class MainBottomTabBar extends StatefulWidget {
  const MainBottomTabBar({super.key});

  @override
  State<MainBottomTabBar> createState() => MainBottomTabBarState();
}

class MainBottomTabBarState extends State<MainBottomTabBar> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    const Home(),
    const Pregnancy(),
    const Diary(),
    const Index(),
    const Calendar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: tabs[selectedIndex]
        // IndexedStack(
        //   index: selectedIndex,
        //   children: tabs,
        // ),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        items: tabs.map((e) => _generateItem(tabs.indexOf(e))).toList(),
        currentIndex: selectedIndex,
        unselectedLabelStyle: const TextStyle().greyColor().text12().textW600(),
        selectedLabelStyle: const TextStyle().mainColor().text12().textW600(),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  /// Generate item colors
  Color _generateItemColor(int index) {
    Color itemColor = selectedIndex == index ? Colors.green : Colors.grey;
    return itemColor;
  }

  /// Generate item text style
  TextStyle _generateTextStyle(int index) {
    Color labelColor = _generateItemColor(index);
    return TextStyle(color: labelColor).textW600().text12();
  }

  /// Generate icon for each item
  Widget _generateIcon(int index) {
    Widget icon = Constants.bottomTabBarItems[index].icon.svg(
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(_generateItemColor(index), BlendMode.srcIn));
    return Column(
      children: [
        icon,
        Text(
          Constants.bottomTabBarItems[index].title,
          style: _generateTextStyle(index),
        )
      ],
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  BottomNavigationBarItem _generateItem(int index) {
    return BottomNavigationBarItem(
      icon: _generateIcon(index),
      label: '',
    );
  }
}