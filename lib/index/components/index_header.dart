import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/app_colors.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/index/model/index_model.dart';

class IndexHeader extends BaseStatefulWidget {
  const IndexHeader({super.key});

  @override
  State<IndexHeader> createState() => _IndexRowState();
}

class _IndexRowState extends BaseStatefulState<IndexHeader> {

  @override
  Widget? buildBody() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: 60,
              alignment: Alignment.center,
              child: const Text("Tuần").w500().text14().center(),
            )
        ),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: 60,
              child: const Text('BPD(mm)').w500().text14().center(),
            )
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text('FL(mm)').w500().text14().center(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 60,
            child: const Text('EFW(g)').w500().text14().center(),
          ),
        ),
      ],
    );
  }
}