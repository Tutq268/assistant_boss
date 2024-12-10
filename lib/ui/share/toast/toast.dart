import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class IToast {
  void show({
    required String title,
    String? message,
    Duration? duration,
    bool hasDismissButton = true,
    Widget? icon,
    bool? isSuccess = true,
    Function() onClose,
  });

  void dismiss();
}

@LazySingleton(as: IToast)
class CustomBotToast implements IToast {
  CancelFunc? _cancel;

  @override
  void show({
    required String title,
    String? message,
    Duration? duration,
    Widget? icon,
    bool? isSuccess = true,
    bool hasDismissButton = true,
    Function()? onClose,
  }) {
    _cancel = BotToast.showNotification(
      margin: EdgeInsets.only(left: 32.w, right: 32.w, top: 32.h),
      contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      title: (_) => Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.s14w400Primary()
            .copyWith(color: isSuccess == true ? Colors.white : Colors.white),
      ),
      duration: duration,
      backgroundColor: isSuccess == true ? AppColors.successColor : Colors.red,
      borderRadius: 12.r,
    );
  }

  @override
  void dismiss() {
    _cancel?.call();
  }
}
