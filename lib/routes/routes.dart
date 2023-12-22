import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/baby_information/baby_information.dart';
import 'package:pregnancy_flutter/bottom_tab_bar/bottom_tab_bar.dart';
import 'package:pregnancy_flutter/chat/chat.dart';
import 'package:pregnancy_flutter/chat/child_widget/chat_detail.dart';
import 'package:pregnancy_flutter/chat/thread_model.dart';
import 'package:pregnancy_flutter/doctor/doctor.dart';
import 'package:pregnancy_flutter/doctor/doctor_detail.dart';
import 'package:pregnancy_flutter/doctor/doctor_model.dart';
import 'package:pregnancy_flutter/routes/route_name.dart';
import 'package:pregnancy_flutter/vaccination/vaccination.dart';

class Routes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Routes() => _instance;

  Routes._internal();

  static final Routes _instance = Routes._internal();

  static Routes get instance => _instance;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToWithoutDuplicate(String routeName,
      {dynamic arguments}) async {
    if (navigatorKey.currentState?.currentRouteName == routeName) {
      return null;
    }
    return navigateTo(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
          (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndReplaceName(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  dynamic pop({dynamic result}) {
    return navigatorKey.currentState?.pop(result);
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    String routeName = settings.name ?? '';
    switch (routeName) {
      case RoutesName.babyInformation:
        return _pageRoute(page: const BabyInformation(), setting: settings);
      case RoutesName.tabBarRoute:
        return _pageRoute(page: const MainBottomTabBar(), setting: settings);
      case RoutesName.chat:
        return _pageRoute(page: const Chat(), setting: settings);
      case RoutesName.chatDetail:
        ThreadModel thread = settings.arguments as ThreadModel;
        return _pageRoute(page: ChatDetail(thread: thread), setting: settings);
      case RoutesName.doctor:
        return _pageRoute(page: const Doctor(), setting: settings);
      case RoutesName.doctorDetail:
        DoctorModel doctor = settings.arguments as DoctorModel;
        return _pageRoute(page: DoctorDetail(doctor: doctor), setting: settings);
      case RoutesName.vaccination:
        return _pageRoute(page: const Vaccination(), setting: settings);
      default:
        return null;
    }
  }

  static MaterialPageRoute _pageRoute({
    RouteSettings? setting,
    required Widget page
  }) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings:
      RouteSettings(arguments: setting?.arguments, name: setting?.name),
    );
  }
}

extension NavigatorStateX on NavigatorState {
  String? get currentRouteName {
    String? currentPath;
    popUntil((route) {
      currentPath = route.settings.name;
      return true;
    });
    return currentPath;
  }
}
