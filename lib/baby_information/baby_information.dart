import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/baby_information/bloc/baby_information_bloc.dart';
import 'package:pregnancy_flutter/baby_information/bloc/baby_information_event.dart';
import 'package:pregnancy_flutter/common/Widgets/customTextField.dart';
import 'package:pregnancy_flutter/common/Widgets/custom_button.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/common/widgets/date_picker/date_picker_2.dart';
import 'package:pregnancy_flutter/common/widgets/date_picker/time_picker.dart';
import 'package:pregnancy_flutter/home/model/baby.dart';

class BabyInformation extends BaseStatefulWidget {
  const BabyInformation({super.key});

  @override
  State<BabyInformation> createState() => _BabyInformationState();
}

class _BabyInformationState extends BaseStatefulState<BabyInformation> {
  TextEditingController motherNameController = TextEditingController();
  TextEditingController babyNameController = TextEditingController();

  BabyInformationBloc babyInformationBloc = BabyInformationBloc();
  @override
  PreferredSizeWidget? buildAppBar() {
    return AppBar(
      backgroundColor: Constants.mainColor(),
      title: Text('Soc-Tho').w700().text18().whiteColor(),
    );
  }

  @override
  Widget? buildBody() {
    return BlocProvider(
      create: (context) => babyInformationBloc,
      child: SingleChildScrollView(
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
      )
    );
  }

  Baby _generateBabyInformation() {
    return Baby();
  }

  Widget _babyInformationRow(int index) {
    Widget valueWidget = Container();
    String title = '';
    switch (index) {
      case 0:
        title = 'Mẹ bầu:';
        valueWidget = _inputRow(index);
        break;
      case 1:
        title = 'Bé yêu:';
        valueWidget = _inputRow(index);
        break;
      case 2:
        title = 'Dự sinh:';
        valueWidget = _dateRow(index);
        break;
      case 3:
        title = 'Tuổi thai:';
        valueWidget = _durationRow(index);
        break;
      case 4:
        title = 'Kỳ kinh cuối:';
        valueWidget = _dateRow(index);
        break;
      default:
        valueWidget = Container();
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).w400().text15().primaryTextColor().left(),
        Constants.vSpacer10,
        valueWidget
      ],
    );
  }

  Widget _inputRow(int index) {
    TextEditingController? controller = index == 0 ? motherNameController : babyNameController;
    return CustomTextField(
      controller: controller,
      enable: true,
      onTextChanged: (value) {
        if (index == 0) {
          babyInformationBloc.add(SaveMotherNameEvent(value));
        } else {
          babyInformationBloc.add(SaveBabyNameEvent(value));
        }
      },
    );
  }

  Widget _dateRow(int index) {
    return CustomButton(
      title: '-',
      onTappedAction: () async {
        final date = await showDatePicker2(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          currentDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 2),
        );

      },
    );
  }

  Widget _durationRow(int index) {
    return CustomButton(
      title: '-',
      onTappedAction: () {

      },
    );
  }
}