import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnancy_flutter/app_module.dart';
import 'package:pregnancy_flutter/common/Widgets/custom_button.dart';
import 'package:pregnancy_flutter/common/constants/constants.dart';
import 'package:pregnancy_flutter/common/extension/date_time_extension.dart';
import 'package:pregnancy_flutter/common/extension/text_extension.dart';
import 'package:pregnancy_flutter/local/cache.dart';

class BabyAgeWidget extends StatefulWidget {
      final int weeks;
      final int days;
      final Function(DateTime) onChangeBirthDate;

      const BabyAgeWidget(this.weeks, this.days, this.onChangeBirthDate, {super.key});

  @override
  State<StatefulWidget> createState() => _BabyAgeState();
}

class _BabyAgeState extends State<BabyAgeWidget> {

  late final FixedExtentScrollController weekScrollController;
  late final FixedExtentScrollController dayScrollController;

  @override
  void initState() {
    DateTime birthDate = getIt<CacheData>().getBirthDate ?? DateTime.now();
    int babyAge = birthDate.convertFromBirthDateToBabyAge();
    weekScrollController = FixedExtentScrollController(initialItem: babyAge~/7);
    dayScrollController = FixedExtentScrollController(initialItem: babyAge%7);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        color: Colors.white,
      ),
      height: 300,
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Constants.vSpacer16,
              const Text('Tuổi thai').w700().text18().blackColor(),
              Constants.vSpacer16,
              Expanded(
                child: _pickerRow(),
              ),
              _actionRow(),
            ],
          ),
        )
    );
  }

  Widget _pickerRow() {

    return Row(
      children: [
        Expanded(
            child: CupertinoPicker(
              scrollController: weekScrollController,
              itemExtent: 50,
              onSelectedItemChanged: (int index) {
                print('selected index: ${index}');
              },
              children: List.generate(widget.weeks, (int index) {
                return Center(
                  child: Text('${index} tuần'),
                );
              }),
            )
        ),
        Expanded(
            child: CupertinoPicker(
              scrollController: dayScrollController,
              itemExtent: 50,
              onSelectedItemChanged: (int index) {
                print('selected index: ${index}');
              },
              children: List.generate(widget.days, (int index) {
                return Center(
                    child: Text('${index} ngày'),
                  );
                }
              ),
            ),
        )
      ],
    );
  }

  Widget _actionRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            titleColor: Colors.white.withOpacity(0.6),
            backgroundColor: Constants.secondaryTextColor().withOpacity(0.5),
            title: 'Đóng',
            onTappedAction: () {
              Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomButton(
            titleColor: Colors.white,
            backgroundColor: Constants.mainColor(),
            title: 'Xong',
            onTappedAction: () {
              int durationDays = (weekScrollController.selectedItem * 7) + dayScrollController.selectedItem;
              widget.onChangeBirthDate(DateTime.now().subtract(Duration(days: durationDays)));
              Navigator.pop(context);
            },
          ),
        ),
        Constants.hSpacer10,
      ],
    );
  }
}
