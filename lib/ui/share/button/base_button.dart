import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/resource/dimens/app_dimen.dart';
import 'package:hanam/resource/dimens/dimens.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';


class BaseButton extends StatelessWidget {
  final void Function()? onPress;
  final String? label;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? maxWidth;
  final double? maxHeight;
  final TextStyle? labelStyle;
  final Color? textColor;
  final EdgeInsets? padding;
  final Widget? iconLeft;
  final Widget? iconRight;
  final MainAxisAlignment? mainAlignment;
  final bool? isEnable;
  final bool? isLoading;
  final Gradient? bgRadient;
  const BaseButton(
      {super.key,
      this.onPress,
      this.label,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.backgroundColor,
      this.maxHeight,
      this.maxWidth,
      this.labelStyle,
      this.textColor,
      this.padding,
      this.iconLeft,
      this.iconRight,
      this.isEnable,
      this.mainAlignment,
      this.bgRadient,
      this.isLoading = false});

  BaseButton.primaryEnable(
      {Key? key,
      void Function()? onPress,
      String? label,
      double? maxHeight,
      TextStyle? labelStyle,
      double? borderRadius,
      Color? borderColor,
      double? maxWidth,
      bool? isEnable,
      final Color? textColor,
      final EdgeInsets? padding,
      final Widget? iconLeft,
      final Widget? iconRight,
      final MainAxisAlignment? mainAlignment,
      Gradient? bgRadient,
      bool? isLoading,
      Color? backgroundColor})
      : this(
            key: key,
            onPress: onPress,
            label: label,
            maxHeight: maxHeight ??
                Dimens.d36.h.responsive(tablet: 25, ultraTablet: 15),
            labelStyle: labelStyle ??
                AppTextStyles.s14w500Primary().copyWith(
                    color: textColor ?? const Color(0xFFFFFFFF),
                    fontSize:
                        Dimens.d14.responsive(tablet: 10, ultraTablet: 5)),
            borderRadius: borderRadius ?? 100.r,
            borderColor: borderColor ?? Colors.transparent,
            maxWidth: maxWidth,
            backgroundColor: backgroundColor ?? const Color(0xff009874),
            // bgRadient: bgRadient ??
            //     const LinearGradient(
            //         colors: [Color(0xFF8DFFF1), Color(0xFF47FFAF)]),
            padding: padding,
            iconLeft: iconLeft,
            isEnable: isEnable,
            iconRight: iconRight,
            isLoading: isLoading,
            mainAlignment: mainAlignment);

  BaseButton.secondaryEnable(
      {Key? key,
      void Function()? onPress,
      String? label,
      double? maxHeight,
      TextStyle? labelStyle,
      double? borderRadius,
      Color? borderColor,
      double? maxWidth,
      bool? isEnable,
      final Color? textColor,
      final EdgeInsets? padding,
      final Widget? iconLeft,
      final Widget? iconRight,
      bool? isLoading,
      final MainAxisAlignment? mainAlignment,
      Color? backgroundColor})
      : this(
            key: key,
            onPress: onPress,
            label: label,
            maxHeight: maxHeight ??
                Dimens.d36.h.responsive(tablet: 25, ultraTablet: 15),
            labelStyle: labelStyle ??
                AppTextStyles.s14w500Primary().copyWith(
                    color: textColor ?? Color(0xff31AD8F),
                    fontSize:
                        Dimens.d14.responsive(tablet: 10, ultraTablet: 6)),
            borderRadius: borderRadius ?? 100.r,
            borderColor: borderColor ?? Colors.transparent,
            maxWidth: maxWidth,
            backgroundColor:
                backgroundColor ?? Color(0xff009874).withOpacity(.1),
            padding: padding,
            iconLeft: iconLeft,
            isEnable: isEnable,
            iconRight: iconRight,
            isLoading: isLoading,
            mainAlignment: mainAlignment);

