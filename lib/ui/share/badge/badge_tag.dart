import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgeTag extends StatelessWidget {
  const BadgeTag({super.key, this.icon, required this.title});
  final Widget? icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.primaryColor.withOpacity(.2)),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 4.w),
            child: icon,
          ),
          Text(
            title,
            style: AppTextStyles.s14w400Primary()
                .copyWith(color: AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}
