// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hanam/data/api/app_api_service.dart';
import 'package:hanam/data/model/conversation/create_conversation_response.dart';
import 'package:hanam/foundation/utils/permission_helpers.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_state.dart';
import 'package:hanam/ui/screen/chat_bot/model/attachement.dart';
import 'package:hanam/ui/screen/chat_bot/model/message.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hanam/data/api/exceptions/app_exception.dart';
import 'package:hanam/ui/cubit/base_cubit.dart';
import 'package:injectable/injectable.dart';

import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;
import 'package:file_picker/file_picker.dart';

@Injectable()
class DetailChatCubit extends BaseCubit<DetailChatState> {
  DetailChatCubit({required this.hanamService})
      : super(DetailChatState(
          messageController: TextEditingController(),
          fieldFocusNode: FocusNode(),
        ));
  final AppApiService hanamService;

  Future<void> initData() async {
    return runBlocCatching(
        action: () async {
          emit(state.copyWith(
              isLoading: true,
              isWattingMessage: false,
              messages: [],
              wattingMessageId: null));
          final createConversation = await hanamService.createConversationId();
          if (createConversation == null) {
            return;
          } else {
            final conversation = createConversation.data;
            emit(state.copyWith(conversationInfo: conversation));
            emit(state.copyWith(isLoading: false));
            getListConversation();
          }
        },
        handleLoading: false,
        doOnSubscribe: () async {},
        doOnError: (AppException e) async {
          print("do onError: $e");
        },
        doOnSuccessOrError: () async {
          // emit(state.copyWith(isLoading: false));
        });
  }

  Future<void> getListConversation() async {
    return runBlocCatching(
        action: () async {
          final response = await hanamService.getListConversation();
          if (response == null) {
            return;
          }
          emit(state.copyWith(listConversation: response.data));
        },
        handleLoading: false,
        doOnSubscribe: () async {},
        doOnError: (AppException e) async {
          print("do onError: $e");
        },
        doOnSuccessOrError: () async {
          emit(state.copyWith(isLoading: false));
        });
  }

  Future<void> getListMessageByConversationId(
      {required MessageModel item}) async {
    return runBlocCatching(
        action: () async {
          emit(state.copyWith(
              isLoading: true,
              isWattingMessage: false,
              conversationInfo: item,
              messages: [],
              wattingMessageId: null));
          final response =
              await hanamService.getListMessage(conversationId: item.id);
          if (response == null) {
            return;
          } else {
            final conversations = response.data;
            emit(state.copyWith(messages: conversations));
            emit(state.copyWith(isLoading: false));
            getListConversation();
          }
        },
        handleLoading: false,
        doOnSubscribe: () async {},
        doOnError: (AppException e) async {
          print("do onError: $e");
        },
        doOnSuccessOrError: () async {
          emit(state.copyWith(isLoading: false));
        });
  }

  Future<void> pickFileWithPermission() async {
    emit(state.copyWith(isWattingMessage: true));

    if (Platform.isIOS) {
      await PermissionHelpers.requestStoragePermission();
    } else {
      await PermissionHelpers.requestMediaPermission();
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', "docx"],
        allowMultiple: false);

    if (result == null) {
      print("Chưa chọn file để upload");
      emit(state.copyWith(isWattingMessage: false));

      return;
    }

    var formData = FormData.fromMap({});
    for (var file in result.files) {
      formData.files.add(
        MapEntry(
          "files",
          await MultipartFile.fromFile(
            file.path!,
            filename: file.name,
          ),
        ),
      );
    }
    final response = await hanamService.uploadFile(body: formData);
    if (response != null) {
      final filesUpload = response.data;
      if (filesUpload.isNotEmpty) {
        final fileId = filesUpload[0].id;
        if (state.conversationInfo == null) {
          return;
        }
        final messageText = state.messageController?.text;
        final conversationId = state.conversationInfo!.id;
        state.messageController?.text = "";
        emit(state.copyWith(
          hideElements: false,
        ));
        final createMessage = await hanamService.createMessageItem(
            conversationId: conversationId,
            question: messageText ?? "",
            file: fileId);
        if (createMessage == null) {
          return;
        } else {
          final newList = [createMessage.data, ...state.messages];
          emit(state.copyWith(
              messages: newList, wattingMessageId: createMessage.data.id));
        }
      }
    }
  }