  BaseButton.primaryDiasble(
      {Key? key,
      void Function()? onPress,
      String? label,
      double? maxHeight,
      TextStyle? labelStyle,
      double? borderRadius,
      Color? borderColor,
      double? maxWidth,
      bool? isEnable,
      final Color? textColor,
      final EdgeInsets? padding,
      final Widget? iconLeft,
      final Widget? iconRight,
      final MainAxisAlignment? mainAlignment,
      Color? backgroundColor})
      : this(
            key: key,
            onPress: onPress,
            label: label,
            maxHeight: maxHeight ??
                Dimens.d36.h.responsive(tablet: 25, ultraTablet: 15),
            labelStyle: labelStyle ??
                AppTextStyles.s16w400Primary().copyWith(
                    color: Color(0xffFFFFFF).withOpacity(.32),
                    fontSize:
                        Dimens.d16.responsive(tablet: 10, ultraTablet: 6)),
            borderRadius: borderRadius ?? 100.r,
            borderColor: borderColor ?? Colors.transparent,
            maxWidth: maxWidth,
            backgroundColor:
                backgroundColor ?? const Color(0xffFFFFFF).withOpacity(.06),
            iconLeft: iconLeft,
            iconRight: iconRight,
            isEnable: isEnable,
            mainAlignment: mainAlignment,
            padding: padding);
  BaseButton.dashEnable(
      {Key? key,
      void Function()? onPress,
      String? label,
      double? maxHeight,
      TextStyle? labelStyle,
      double? borderRadius,
      Color? borderColor,
      double? maxWidth,
      bool? isEnable,
      final Color? textColor,
      final EdgeInsets? padding,
      final Widget? iconLeft,
      final Widget? iconRight,
      bool? isLoading,
      final MainAxisAlignment? mainAlignment,
      Color? backgroundColor})
      : this(
            key: key,
            onPress: onPress,
            label: label,
            maxHeight: maxHeight ??
                Dimens.d36.h.responsive(tablet: 25, ultraTablet: 15),
            labelStyle: labelStyle ??
                AppTextStyles.s14w500Primary().copyWith(
                    color: AppColors.primaryColor,
                    fontSize:
                        Dimens.d16.responsive(tablet: 10, ultraTablet: 5)),
            borderRadius: borderRadius ?? 100.r,
            borderColor: borderColor ?? AppColors.primaryColor,
            maxWidth: maxWidth,
            backgroundColor: backgroundColor ?? Colors.transparent,
            padding: padding,
            iconLeft: iconLeft,
            isEnable: isEnable,
            iconRight: iconRight,
            isLoading: isLoading,
            mainAlignment: mainAlignment);

  BaseButton.dashDisable(
      {Key? key,
      String? label,
      double? maxHeight,
      TextStyle? labelStyle,
      double? borderRadius,
      Color? borderColor,
      double? maxWidth,
      bool? isEnable,
      void Function()? onPress,
      final Color? textColor,
      final EdgeInsets? padding,
      final Widget? iconLeft,
      final Widget? iconRight,
      final MainAxisAlignment? mainAlignment,
      Color? backgroundColor})
      : this(
            key: key,
            label: label,
            maxHeight: maxHeight ??
                Dimens.d36.h.responsive(tablet: 25, ultraTablet: 15),
            labelStyle: labelStyle ??
                AppTextStyles.s16w400Primary().copyWith(
                    color: AppColors.textColorDisable,
                    fontSize:
                        Dimens.d16.responsive(tablet: 10, ultraTablet: 6)),
            borderRadius: borderRadius ?? 100.r,
            borderColor: borderColor ?? AppColors.textColorDisable,
            maxWidth: maxWidth,
            backgroundColor: backgroundColor ?? Colors.transparent,
            padding: padding,
            iconLeft: iconLeft,
            isEnable: isEnable,
            iconRight: iconRight,
            mainAlignment: mainAlignment);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading == true ? null : onPress ?? () {},
      child: Container(
        height:
            maxHeight ?? Dimens.d36.h.responsive(tablet: 25, ultraTablet: 15),
        alignment: Alignment.center,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primaryColor,
            gradient: bgRadient,
            border: Border.all(
                width: borderWidth ?? 0,
                color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
            boxShadow: isEnable == true
                ? [
                    // BoxShadow(
                    //   color: Color(0xFF031AEC).withOpacity(0.8),
                    //   spreadRadius: 0,
                    //   blurRadius: 10,
                    //   offset: Offset(1, 2),
                    // ),
                    // BoxShadow(
                    //   color: Color(0xFF020202).withOpacity(0.33),
                    //   spreadRadius: 0,
                    //   blurRadius: 4,
                    //   offset: Offset(4, 4),
                    // )
                  ]
                : []),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: mainAlignment ?? MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconLeft ?? Container(),
              isLoading == true
                  ? SizedBox(
                      width:
                          Dimens.d23.w.responsive(tablet: 18, ultraTablet: 12),
                      height:
                          Dimens.d23.w.responsive(tablet: 18, ultraTablet: 12),
                      child: const CircularProgressIndicator(
                        color: AppColors.primaryTextColor,
                      ),
                    )
                  : Expanded(
                      child: Text(
                        label ?? "",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: labelStyle ??
                            AppTextStyles.s16w600Primary().copyWith(
                                color: textColor ?? Colors.black,
                                fontSize: Dimens.d16
                                    .responsive(tablet: 10, ultraTablet: 6)),
                      ),
                    ),
              iconRight ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
