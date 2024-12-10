import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/ui/screen/chat_bot/widget_secondary/buttons.dart';
import 'buttons.dart';

class AttachmentPicker extends StatefulWidget {
  const AttachmentPicker(
      {super.key,
      required this.onCamera,
      required this.onGallery,
      required this.onAttachment});
  final Function() onCamera;
  final Function() onGallery;
  final Function() onAttachment;

  @override
  AttachmentPickerState createState() => AttachmentPickerState();
}

class AttachmentPickerState extends State<AttachmentPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h),
      child: GridView.count(
        crossAxisCount: 3,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          LabelledButton(
            onTap: () async {
              // ref
              //     .read(chatControllerProvider.notifier)
              //     .pickDocuments(context);
              widget.onAttachment.call();
            },
            backgroundColor: Color(0xff009874).withOpacity(.1),
            label: 'Document',
            child: const Icon(
              Icons.insert_page_break,
              size: 28,
              color: Colors.white,
            ),
          ),
          LabelledButton(
            onTap: () async {
              // ref
              //     .read(chatControllerProvider.notifier)
              //     .navigateToCameraView(context);
              widget.onCamera.call();
            },
            label: 'Camera',
            backgroundColor: Color(0xff009874).withOpacity(.1),
            child: Icon(
              Icons.camera_alt_rounded,
              size: 28.sp,
              color: Colors.white,
            ),
          ),
          LabelledButton(
            onTap: () async {
              // ref
              //     .read(chatControllerProvider.notifier)
              //     .pickAttachmentsFromGallery(context);
              widget.onGallery.call();
            },
            label: 'Gallery',
            backgroundColor: Color(0xff009874).withOpacity(.1),
            child: Icon(
              Icons.photo_size_select_actual_rounded,
              size: 28.sp,
              color: Colors.white,
            ),
          ),
          if (Platform.isAndroid) ...[
            LabelledButton(
              onTap: () async {
                // ref
                //     .read(chatControllerProvider.notifier)
                //     .pickAudioFiles(context);
              },
              label: 'Audio',
              backgroundColor: Color(0xff009874).withOpacity(.1),
              child: Icon(
                Icons.headphones_rounded,
                size: 28.sp,
                color: Colors.white,
              ),
            )
          ],
          LabelledButton(
            onTap: () {
              if (!mounted) return;
              Navigator.pop(context);
            },
            label: 'Location',
            backgroundColor: Color(0xff009874).withOpacity(.1),
            child: Icon(
              Icons.location_on,
              size: 28.sp,
              color: Colors.white,
            ),
          ),
          LabelledButton(
            onTap: () async {
              if (!mounted) return;
              Navigator.pop(context);
            },
            label: 'Contact',
            backgroundColor: Color(0xff009874).withOpacity(.1),
            child: Icon(
              Icons.person,
              size: 28.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
