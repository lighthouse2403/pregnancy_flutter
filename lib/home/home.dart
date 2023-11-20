import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/home/components/heart_indicator.dart';

class Home extends BaseStatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BaseStatefulState<Home> {

  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: Text('Soc-Tho').w700().text18().whiteColor(),
    );
  }

  @override
  Widget? buildBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 260.0,
            child: Row(
              children: [
                HeartIndicator(),
                Column(
                  children: [
                    _babyInformationRow(0),
                    _babyInformationRow(1),
                    _babyInformationRow(2),
                    _babyInformationRow(3),
                    _babyInformationRow(4),
                  ],
                )
              ],
            )
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      ],
    );
  }

  Widget _homeItem(int index) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Constants.homeItems[index].icon,
            Text(Constants.homeItems[index].title).w400().text14().blackColor()
          ],
        ),
      ),
    );
  }

  Widget _babyInformationRow(int index) {
    String title = '';
    String content = '';
    switch (index){
      case 0:
        title = 'Mẹ bầu:';
        break;
      case 1:
        title = 'Bé yêu:';
        break;
      case 2:
        title = 'Ngày sự dinh:';
        break;
      case 3:
        title = 'Tuổi thai:';
        break;
      case 4:
        title = 'Kỳ kinh cuối:';
        break;
      case 5:
        title = 'Ngày còn lại:';
        break;
      default:
        break;
    }

    return Row(
      children: [
        Text(title).w500().text14().greyColor(),
        Text(content).w500().text14().greyColor(),
      ],
    );
  }
}