  // final SalalaConfigApiService hanamService;

  Future<void> deleteConversation({required String id}) async {
    return runBlocCatching(
        action: () async {
          // emit(state.copyWith(isLoading: true));
          // final conversationInfo =
          //     await hanamService.adminDeleteConversation(conversationId: id);
          // if (conversationInfo == null || conversationInfo.data == null) {
          //   return;
          // }
          // getIt.get<IToast>().show(
          //     title: conversationInfo.message ?? "Delete conversation success",
          //     hasDismissButton: false,
          //     duration: const Duration(milliseconds: 3000));
          // navigator.pop();
        },
        handleLoading: false,
        doOnSubscribe: () async {},
        doOnError: (AppException e) async {
          print("do onError: $e");
        },
        doOnSuccessOrError: () async {
          emit(state.copyWith(isLoading: false));
        });
  }

  Future<void> onDeleteMessage({required String messageId}) async {
    return runBlocCatching(
        action: () async {
          // emit(state.copyWith(isLoading: true));
          // final response =
          //     await hanamService.deleteMessage(messageId: messageId);
          // if (response == null) {
          //   return;
          // }
          // final newListMessage = state.messages
          //     .where((element) => element.id != messageId)
          //     .toList();
          // emit(state.copyWith(messages: newListMessage));
        },
        handleLoading: false,
        doOnSubscribe: () async {},
        doOnError: (AppException e) async {
          print("do onError: $e");
        },
        doOnSuccessOrError: () async {
          emit(state.copyWith(isLoading: false));
        });
  }

