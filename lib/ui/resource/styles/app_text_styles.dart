// ignore_for_file: avoid_hard_coded_text_style
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/resource/dimens/app_dimen.dart';
import 'package:hanam/resource/dimens/dimens.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/resource/dimens/app_dimen.dart';
import 'package:hanam/resource/dimens/dimens.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';

/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary

class AppTextStyles {
  AppTextStyles._();

  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
      letterSpacing: _defaultLetterSpacing,
      fontFamily: 'Inter',
      // height: 1.0,
      decorationColor: AppColors.primaryTextColor);

  static TextStyle s10w400NoteText({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d10.sp,
        fontWeight: FontWeight.w400,
        height: 2,
        color: AppColors.noteTextColor,
      ));

  static TextStyle s10w500PrimaryText({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d10.sp,
        fontWeight: FontWeight.w500,
        height: 2,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s11w400PrimaryText({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d11.sp,
        fontWeight: FontWeight.w400,
        height: 16 / 11,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s12w400SecondaryTextColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp.responsive(tablet: 8, ultraTablet: 5),
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryTextColor,
      ));

  static TextStyle s12w400PrimaryNoResponsive({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s12w500PrimaryTextColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp.responsive(tablet: 7, ultraTablet: 5),
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s12w500SecondaryTextColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp.responsive(tablet: 7, ultraTablet: 5),
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryTextColor,
      ));

  static TextStyle s12w600SecondaryTextColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp.responsive(tablet: 9, ultraTablet: 6),
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryTextColor,
      ));

  static TextStyle s12w400PrimaryTextColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp.responsive(tablet: 8, ultraTablet: 5),
        fontWeight: FontWeight.w400,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s12w600PrimaryTextColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp.responsive(tablet: 9, ultraTablet: 6),
        fontWeight: FontWeight.w600,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s12w400PrimaryColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.sp.responsive(tablet: 8, ultraTablet: 5),
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ));

  static TextStyle s12w600PrimaryColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d12.responsive(tablet: 10, ultraTablet: 5),
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
      ));

  static TextStyle s13w500PrimaryColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d13.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s14w400Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: 10, ultraTablet: 6),
        fontWeight: FontWeight.w400,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s14w500Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: 10, ultraTablet: 6),
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s14w400PrimaryColor({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: 10, ultraTablet: 6),
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor,
      ));

  static TextStyle s14w400Secondary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: 10, ultraTablet: 5),
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryTextColor,
      ));

  static TextStyle s14w600Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: 8, ultraTablet: 6),
        fontWeight: FontWeight.w600,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s16w400Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.sp.responsive(tablet: 12, ultraTablet: 6),
        fontWeight: FontWeight.w400,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s16w600Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.sp.responsive(tablet: 12, ultraTablet: 6),
        fontWeight: FontWeight.w600,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s16w700Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.sp.responsive(tablet: 12, ultraTablet: 6),
        fontWeight: FontWeight.w700,
        color: AppColors.primaryTextColor,
        height: 22 / 16,
      ));

  static TextStyle s16w500Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: 10, ultraTablet: 6),
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s18w500Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d18.responsive(tablet: 14, ultraTablet: 8),
        fontWeight: FontWeight.w500,
        height: 24 / 18,
        color: AppColors.primaryTextColor,
        letterSpacing: -0.02,
      ));

  static TextStyle s18w600Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d18.responsive(tablet: 14, ultraTablet: 8),
        fontWeight: FontWeight.w600,
        height: 24 / 18,
        color: AppColors.primaryTextColor,
        letterSpacing: -0.02,
      ));

  static TextStyle s18w700Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d18.responsive(tablet: 14, ultraTablet: 8),
        fontWeight: FontWeight.w700,
        height: 28 / 18,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle titleH4({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d24.responsive(tablet: 20, ultraTablet: 12),
        fontWeight: FontWeight.w600,
        height: 30 / 24,
        letterSpacing: -0.01,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle sectionTitle({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d16.responsive(tablet: 10, ultraTablet: 6),
        fontWeight: FontWeight.w700,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle paclDataTitle({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d19.responsive(tablet: 15, ultraTablet: 15),
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle s15w500White({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d15.responsive(tablet: 12, ultraTablet: 6),
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ));

  static TextStyle ekycTitleStyle({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d22.responsive(tablet: 16, ultraTablet: 9),
        fontWeight: FontWeight.w700,
        color: AppColors.primaryTextColor,
      ));

  static TextStyle ekycContentStyle({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: Dimens.d14.responsive(tablet: 10, ultraTablet: 10),
        fontWeight: FontWeight.w400,
        color: Color(0xffB5E0DA),
      ));
}
