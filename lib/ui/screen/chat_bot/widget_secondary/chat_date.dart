import 'package:flutter/material.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';

class ChatDate extends StatelessWidget {
  const ChatDate({
    super.key,
    required this.date,
    this.shouldBeTransparent = false,
  });

  final String date;
  final bool shouldBeTransparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        date,
        style:
            AppTextStyles.s14w400Primary().copyWith(color: AppColors.white64),
      ),
    );
  }
}
