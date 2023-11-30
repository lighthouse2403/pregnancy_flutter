import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_flutter/_gen/assets.gen.dart';
import 'package:pregnancy_flutter/app_module.dart';
import 'package:pregnancy_flutter/baby_information/bloc/baby_information_bloc.dart';
import 'package:pregnancy_flutter/baby_information/bloc/baby_information_event.dart';
import 'package:pregnancy_flutter/baby_information/bloc/baby_information_state.dart';
import 'package:pregnancy_flutter/common/Widgets/customTextField.dart';
import 'package:pregnancy_flutter/common/Widgets/custom_button.dart';
import 'package:pregnancy_flutter/common/base/base_statefull_widget.dart';
import 'package:pregnancy_flutter/common/base/bloc/base_state.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/date_time_extension.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/common/widgets/baby_age_bottom_sheet.dart';
import 'package:pregnancy_flutter/common/widgets/date_picker/date_picker_2.dart';
import 'package:pregnancy_flutter/local/cache.dart';
import 'package:pregnancy_flutter/routes/routes.dart';

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
    // TODO: implement buildAppBar
    return AppBar(
      backgroundColor: Constants.mainColor(),
      leading: InkWell(
        onTap: () => Routes.instance.pop(),
        child: Align(
          alignment: Alignment.center,
          child: Assets.icons.arrowBack.svg(width: 24, height: 24),
        ),
      ),
      title: const Text('Thông tin bé yêu').w600().text18().whiteColor(),
    );
  }

  @override
  Widget? buildBody() {
    return BlocProvider(
      create: (context) => babyInformationBloc,
      child: BlocListener<BabyInformationBloc, BaseState>(
        listener: (context, state) {
          if (state is SavedBirthDateSuccessful) {
            setState(() {
            });
          }
        },
        child: Container(
          alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pregnancy_backgroound_3.jpg'),
                  fit: BoxFit.cover),
            ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _inputRow(0),
                  Constants.vSpacer10,
                  _inputRow(1),
                  Constants.vSpacer10,
                  _generateBirthDateRow(),
                  Constants.vSpacer10,
                  _babyAge(),
                  Constants.vSpacer10,
                  _generateLastPeriod(),
                ],
              ),
            ),
          ),
        )
      )
    );
  }

  Widget _inputRow(int index) {
    String title = index == 0 ? 'Mẹ bầu:' : 'Bé yêu:';
    TextEditingController? controller = index == 0 ? motherNameController : babyNameController;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).w400().text15().primaryTextColor().left(),
        Constants.vSpacer4,
        CustomTextField(
          controller: controller,
          enable: true,
          onTextChanged: (value) {
            if (index == 0) {
              babyInformationBloc.add(SaveMotherNameEvent(value));
            } else {
              babyInformationBloc.add(SaveBabyNameEvent(value));
            }
          },
        )
      ],
    );
  }

  Widget _generateBirthDateRow() {
    DateTime birthDate = getIt<CacheData>().getBirthDate ?? DateTime.now();
    return _dateRow(birthDate, 'Dự sinh:');
  }

  Widget _generateLastPeriod() {
    DateTime birthDate = getIt<CacheData>().getBirthDate ?? DateTime.now();
    DateTime lastPeriod = birthDate.convertFromBirthDateToLastPeriod();
    return _dateRow(lastPeriod, 'Kỳ kinh cuối:');
  }

  Widget _dateRow(DateTime currentDate, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title).w400().text15().primaryTextColor().left(),
        CustomButton(
          horizontalPadding: 0,
          titleAlignment: Alignment.centerLeft,
          title: currentDate.globalDateFormat(context),
          onTappedAction: () async {
            final date = await showDatePicker2(
              context: context,
              initialDate: currentDate,
              firstDate: DateTime(DateTime.now().year - 1),
              currentDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 2),
              cancelText: 'Huỷ',
              confirmText: 'Xong',
            );

            if (title == 'Dự sinh:') {
              babyInformationBloc.add(SaveBirthDateEvent(date));
            } else {
              babyInformationBloc.add(SaveLastPriodEvent(date));
            }
          },
        )
      ],
    );
  }

  Widget _babyAge() {
    DateTime birthDate = getIt<CacheData>().getBirthDate ?? DateTime.now();
    int babyAge = birthDate.convertFromBirthDateToBabyAge();

    print(babyAge~/7);
    return Row(
      children: [
        const Text('Tuổi thai').w400().text15().primaryTextColor().left(),
        Constants.hSpacer10,
        CustomButton(
          title: '${babyAge~/7} tuần ${babyAge%7} ngày',
          onTappedAction: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return BabyAgeWidget(40, 7, (birthDate) {
                  babyInformationBloc.add(SaveBirthDateEvent(birthDate));
                });
              },
            );
          },
        )
      ],
    );
  }
}