import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:hanam/foundation/utils/permission_helpers.dart';
import 'package:file_picker/file_picker.dart';

Future<List<File>?> pickMultimedia(BuildContext context) async {
  if (Platform.isIOS &&
      !await PermissionHelpers.requestPhotoPermission(context)) return null;

  final picker = ImagePicker();

  try {
    final List<XFile> media = await picker.pickMultipleMedia();
    return media.isNotEmpty ? media.map((e) => File(e.path)).toList() : null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  if (Platform.isIOS &&
      !await PermissionHelpers.requestPhotoPermission(context)) return null;

  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return image != null ? File(image.path) : null;
}

Future<File?> capturePhoto(BuildContext context) async {
  if (!await PermissionHelpers.requestCameraPermission(context)) return null;

  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);

  return image != null ? File(image.path) : null;
}

String strFormattedSize(num size) {
  size /= 1024;

  final suffixes = ["KB", "MB", "GB", "TB"];
  String suffix = "";

  for (suffix in suffixes) {
    if (size < 1024) {
      break;
    }

    size /= 1024;
  }

  return "${size.toStringAsFixed(2)}$suffix";
}

bool datesHaveSameDay(DateTime d1, DateTime d2) {
  return d1.day == d2.day && d1.month == d2.month && d1.year == d2.year;
}

String formattedTimestamp(DateTime date,
    [bool timeOnly = false, bool meridiem = false]) {
  DateTime now = DateTime.now();

  if (timeOnly || datesHaveSameDay(now, date)) {
    return meridiem
        ? DateFormat('hh:mm a').format(date)
        : DateFormat('HH:mm').format(date);
  }

  if (isYesterday(date)) {
    return 'Yesterday';
  }

  return DateFormat.yMd().format(date);
}

bool isYesterday(DateTime date) {
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  return datesHaveSameDay(date, yesterday);
}

String timeFromSeconds(int seconds, [bool minWidth4 = false]) {
  if (seconds == 0) return "0:00";

  String result = DateFormat('HH:mm:ss').format(
    DateTime(2022, 1, 1, 0, 0, seconds),
  );

  List resultParts = result.split(':');
  for (int i = 0; i < resultParts.length; i++) {
    if (resultParts[i] != "00") break;
    resultParts[i] = "";
  }
  resultParts.removeWhere((element) => element == "");

  if (minWidth4 && resultParts.length == 1) {
    resultParts = ["0", ...resultParts];
  }

  return resultParts.join(':');
}

String dateFromTimestamp(DateTime date) {
  DateTime now = DateTime.now();
  if (datesHaveSameDay(now, date)) {
    return 'Today';
  }

  if (isYesterday(date)) {
    return 'Yesterday';
  }

  return DateFormat.yMd().format(date);
}

String getChatId(String senderId, String receiverId) {
  final charList = (senderId + receiverId).split('');
  charList.sort((a, b) => a.compareTo(b));

  return charList.join();
}

Future<List<File>?> pickFiles({
  required FileType type,
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: type,
    allowCompression: false,
    allowMultiple: false,
    allowedExtensions: ['pdf', 'doc'],
  );

  return result?.files.map((e) => File(e.path!)).toList();
}
