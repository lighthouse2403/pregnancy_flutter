import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/common/Widgets/customTextField.dart';
import 'package:pregnancy_flutter/common/Widgets/custom_button.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/home/model/baby.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

class BabyInformation extends BaseStatefulWidget {
  const BabyInformation({super.key});

  @override
  State<BabyInformation> createState() => _BabyInformationState();
}

class _BabyInformationState extends BaseStatefulState<BabyInformation> {

  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      backgroundColor: Constants.mainColor(),
      title: Text('Soc-Tho').w700().text18().whiteColor(),
    );
  }

  @override
  Widget? buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _babyInformationRow(0),
            Constants.vSpacer10,
            _babyInformationRow(1),
            Constants.vSpacer10,
            _babyInformationRow(2),
            Constants.vSpacer10,
            _babyInformationRow(3),
            Constants.vSpacer10,
            _babyInformationRow(4),
            Constants.vSpacer10,
            _babyInformationRow(5),
          ],
        ),
      ),
    );
  }

  Baby _generateBabyInformation() {
    return Baby();
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).w400().text15().primaryTextColor().left(),
        Constants.vSpacer10,
        CustomTextField(
          enable: true,
        )
      ],
    );
  }
}