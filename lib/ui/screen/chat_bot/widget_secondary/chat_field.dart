import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/resource/dimens/app_dimen.dart';
import 'package:hanam/resource/dimens/dimens.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';


class ChatField extends StatelessWidget {
  const ChatField({
    super.key,
    required this.leading,
    this.actions,
    required this.textController,
    this.onTextChanged,
    this.focusNode,
  });

  final Widget leading;
  final List<Widget>? actions;
  final TextEditingController textController;
  final Function(String)? onTextChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        color: Color(0xff1B1B1D),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 0.h),
              child: TextField(
                onChanged: onTextChanged,
                controller: textController,
                focusNode: focusNode,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 6,
                minLines: 1,
                cursorHeight: 20,
                style: AppTextStyles.s14w400Primary()
                    .copyWith(color: AppColors.white90),
                decoration: InputDecoration(
                  hintText: 'Message',
                  border: InputBorder.none,
                  hintStyle: AppTextStyles.s14w400Primary().copyWith(
                      color: Colors.white.withOpacity(.64),
                      fontSize:
                          Dimens.d14.responsive(tablet: 10, ultraTablet: 5)),
                ),
              ),
            ),
          ),
          if (actions != null) ...[
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: actions!
                    .map((e) => Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: e,
                        ))
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