  void onTextChanged(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(hideElements: false));
    } else if (value != ' ') {
      emit(state.copyWith(hideElements: true));
    } else {
      state.messageController?.text = "";
    }
  }

  void toggleScrollBtnVisibility() {
    emit(state.copyWith(showScrollBtn: !state.showScrollBtn));
  }

  void setUnreadCount(int count) {
    if (state.unreadCount == count) return;
    emit(state.copyWith(unreadCount: count));
  }

  void setShowEmojiPicker(bool shouldShowEmojiPicker) {
    emit(state.copyWith(showEmojiPicker: shouldShowEmojiPicker));
  }

  void onSendBtnPressed() async {
    return runBlocCatching(
        action: () async {
          if (state.conversationInfo == null) {
            return;
          }
          emit(state.copyWith(isWattingMessage: true));
          final messageText = state.messageController?.text;
          final conversationId = state.conversationInfo!.id;
          state.messageController?.text = "";
          emit(state.copyWith(
            hideElements: false,
          ));
          final createMessage = await hanamService.createMessageItem(
              conversationId: conversationId, question: messageText ?? "");
          if (createMessage == null) {
            return;
          } else {
            if (state.socketMessage != null) {
              final newList = [state.socketMessage!, ...state.messages];
              emit(state.copyWith(
                  messages: newList,
                  isWattingMessage: false,
                  socketMessage: null));
            } else {
              final newList = [createMessage.data, ...state.messages];
              emit(state.copyWith(messages: newList, wattingMessageId: null));
            }
          }
        },
        handleLoading: false,
        doOnSubscribe: () async {},
        doOnError: (AppException e) async {
          print("do onError: $e");
        },
        doOnSuccessOrError: () async {
          // emit(state.copyWith(isLoading: false));
        });
  }

  void onUpdateMessageItem(MessageItemModel data) {
    if (state.conversationInfo == null) {
      return;
    }
    if (data.conversation == state.conversationInfo!.id) {
      final findIndex =
          state.messages.indexWhere((element) => element.id == data.id);
      if (findIndex >= 0) {
        final newList2 = [...state.messages];
        newList2[findIndex] = data;
        emit(state.copyWith(
            messages: newList2,
            socketMessage: null,
            wattingMessageId: null,
            isWattingMessage: false));
      } else {
        emit(state.copyWith(socketMessage: data));
      }
    }
  }

  void handleAddMessage(MessageItemModel newMessage) {
    final newList = [newMessage, ...state.messages];
    emit(state.copyWith(messages: newList));
  }

  Future<void> sendMessageNoAttachments(Message message) async {
    // await IsarDb.addMessage(message);

    // Delay for smooth animation
    // Future.delayed(const Duration(milliseconds: 300), () {
    //   ref
    //       .read(firebaseFirestoreRepositoryProvider)
    //       .sendMessage(message..status = MessageStatus.sent)
    //       .then((_) {
    //     IsarDb.updateMessage(message.id, status: message.status);
    //     ref.read(pushNotificationsRepoProvider).sendPushNotification(message);
    //   });
    // });
  }

  void sendMessageWithAttachments(Message message) async {
    if ({
      AttachmentType.document,
      AttachmentType.audio,
      AttachmentType.voice,
      AttachmentType.video
    }.contains(message.attachment!.type)) {
      message.attachment!.uploadStatus = UploadStatus.preparing;
      // await IsarDb.addMessage(message);

      message.attachment!.uploadStatus = UploadStatus.uploading;
      await uploadAttachment(message);
      // await IsarDb.updateMessage(message.id, attachment: message.attachment);
      return;
    }

    message.attachment!.uploadStatus = UploadStatus.preparing;
    // await IsarDb.addMessage(message);

    await compressAttachment(message);
    await uploadAttachment(message);
  }

  Future<void> uploadAttachment(Message message) async {
    // await UploadService.upload(
    //   taskId: message.id,
    //   file: message.attachment!.file!,
    //   path: 'attachments/${message.attachment!.fileName}',
    //   onUploadDone: (snapshot) async =>
    //       await uploadCompleteHandler(snapshot, message),
    //   onUploadError: () async => await stopUpload(message),
    // );

    message.attachment!.uploadStatus = UploadStatus.uploading;
    // await IsarDb.updateMessage(message.id, attachment: message.attachment);
  }

  Future<void> uploadCompleteHandler(
    // TaskSnapshot snapshot,
    Message message,
  ) async {
    // final url = await snapshot.ref.getDownloadURL();

    // ref
    //     .read(firebaseFirestoreRepositoryProvider)
    //     .sendMessage(
    //       message
    //         ..status = MessageStatus.sent
    //         ..attachment!.url = url
    //         ..attachment!.uploadStatus = UploadStatus.uploaded,
    //     )
    //     .then((_) async {
    //   await IsarDb.updateMessage(
    //     message.id,
    //     status: message.status,
    //     attachment: message.attachment!
    //       ..url = url
    //       ..uploadStatus = UploadStatus.uploaded,
    //   );

    //   ref.read(pushNotificationsRepoProvider).sendPushNotification(message);
    // });
  }

  Future<void> stopUpload(Message message) async {
    if (message.attachment!.uploadStatus == UploadStatus.notUploading) {
      return;
    }

    // await UploadService.cancelUpload(message.id);
    // await IsarDb.updateMessage(
    //   message.id,
    //   attachment: message.attachment!..uploadStatus = UploadStatus.notUploading,
    // );
  }

  Future<void> downloadAttachment(
    Message message,
    // void Function(TaskSnapshot) onComplete,
    void Function() onError,
  ) async {
    // await DownloadService.download(
    //   taskId: message.id,
    //   url: message.attachment!.url,
    //   path: DeviceStorage.getMediaFilePath(message.attachment!.fileName),
    //   onDownloadComplete: onComplete,
    //   onDownloadError: onError,
    // );
  }

  Future<void> cancelDownload(Message message) async {
    // await DownloadService.cancelDownload(message.id);
  }

  Future<void> compressAttachment(Message message) async {
    // final compressedFile = await CompressionService.compressImage(
    //   message.attachment!.file!,
    // );

    // await compressedFile.copy(
    //   DeviceStorage.getMediaFilePath(
    //     message.attachment!.fileName,
    //   ),
    // );

    // message.attachment!.file = compressedFile;
    // message.attachment!.fileSize = await compressedFile.length();
    // message.attachment!.fileExtension = compressedFile.path.split('.').last;
  }

  Future<void> markMessageAsSeen(Message message) async {
    // ref
    //     .read(firebaseFirestoreRepositoryProvider)
    //     .sendSystemMessage(
    //       message: SystemMessage(
    //         targetId: message.id,
    //         action: MessageAction.statusUpdate,
    //         update: MessageStatus.seen.value,
    //       ),
    //       receiverId: message.senderId,
    //     )
    //     .then((value) {
    //   IsarDb.updateMessage(message.id, status: MessageStatus.seen);
    // });
  }
  final ImagePicker picker = ImagePicker();

  Future<void> navigateToCameraView(
      {required ImageSource imageSource,
      required Function(String url) onUploadDone}) async {
    try {
      final XFile? image =
          await picker.pickImage(source: imageSource, imageQuality: 100);
      if (image == null) {
        return;
      }
      final fileExtension = p.extension(image.path).replaceAll('.', '');
      if (fileExtension != 'png' &&
          fileExtension != 'jpg' &&
          fileExtension != 'jpeg') {
        navigator.showErrorSnackBar("định dạng ảnh không được hỗ trợ");
      }
      final file = compressAndResizeImage(File(image.path));
      var fileUpload = await MultipartFile.fromFile(
        file.path,
        contentType: MediaType("image", "jpg"),
        filename: file.path.split('/').last,
      );
      var formData = FormData.fromMap({});
      emit(state.copyWith(loadingSentImage: true));
      formData.files.add(MapEntry("file", fileUpload));
      // final response = await hanamService.chatUploadFile(body: formData);
      // if (response == null || response.data == null) {
      //   emit(state.copyWith(loadingSentImage: false));

      //   return;
      // }
      // if (response.status == 200) {
      //   final url = response.data!.url;
      //   onUploadDone.call(url);
      //   emit(state.copyWith(loadingSentImage: false));
      // }
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<void> handlePickVideo(
      {required ImageSource imageSource,
      required Function(String url) onUploadDone}) async {
    try {
      final XFile? video = await picker.pickVideo(source: imageSource);
      if (video == null) {
        return;
      }
      final fileExtension = p.extension(video.path).replaceAll('.', '');

      final file = File(video.path);
      var fileUpload = await MultipartFile.fromFile(
        file.path,
        contentType: MediaType(fileExtension, ""),
        filename: file.path.split('/').last,
      );
      print("file extension $fileExtension");
      onUploadDone.call(
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4");

      // var formData = FormData.fromMap({});
      // emit(state.copyWith(loadingSentImage: true));
      // formData.files.add(MapEntry("file", fileUpload));
      // final response = await hanamService.chatUploadFile(body: formData);
      // if (response == null || response.data == null) {
      //   emit(state.copyWith(loadingSentImage: false));

      //   return;
      // }
      // if (response.status == 200) {
      //   final url = response.data!.url;
      //   onUploadDone.call(url);
      //   emit(state.copyWith(loadingSentImage: false));
      // }
    } catch (e) {
      print(e);
      return;
    }
  }

  File compressAndResizeImage(File file) {
    img.Image? image = img.decodeImage(file.readAsBytesSync());
    int width;
    int height;

    if (image!.width > image.height) {
      width = 1000;
      height = (image.height / image.width * 1000).round();
    } else {
      height = 1000;
      width = (image.width / image.height * 1000).round();
    }

    img.Image resizedImage =
        img.copyResize(image, width: width, height: height);

    // Compress the image with JPEG format
    List<int> compressedBytes =
        img.encodeJpg(resizedImage, quality: 100); // Adjust quality as needed

    // Save the compressed image to a file
    File compressedFile =
        File(file.path.replaceFirst('.jpg', '_compressed.jpg'));
    compressedFile.writeAsBytesSync(compressedBytes);

    return compressedFile;
  }

  Future<List<Attachment>?> pickAttachmentsFromGallery({
    bool returnAttachments = false,
  }) async {
    // if (Platform.isAndroid &&
    //     (!await hasPermission(Permission.storage)) &&
    //     (!await hasPermission(Permission.photos))) {
    //   return null;
    // }

    if (Platform.isAndroid) {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => Gallery(
      //       title: 'Send to $otherUserContactName',
      //     ),
      //   ),
      // );
      return null;
    }

    // final key = showLoading();

    // List<File>? files = await pickMultimedia();
    // if (files == null) {
    // Navigator.pop(key.currentContext!);
    // return null;
    // }

    // final attachments = createAttachmentsFromFiles(files);
    // if (returnAttachments) {
    //   Navigator.pop(key.currentContext!);
    //   return attachments;
    // }

    // if (!mounted) return null;
    // Navigator.pop(key.currentContext!);
    // navigateToAttachmentSender(context, attachments);
    // return null;
  }

  Future<void> pickAudioFiles() async {
    // final key = showLoading(context);

    // List<File>? files = await pickFiles(type: FileType.audio);
    // if (files == null) {
    //   Navigator.pop(key.currentContext!);
    //   return;
    // }

    // final attachments = createAttachmentsFromFiles(files);

    // if (!mounted) return;
    // Navigator.pop(key.currentContext!);
    // navigateToAttachmentSender(context, attachments);
  }

  Future<List<Attachment>?> pickDocuments({
    bool returnAttachments = false,
  }) async {
    // final key = showLoading(context);

    // List<File>? files = await pickFiles(type: FileType.any);
    // if (files == null) {
    //   Navigator.pop(key.currentContext!);
    //   return null;
    // }

    // final attachments = createAttachmentsFromFiles(
    //   files,
    //   areDocuments: true,
    // );

    // if (returnAttachments) {
    //   Navigator.pop(key.currentContext!);
    //   return attachments;
    // }

    // if (!mounted) return null;
    // Navigator.pop(key.currentContext!);
    // navigateToAttachmentSender(context, attachments);
    // return null;
  }

  GlobalKey showLoading(context) {
    final dialogKey = GlobalKey();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          key: dialogKey,
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 24),
              Text(
                'Preparing media',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );

    return dialogKey;
  }

  Future<List<Attachment>> createAttachmentsFromFiles(
    List<File> files, {
    bool areDocuments = false,
  }) async {
    // return await Future.wait(
    //   files.map((file) async {
    //     final type = areDocuments
    //         ? AttachmentType.document
    //         : AttachmentType.fromValue(
    //             lookupMimeType(file.path)?.split("/")[0].toUpperCase() ??
    //                 'DOCUMENT',
    //           );

    //     double? width, height;
    //     if (type == AttachmentType.image) {
    //       (width, height) = await getImageDimensions(File(file.path));
    //     } else if (type == AttachmentType.video) {
    //       (width, height) = await getVideoDimensions(File(file.path));
    //     }

    //     final fileName = file.path.split("/").last;

    //     return Attachment(
    //       type: type,
    //       url: "",
    //       autoDownload:
    //           type == AttachmentType.image || type == AttachmentType.voice,
    //       fileName: fileName,
    //       fileSize: await file.length(),
    //       fileExtension: fileName.split(".").last,
    //       width: width,
    //       height: height,
    //       file: file,
    //     );
    //   }),
    // );

    return [];
  }

  void navigateToAttachmentSender(
    BuildContext context,
    Future<List<Attachment>> attachments,
  ) {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (_) => AttachmentMessageSender(
    //       attachmentsFuture: attachments,
    //     ),
    //   ),
    // );
  }
}
