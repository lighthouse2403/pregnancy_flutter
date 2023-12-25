import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/constants/app_colors.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  List<Widget>? actions = [];
  Widget? leading;

  BaseAppBar({required this.title, this.actions, this.leading, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? '').w600().text18().whiteColor().ellipsis(),
      backgroundColor: AppColors.mainColor,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}