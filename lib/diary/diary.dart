import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/home/components/heart_indicator.dart';

class Diary extends BaseStatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends BaseStatefulState<Diary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      title: const Text('Nhật ký').w700().text18().whiteColor(),
    );
  }

  @override
  Widget? buildBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 260.0,
            child: HeartIndicator(),
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
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 80.0),
        )
      ],
    );
  }

  Widget _homeItem(int index) {
    return InkWell(
      child: Column(
        children: [
          Text(Constants.homeItems[index].title)
        ],
      ),
    );
  }

  Widget _babyInformationRow(int index) {
    String title;
    String content;
    switch (index){
      case 0:
        title = 'Mẹ bầu:';
        break;
      case 1:
        title = 'Mẹ bầu:';
        break;
      case 2:
        title = 'Mẹ bầu:';
        break;
      default:
        break;
    }

    return Row(
      children: [
        Text('Tuổi thai:').w500().text14().greyColor(),
        Text('30 tuần 2 ngày').w500().text14().greyColor(),
      ],
    );
  }
}