// ignore_for_file: dead_code

import 'dart:async';
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
      {super.key,
      required this.message,
      required this.isLoading,
      required this.onDoneAnimation,
      required this.isAnimationText});

  final MessageItemModel message;
  final bool isLoading;
  final bool isAnimationText;
  final Function() onDoneAnimation;
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
                          maxWidth: MediaQuery.of(context).size.width * .9),
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
                            maxWidth: MediaQuery.of(context).size.width * .9),
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
                    maxWidth: MediaQuery.of(context).size.width * .9),
                // alignment: Alignment.centerRight,
                child: widget.isLoading == true
                    ? Container(
                        width: 50.w,
                        height: 40.h,
                        child: Lottie.asset(AppPath.wattingAnswerLoading,
                            frameRate: FrameRate.max, animate: true),
                      )
                    : widget.isAnimationText == true
                        ? TypingTextWidget(
                            text: widget.message.answer,
                            typingSpeed: Duration(milliseconds: 10),
                            onDone: () {
                              widget.onDoneAnimation.call();
                            },
                          )
                        : Text(
                            widget.message.answer,
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
                            maxWidth: MediaQuery.of(context).size.width * .9),
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

class TypingTextWidget extends StatefulWidget {
  final String text;
  final Duration typingSpeed;
  final Function() onDone;

  const TypingTextWidget(
      {Key? key,
      required this.text,
      this.typingSpeed = const Duration(milliseconds: 50),
      required this.onDone})
      : super(key: key);

  @override
  _TypingTextWidgetState createState() => _TypingTextWidgetState();
}

class _TypingTextWidgetState extends State<TypingTextWidget> {
  late String _displayText = "";
  late int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        widget.onDone.call();
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_displayText,
        style: AppTextStyles.s14w400Primary().copyWith(color: Colors.white));
  }
}
