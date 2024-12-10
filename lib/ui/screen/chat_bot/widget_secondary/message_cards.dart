// ignore_for_file: dead_code

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_cubit.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:shimmer/shimmer.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({
    super.key,
    required this.message,
  });

  final MessageItemModel message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(
                    top: 6.h, bottom: 6.h, left: 8.w, right: 8.w),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .7),
                // alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  widget.message.question,
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.s14w400Primary()
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(
                    top: 6.h, bottom: 6.h, left: 8.w, right: 8.w),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .7),
                // alignment: Alignment.centerRight,
                child: Text(
                  widget.message.question,
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.s14w400Primary()
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
