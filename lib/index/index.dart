import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/base/base_app_bar.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/home/components/heart_indicator.dart';

class Index extends BaseStatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends BaseStatefulState<Index> {
  @override
  PreferredSizeWidget? buildAppBar() {
    return BaseAppBar(
      title: 'Chỉ số thai nhi',
    );
  }

  @override
  Widget? buildBody() {
    return Column(
      children: [
        _header(),
        Expanded(
            child: _indexList()
        )
      ],
    );
  }

  Widget _header() {
    return Container(
      height: 60,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text("Tuổi thai").center()
          ),
          Expanded(
              flex: 1,
              child: Text("Tuổi thai").center()
          ),
          Expanded(
              flex: 1,
              child: Text("Tuổi thai").center()
          ),
          Expanded(
              flex: 1,
              child: Text("Tuổi thai").center()
          )
        ],
      ),
    );
  }

  Widget _indexList() {
    return ListView.builder(
        itemCount: 40,
        itemBuilder: (context, index) {
          return Container(
            height: 44,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text("20").center()
                ),
                Expanded(
                    flex: 1,
                    child: Text("20").center()
                ),
                Expanded(
                    flex: 1,
                    child: Text("20").center()
                ),
                Expanded(
                    flex: 1,
                    child: Text("20").center()
                )
              ],
            ),
          );
        }
    );
  }
}