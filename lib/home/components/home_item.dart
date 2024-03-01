import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/routes/route_name.dart';
import 'package:pregnancy_flutter/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key, required this.index});

  final int index;
  @override
  State<StatefulWidget> createState() =>
      _HomeItemState();
}

class _HomeItemState extends State<HomeItem> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (widget.index) {
          case 0:
              Routes.instance.navigateTo(RoutesName.chat);
            break;
          case 3:
            Routes.instance.navigateTo(RoutesName.knowledge);
            break;
          case 4:
            Routes.instance.navigateTo(RoutesName.audios);
            break;
          case 5:
            Routes.instance.navigateTo(RoutesName.doctor);
            break;
          case 8:
            Routes.instance.navigateTo(RoutesName.vaccination);
            break;
          case 10:
            _redirect();
            break;
            default:
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Constants.homeItems[widget.index].icon,
              const SizedBox(height: 10),
              Text(Constants.homeItems[widget.index].title).w400().text14().primaryTextColor().center()
            ],
          ),
        ),
      ),
    );
  }

  void _redirect() async {
    Uri targetURL = Uri();
    if (Platform.isAndroid) {
      targetURL = Uri.parse("market://details?id=${Constants.androidPeriodTrackerAppId}");
    } else if (Platform.isIOS) {
      targetURL = Uri.parse("itms-apps://itunes.apple.com/app/${Constants.iOSPeriodTrackerAppId}");
    }
    await launchUrl(targetURL);
  }
}
