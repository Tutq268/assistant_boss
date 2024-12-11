import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hanam/data/preference/app_preferences.dart';
import 'package:hanam/resource/generated/l10n.dart';
import 'package:hanam/ui/di/di.dart';
import 'package:hanam/ui/share/dialog/app_dialog/custome_cupertino_alert.dart';

class PermissionHelpers {
  static Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.request();
    return status.isGranted || status.isLimited;
  }

  /// Open App Setting, when re-apply some permission
  static Future<bool> openDeviceSettings({Permission? permission}) =>
      openAppSettings();

  static Future<PermissionStatus> check(Permission permission) =>
      permission.status;

  static Future<PermissionStatus> request(Permission permission) =>
      permission.request();

  static Future<bool> requestPhotoPermission(BuildContext context) async {
    var status = await Permission.photos.status;
    if (status.isGranted) {
      print('Quyền truy cập thư viện ảnh đã được cấp.');
      return true;
    } else if (status.isDenied) {
      var result = await Permission.photos.request();
      if (result.isGranted) {
        print('Quyền truy cập thư viện ảnh đã được cấp sau khi yêu cầu.');
      } else if (result.isDenied) {
        print('Quyền truy cập thư viện ảnh bị từ chối.');
        await showDialog(
          context: context,
          builder: (BuildContext context) => CustomCupertinoAlert(
            context: context,
            title: "Thông báo",
            content: "Không thể mở thư viện",
            rightButtonTitle: "Cài đặt",
            rightAction: () async {
              openAppSettings();
            },
          ),
        );
      } else if (result.isPermanentlyDenied) {
        print('Quyền truy cập thư viện ảnh bị từ chối vĩnh viễn.');
        await showDialog(
          context: context,
          builder: (BuildContext context) => CustomCupertinoAlert(
            context: context,
            title: "Thông báo",
            content: "Không thể mở thư viện",
            rightButtonTitle: "Cài đặt",
            rightAction: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) => CustomCupertinoAlert(
                  context: context,
                  title: "Thông báo",
                  content: "Không thể mở thư viện",
                  rightButtonTitle: "Cài đặt",
                  rightAction: () async {
                    openAppSettings();
                  },
                ),
              );
            },
          ),
        );
      }
      return false;
    } else if (status.isPermanentlyDenied) {
      print('Quyền truy cập thư viện ảnh bị từ chối vĩnh viễn.');
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomCupertinoAlert(
          context: context,
          title: "Thông báo",
          content: "Không thể mở thư viện",
          rightButtonTitle: "Cài đặt",
          rightAction: () async {
            openAppSettings();
          },
        ),
      );

      return false;
    } else if (status.isRestricted) {
      print('Quyền truy cập thư viện ảnh bị hạn chế.');
      return false;
    } else if (status.isLimited) {
      print('Quyền truy cập thư viện ảnh bị giới hạn.');
      return false;
    } else {
      print('Trạng thái quyền truy cập thư viện ảnh không xác định.');
      return false;
    }
    // final _isShown = await Permission.storage.shouldShowRequestRationale;
    // final _status = await (Platform.isAndroid
    //     ? check(Permission.storage)
    //     : check(Permission.photos));

    // if (_status.isGranted || _status.isLimited) {
    //   return true;
    // }
    // await Permission.storage.request();

    // if (_status.isPermanentlyDenied || _isShown) {
    //   await showDialog(
    //     context: context,
    //     builder: (BuildContext context) => CustomCupertinoAlert(
    //       context: context,
    //       title: S.current.notification,
    //       content: S.current.cant_open_gallery,
    //       rightButtonTitle: S.current.setting,
    //       rightAction: () async {
    //         openAppSettings();
    //       },
    //     ),
    //   );
    //   return false;
    // } else {
    //   final deviceInfo = await getIt.get<AppPreferences>().deviceInfo;
    //   if (Platform.isAndroid && deviceInfo?["version"]["sdkInt"] >= 30) {
    //     Permission.manageExternalStorage.request();
    //     await showDialog(
    //       context: context,
    //       builder: (BuildContext context) => CustomCupertinoAlert(
    //         context: context,
    //         title: S.current.notification,
    //         content: S.current.cant_open_gallery,
    //         rightButtonTitle: S.current.setting,
    //         rightAction: () async {
    //           openAppSettings();
    //         },
    //       ),
    //     );
    //   }
    //   return false;
    // }
  }

  static Future<bool> requestAudioPermission(BuildContext context) async {
    final _isShown = await Permission.storage.shouldShowRequestRationale;
    final _status = await check(Permission.microphone);
    if (_status.isGranted || _status.isLimited) {
      return true;
    }
    if (_status.isPermanentlyDenied || _isShown) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomCupertinoAlert(
          context: context,
          title: "Lỗi",
          content: "Mở cài đặt để cấp quyền micro",
          rightButtonTitle: "Cài đặt",
          rightAction: () async {
            openAppSettings();
          },
        ),
      );
      return false;
    } else {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomCupertinoAlert(
          context: context,
          title: "Lỗi",
          content: "Mở cài đặt để cấp quyền micro",
          rightButtonTitle: "Cài đặt",
          rightAction: () async {
            openAppSettings();
          },
        ),
      );
      return false;
    }
  }

  static Future<bool> requestCameraPermission(BuildContext context) async {
    final _isShown = await Permission.camera.shouldShowRequestRationale;
    final _status = await check(Permission.camera);
    if (_status.isGranted) {
      return true;
    }
    if (_status.isPermanentlyDenied || _isShown) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomCupertinoAlert(
          context: context,
          title: "Thông báo",
          content: "Không thể mở thư viện",
          rightButtonTitle: "Cài đặt",
          rightAction: () async {
            openAppSettings();
          },
        ),
      );
      return false;
    }
    final _result = await request(Permission.camera);
    if (_result.isGranted) {
      return true;
    }
    return false;
  }

  static Future<bool> requestLocationPermission(BuildContext context) async {
    final _isShown = await Permission.location.shouldShowRequestRationale;
    final _status = await check(Permission.location);
    if (_status.isGranted) {
      return true;
    }
    if (_status.isPermanentlyDenied || _isShown) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomCupertinoAlert(
          context: context,
          title: "Thông báo",
          content:
              "Vui lòng cấp quyền truy cập vị trí để có thể cài đặt thông tin wifi",
          rightButtonTitle: "Cài đặt",
          rightAction: () async {
            openAppSettings();
          },
        ),
      );
      return false;
    }
    final _result = await request(Permission.location);
    if (_result.isGranted) {
      return true;
    }
    return false;
  }

  static Future<bool> requestLocationTimeKeepingPermission(
      BuildContext context) async {
    final _isShown = await Permission.location.shouldShowRequestRationale;
    final _status = await check(Permission.location);
    if (_status.isGranted) {
      return true;
    }
    if (_status.isPermanentlyDenied || _isShown) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (BuildContext context) => CustomCupertinoAlert(
          context: context,
          title: "Thông báo",
          content: "Vui lòng cấp quyền truy cập vị trí để tiếp tục chấm công",
          rightButtonTitle: "Cài đặt",
          rightAction: () async {
            openAppSettings();
          },
        ),
      );
      return false;
    }
    final _result = await request(Permission.location);
    if (_result.isGranted) {
      return true;
    }
    return false;
  }

  static Future<void> requestStoragePermission() async {
    if (await Permission.storage.isGranted) {
    } else {
      PermissionStatus status = await Permission.storage.request();

      if (status.isGranted) {
      } else if (status.isDenied) {
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
    }
  }

  static Future<void> requestMediaPermission() async {
    if (await Permission.mediaLibrary.isGranted) {
    } else {
      PermissionStatus status = await Permission.mediaLibrary.request();

      if (status.isGranted) {
      } else if (status.isDenied) {
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
    }
  }
}
