import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
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
            childCount: 10,
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
          Text('Item')
        ],
      ),
    );
  }

  Widget _babyInformationRow() {
    return Row(
      children: [
        Text('Tuổi thai:').w500().text14().greyColor(),
        Text('30 tuần 2 ngày').w500().text14().greyColor(),
      ],
    );
  }
}