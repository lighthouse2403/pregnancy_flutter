import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/home/components/heart_indicator.dart';
import 'package:pregnancy_flutter/routes/route_name.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class Home extends BaseStatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BaseStatefulState<Home> {

  @override
  void initState() {
    super.initState();
    readJson();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/json/doctor.json');
    final data = await json.decode(response);
  }

  @override
  Widget? buildBody() {
    return InkWell(
      onTap: () => Routes.instance.navigateTo(RoutesName.babyInformation),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/pregnancy_backgroound_3.jpg'),
              fit: BoxFit.fill),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SafeArea(
                child: Container(
                    height: 180.0,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        HeartIndicator(),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _babyInformationRow(0),
                            const SizedBox(height: 16),
                            _babyInformationRow(1),
                            const SizedBox(height: 16),
                            _babyInformationRow(2),
                            const SizedBox(height: 16),
                            _babyInformationRow(3),
                            const SizedBox(height: 16),
                            _babyInformationRow(4),
                          ],
                        )
                      ],
                    )
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return _homeItem(index);
                },
                childCount: Constants.homeItems.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _homeItem(int index) {
    return InkWell(
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
              Constants.homeItems[index].icon,
              const SizedBox(height: 10),
              Text(Constants.homeItems[index].title).w400().text14().primaryTextColor().center()
            ],
          ),
        ),
      ),
    );
  }

  Widget _babyInformationRow(int index) {
    String title = '';
    String content = '-';
    switch (index){
      case 0:
        title = 'Mẹ bầu:';
        break;
      case 1:
        title = 'Bé yêu:';
        break;
      case 2:
        title = 'Dự sinh:';
        break;
      case 3:
        title = 'Tuổi thai:';
        break;
      case 4:
        title = 'Ngày còn lại:';
        break;
      case 5:
        title = 'Kỳ kinh cuối:';
        break;
      default:
        break;
    }

    return Row(
      children: [
        Text(title).w600().text16().primaryTextColor(),
        const SizedBox(width: 16),
        Text(content).w500().text14().greyColor(),
      ],
    );
  }
}