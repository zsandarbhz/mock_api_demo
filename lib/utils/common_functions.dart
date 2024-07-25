// ignore_for_file: depend_on_referenced_packages

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_api_demo/app/data/global_data_store.dart';
import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:mock_api_demo/utils/text_styles.dart';
import 'package:mock_api_demo/view/commonWidget/buttons/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<void> clearData() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    sharedUser.clear();
    GlobalDataStore.clearData();
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

  static showPopup(
      {required BuildContext context,
      String title = "",
      required String msg,
      String okBtnName = "Ok",
      String cancelBtnName = "Cancel",
      bool willPop = false,
      bool isCancelShow = true,
      VoidCallback? okClicked,
      VoidCallback? cancelClicked}) {
    showDialog(
        context: context,
        builder: (context) {
          return PopScope(
            canPop: willPop,
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.size_30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.size_10),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.globalHorizontalPadding,
                          vertical: Dimensions.size_15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(height: Dimensions.size_10,),
                          if (title.isNotEmpty)
                            Text(title,
                                textAlign: TextAlign.center,
                                style: TextStyles.blue16w700),
                          const SizedBox(
                            height: Dimensions.size_10,
                          ),
                          if (msg.isNotEmpty)
                            Text(msg,
                                textAlign: TextAlign.center,
                                style: TextStyles.grey12W400),
                          const SizedBox(
                            height: Dimensions.size_15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isCancelShow)
                                Expanded(
                                    child: PrimaryButton(
                                        btnName: cancelBtnName,
                                        action: () {
                                          Navigator.pop(context);
                                        })),
                              const SizedBox(
                                width: Dimensions.size_10,
                              ),
                              Expanded(
                                  child: PrimaryButton(
                                      btnName: okBtnName,
                                      action: () {
                                        // Navigator.pop(context);
                                        okClicked?.call();
                                      }))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
