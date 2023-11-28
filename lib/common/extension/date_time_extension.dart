import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String _dateFormat(String dateFormat) {
    const locale = 'vi';
    return DateFormat(dateFormat, locale).format(this);
  }

  String globalDateFormat(BuildContext context) {
    String dateFormat = 'dd-MM-yyyy';
    return _dateFormat(dateFormat);
  }
}
