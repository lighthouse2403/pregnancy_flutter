import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_flutter/app_module.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/date_time_extension.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/home/components/heart_indicator.dart';
import 'package:pregnancy_flutter/home/components/home_item.dart';
import 'package:pregnancy_flutter/local/cache.dart';
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
                    height: 260.0,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        HeartIndicator(),
                        const SizedBox(width: 20),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _babyInformationRow(0),
                                const SizedBox(height: 20),
                                _babyInformationRow(1),
                                const SizedBox(height: 20),
                                _babyInformationRow(2),
                                const SizedBox(height: 20),
                                _babyInformationRow(3),
                                const SizedBox(height: 20),
                                _babyInformationRow(4),
                              ],
                            )
                        ),
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
                  return HomeItem(index: index);
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

  Widget _babyInformationRow(int index) {
    String title = '';
    String content = '-';
    DateTime birthDate = getIt<CacheData>().getBirthDate ?? DateTime.now();
    CacheData cache = getIt<CacheData>();
    String motherName = cache.getMotherName ?? '';
    String babyName = cache.getBabyName ?? '';

    switch (index){
      case 0:
        title = 'Mẹ bầu:';
        content = motherName.isNotEmpty ? motherName : '-';
        break;
      case 1:
        title = 'Bé yêu:';
        content = babyName.isNotEmpty ? babyName : '-';
        break;
      case 2:
        title = 'Dự sinh:';
        content = birthDate.globalDateFormat(context);
        break;
      case 3:
        title = 'Tuổi thai:';
        int babyAge = birthDate.convertFromBirthDateToBabyAge();
        content = '${babyAge~/7} tuần ${babyAge%7} ngày';
        break;
      case 4:
        title = 'Ngày còn lại:';
        int remainDays = birthDate.convertFromBirthDateToRemainDay();

        content = '$remainDays ngày';
        content = remainDays == 0 ? 'Ngày dự sinh' : content;
        content = remainDays < 0 ? 'Quá ${remainDays.abs()} ngày' : content;

        break;
      case 5:
        title = 'Kỳ kinh cuối:';
        DateTime lastPeriod = birthDate.convertFromBirthDateToLastPeriod();
        content = lastPeriod.globalDateFormat(context);
        break;
      default:
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title).w400().text16().primaryTextColor().ellipsis(),
        Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(content).w600().text16().primaryTextColor().ellipsis(),
            )
        ),
      ],
    );
  }
}