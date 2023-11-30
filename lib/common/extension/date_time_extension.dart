import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String _dateFormat(String dateFormat) {
    return DateFormat(dateFormat).format(this);
  }

  String globalDateFormat(BuildContext context) {
    String dateFormat = 'dd-MM-yyyy';
    return _dateFormat(dateFormat);
  }

  DateTime convertFromBirthDateToLastPeriod() {
    return subtract(const Duration(days: 280));
  }

  int convertFromBirthDateToRemainDay() {
    return (difference(DateTime.now()).inHours / 24).round();
  }

  int convertFromBirthDateToBabyAge() {
    DateTime lastPeriod = convertFromBirthDateToLastPeriod();
    return (DateTime.now().difference(lastPeriod).inHours / 24).round();
  }

  DateTime convertFromLastPeriodToBirthDate() {
    return add(const Duration(days: 280));
  }
}
