import 'package:mock_api_demo/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class TextStyles {
  final BuildContext context;

  TextStyles(this.context);

  static TextStyle white10W400 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_10.sp,
      fontWeight: FontWeight.w400,
      color: ColorPalettes.whiteColor);

  static TextStyle white11W700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_11.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.whiteColor);

  static TextStyle white13W700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_13.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.whiteColor);

  static TextStyle grey12W400 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_12.sp,
      fontWeight: FontWeight.w400,
      color: ColorPalettes.gray);

  static TextStyle grey10W400 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_10.sp,
      fontWeight: FontWeight.w400,
      color: Colors.grey);

  static TextStyle errorText = TextStyle(
      fontSize: Dimensions.size_10.sp,
      color: ColorPalettes.red,
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400);

  static TextStyle red13W700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_13.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.red);

  static TextStyle black16w400 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_16.sp,
      fontWeight: FontWeight.w400,
      color: ColorPalettes.gray900);

  static TextStyle blue10w700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_10.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.primaryColor);

  static TextStyle blue11w700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_11.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.primaryColor);

  static TextStyle blue12w700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_12.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.primaryColor);

  static TextStyle blue13w700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_13.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.primaryColor);

  static TextStyle blue16w700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_16.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.primaryColor);

  static TextStyle blue20w800 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_20.sp,
      fontWeight: FontWeight.w800,
      color: ColorPalettes.primaryColor);

  static TextStyle grey30014w400 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_14.sp,
      fontWeight: FontWeight.w400,
      color: ColorPalettes.gray300);

  static TextStyle grey11w700 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_11.sp,
      fontWeight: FontWeight.w700,
      color: ColorPalettes.gray);

  static TextStyle grey13w600 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: Dimensions.size_13.sp,
      fontWeight: FontWeight.w600,
      color: ColorPalettes.gray);

}
