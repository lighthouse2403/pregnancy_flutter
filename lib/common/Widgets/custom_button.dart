import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/base/base_child_stateful_widget.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';

class CustomButton extends BaseChildStatefulWidget {
  CustomButton({super.key, this.backgroundColor, required this.onTappedAction, required this.title, this.titleColor});

  String title;
  Color? backgroundColor;
  Color? titleColor;

  VoidCallback onTappedAction;

  @override
  State<CustomButton> createState() => _DiaryState();
}

class _DiaryState extends BaseChildStatefulState<CustomButton> {

  @override
  Widget? buildBody() {
    return InkWell(
      onTap: widget.onTappedAction,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: widget.backgroundColor
        ),
        child: Text(
          widget.title,
        ).w600().text16().customColor(widget.titleColor),
      ),
    );
  }
}