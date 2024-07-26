import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonFunctions {
  static Duration getDifferenceFromData({required String fromDate}) {
    var date = DateTime.parse(fromDate);
    var currentDate = DateTime.now();
    return date.difference(currentDate);
  }

  static String changeDateFormatToLocal(
      {required String date, String outputFormat = "dd MMM yyyy"}) {
    DateTime parsedDate = DateTime.parse(date);
    var newDate = DateTime.utc(
        parsedDate.year,
        parsedDate.month,
        parsedDate.day,
        parsedDate.hour,
        parsedDate.minute,
        parsedDate.second,
        parsedDate.millisecond);
    DateFormat formatter = DateFormat(outputFormat);
    return formatter.format(newDate.toLocal()).toString();
  }

  static String changeDateFormat(
      {required String date, required String outputDateFormat}) {
    var time = "";
    try {
      DateFormat outputFormat = DateFormat(outputDateFormat);
      final DateTime dateTime = DateTime.parse(date);
      time = outputFormat.format(dateTime.toLocal());
    } catch (e) {
      printLog(e.toString());
    }
    return time;
  }

  static String milliSecondToFormatDat() {
    return "time";
  }

  static showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
    ));
  }

  static printLog(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

}
