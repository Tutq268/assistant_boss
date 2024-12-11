// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/ui/config/app_path.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageCard extends StatefulWidget {
  const MessageCard(
      {super.key, required this.message, required this.isLoading});

  final MessageItemModel message;
  final bool isLoading;

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
            widget.message.question == ""
                ? Container()
                : Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 6.h, bottom: 6.h, left: 8.w, right: 8.w),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .8),
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
            widget.message.file == null
                ? Container()
                : InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.message.file!.path.contains(".pdf")) {
                        await launchUrl(
                          Uri.parse(widget.message.file!.path ??
                              "https://www.google.com.vn/"),
                          webOnlyWindowName: '_self',
                        );
                      } else if (widget.message.file!.path.contains(".docx")) {}
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 6.h, bottom: 6.h, left: 8.w, right: 8.w),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * .8),
                        // alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          widget.message.file!.name,
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.s14w400Primary().copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10.h),
              child: Container(
                padding: EdgeInsets.only(
                    top: 6.h, bottom: 6.h, left: 8.w, right: 8.w),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .8),
                // alignment: Alignment.centerRight,
                child: widget.isLoading == true
                    ? Container(
                        width: 50.w,
                        height: 40.h,
                        child: Lottie.asset(AppPath.wattingAnswerLoading,
                            frameRate: FrameRate.max, animate: true),
                      )
                    : Text(
                        widget.message.answer,
                        textAlign: TextAlign.justify,
                        style: AppTextStyles.s14w400Primary()
                            .copyWith(color: Colors.white),
                      ),
              ),
            ),
            widget.message.link == null
                ? Container()
                : InkWell(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse(widget.message.link ??
                            "https://www.google.com.vn/"),
                        webOnlyWindowName: '_self',
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 6.h, bottom: 6.h, left: 8.w, right: 8.w),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * .8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Dẫn nguồn: ",
                              textAlign: TextAlign.justify,
                              style: AppTextStyles.s14w400Primary()
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              widget.message.link ?? "",
                              textAlign: TextAlign.justify,
                              style: AppTextStyles.s14w400Primary().copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ));
  }
}
