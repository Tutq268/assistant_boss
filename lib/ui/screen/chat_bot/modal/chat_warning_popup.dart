import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/resource/dimens/app_dimen.dart';
import 'package:hanam/resource/dimens/dimens.dart';
import 'package:hanam/resource/generated/assets.gen.dart';
import 'package:hanam/resource/generated/l10n.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';
import 'package:hanam/ui/share/button/base_button.dart';

class ChatWarningPopup extends StatefulWidget {
  const ChatWarningPopup({super.key, this.onConfirm, required this.content});
  final Function()? onConfirm;
  final String content;
  @override
  State<ChatWarningPopup> createState() => _ChatWarningPopupState();
}

class _ChatWarningPopupState extends State<ChatWarningPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: Dimens.d150.h.responsive(tablet: 150, ultraTablet: 70)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        margin: EdgeInsets.symmetric(
            horizontal: Dimens.d1.responsive(tablet: 30, ultraTablet: 80)),
        decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.circular(8.r),
           ),
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //         colors: [Color(0xFF0B1413), Color(0xFF223D3A)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [renderContent(), renderAction()],
        ),
      ),
    );
  }

  Widget renderContent() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 88.w,
                height: 88.w,
                child: Assets.images.chat.chatWarning.image()),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 12.h),
              child: Text(
                widget.content ?? "",
                textAlign: TextAlign.center,
                style: AppTextStyles.s12w600SecondaryTextColor().copyWith(
                    color: Colors.white,
                    fontSize:
                        Dimens.d16.sp.responsive(tablet: 10, ultraTablet: 6)),
              ),
            )
          ],
        ));
  }

  Widget renderAction() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        margin: EdgeInsets.only(
            left: Dimens.d1.responsive(tablet: 20, ultraTablet: 20),
            right: Dimens.d1.responsive(tablet: 20, ultraTablet: 20),
            top: Dimens.d24.h.responsive(tablet: 12, ultraTablet: 8)),
        child: widget.onConfirm != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: BaseButton.primaryEnable(
                      label:"Xác nhận",
                      onPress: () {
                        Navigator.pop(context);
                        widget.onConfirm?.call();
                      },
                    ),
                  ),
                  SizedBox(
                    width: Dimens.d12.sp.responsive(tablet: 8, ultraTablet: 5),
                  ),
                  Expanded(
                    child: BaseButton.secondaryEnable(
                      label:"Huỷ",
                      backgroundColor: Color(0xffE54C42),
                      textColor: Colors.white,
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
            : BaseButton.primaryEnable(
                label: "Xác nhận",
                onPress: () {
                  Navigator.pop(context);
                },
              ));
  }
}
