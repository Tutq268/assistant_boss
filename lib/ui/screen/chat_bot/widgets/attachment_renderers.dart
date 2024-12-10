import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hanam/foundation/utils/attachment_utils.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';
import 'package:open_file_plus/open_file_plus.dart';

import 'package:shimmer/shimmer.dart';

class AttachmentRenderer extends StatelessWidget {
  const AttachmentRenderer({
    super.key,
    required this.attachmentType,
    required this.attachment,
    this.fit = BoxFit.none,
    this.controllable = false,
    this.compact = false,
    this.fadeIn = false,
  });

  final String attachmentType;
  final String attachment;
  final BoxFit fit;
  final bool controllable;
  final bool compact;
  final bool fadeIn;

  @override
  Widget build(BuildContext context) {
    switch (attachmentType) {
      case "image":
        return ImageViewer(image: attachment, fit: fit);
      // case "video":
      //   return VideoViewer(video: attachment, controllable: controllable);
      // case "audio":
      //   return AudioViewer(audio: attachment, controllable: controllable);
      default:
        // return DocumentViewer(
        //   document: attachment,
        //   compact: compact,
        // );
        return Container();
    }
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.image,
    required this.fit,
  });
  final String image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    // return Image.file(
    //   image,
    //   fit: fit,
    // );
    return CachedNetworkImage(
      width: MediaQuery.of(context).size.width,
      imageUrl: image,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.4),
        highlightColor: Colors.grey.withOpacity(0.2),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}




class DocumentViewer extends StatelessWidget {
  const DocumentViewer({
    super.key,
    required this.document,
    this.compact = false,
  });
  final File document;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    String fileName = document.path.split("/").last;
    if (fileName.length > 20) {
      fileName = "${fileName.substring(0, 15)}...${fileName.substring(15)}";
    }
    final fileSizeStr = strFormattedSize(document.lengthSync());
    final fileExtension = fileName.split(".").last;

    final compactView = Container(
      width: 40,
      height: 50,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 233, 245, 245),
        borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Center(
        child: Text(
          fileExtension.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );

    return compact
        ? compactView
        : GestureDetector(
            onTap: () async {
              await OpenFile.open(document.path);
            },
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                compactView,
                const SizedBox(
                  height: 8,
                ),
                Text(
                  fileName,
                  style: AppTextStyles.s14w400Primary(),
                ),
                Text(fileSizeStr),
              ],
            )),
          );
  }
}
