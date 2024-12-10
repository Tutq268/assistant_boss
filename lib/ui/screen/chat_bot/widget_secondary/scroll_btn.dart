import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_cubit.dart';

class ScrollButton extends StatefulWidget {
  const ScrollButton(
      {super.key, required this.scrollController, required this.cubit});
  final ScrollController scrollController;
  final DetailChatCubit cubit;

  @override
  ScrollButtonState createState() => ScrollButtonState();
}

class ScrollButtonState extends State<ScrollButton> {
  @override
  void initState() {
    widget.scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() {
    final position = widget.scrollController.position;
    final diff = position.pixels - position.minScrollExtent;
    final showScrollBtn = widget.cubit.state.showScrollBtn;

    if (showScrollBtn && diff > 80) {
      return;
    }

    if (showScrollBtn && diff <= 80) {
      widget.cubit.toggleScrollBtnVisibility();
      return;
    }

    if (showScrollBtn || diff <= 80) return;
    widget.cubit.toggleScrollBtnVisibility();
  }

  void handleScrollBtnClick() {
    widget.scrollController.animateTo(
      widget.scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );

    widget.cubit.toggleScrollBtnVisibility();
  }

  @override
  Widget build(BuildContext context) {
    final showScrollBtn = widget.cubit.state.showScrollBtn;
    final unreadCount = widget.cubit.state.unreadCount;

    return showScrollBtn
        ? GestureDetector(
            onTap: handleScrollBtnClick,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  padding: EdgeInsets.all(8.sp),
                  margin: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backGroundColor,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black26,
                      )
                    ],
                  ),
                  child: Icon(Ionicons.chevron_down_outline,
                      size: 18.sp, color: AppColors.white64),
                ),
                if (unreadCount > 0) ...[
                  Container(
                    padding: EdgeInsets.all(8.sp),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          )
        : Container();
  }
}
