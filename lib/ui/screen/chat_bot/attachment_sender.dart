import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hanam/data/model/account/account_model.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_cubit.dart';
import 'package:hanam/ui/screen/chat_bot/model/attachement.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:hanam/ui/screen/chat_bot/widget_secondary/chat_field.dart';
import 'package:hanam/ui/screen/chat_bot/widgets/attachment_renderers.dart';
import 'package:hanam/ui/screen/chat_bot/widgets/bottom_inset.dart';
import 'package:uuid/uuid.dart';

class AttachmentMessageSender extends StatefulWidget {
  const AttachmentMessageSender(
      {super.key,
      required this.attachmentsFuture,
      this.tags,
      required this.cubit});

  final List<ChatAttachmentModel> attachmentsFuture;
  final List<String>? tags;
  final DetailChatCubit cubit;

  @override
  AttachmentMessageSenderState createState() => AttachmentMessageSenderState();
}

class AttachmentMessageSenderState extends State<AttachmentMessageSender> {
  late AccountModel self;
  late AccountModel other;
  late Attachment current;
  late List<TextEditingController> controllers;
  late List<Attachment> attachments;
  late StreamSubscription<bool> keyboardListener;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    keyboardListener = KeyboardVisibilityController().onChange.listen(
      (event) {
        if (!mounted) return;
        setState(() {
          isKeyboardVisible = event;
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    keyboardListener.cancel();
    for (var controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  // Future<void> awaitAttachments() async {
  //   attachments = [...(await widget.attachmentsFuture)];
  //   controllers = attachments.map((_) => TextEditingController()).toList();
  //   current = attachments[0];
  // }

  Future<void> addNewAttachments() async {
    List<Attachment>? newAttachments;
    if (current.type == AttachmentType.document) {
      newAttachments = await widget.cubit.pickDocuments(
        returnAttachments: true,
      );
    } else {
      if (Platform.isAndroid) {
        Navigator.pop(context, attachments);
        return;
      }
      newAttachments = await widget.cubit.pickAttachmentsFromGallery(
        returnAttachments: true,
      );
    }

    if (newAttachments == null) return;
    setState(() {
      attachments.addAll(newAttachments!);
      controllers.addAll(
        List.generate(
          newAttachments.length,
          (_) => TextEditingController(),
        ),
      );
    });
  }

  Future<void> sendAttachments() async {
    for (var i = 0; i < controllers.length; i++) {
      final attachment = attachments[i];

      String messageId = const Uuid().v4();
      String msgContent = controllers[i].text.trim();
      if (msgContent.isEmpty && attachment.type == AttachmentType.document) {
        msgContent = "\u00A0";
      }

      // await attachment.file!.copy(
      //   DeviceStorage.getMediaFilePath(
      //     attachment.fileName,
      //   ),
      // );

      // ref.read(chatControllerProvider.notifier).sendMessageWithAttachments(
      //       Message(
      //         id: messageId,
      //         content: msgContent,
      //         status: MessageStatus.pending,
      //         senderId: self.id,
      //         receiverId: other.id,
      //         timestamp: Timestamp.now(),
      //         attachment: attachment..uploadStatus = UploadStatus.uploading,
      //       ),
      //     );
    }

    if (!mounted) return;
    // Navigator.pop(context);
    Navigator.of(context).popUntil((route) => route.settings.name == 'chat');
  }

  void removeSelectedAttachment() {
    if (attachments.length == 1) {
      Navigator.pop(context, []);
      return;
    }
    setState(() {
      final idx = attachments.indexOf(current);
      attachments.removeAt(idx);
      controllers[idx].dispose();
      controllers.removeAt(idx);

      if (widget.tags != null) {
        widget.tags!.removeAt(idx);
      }

      current = attachments.first;
    });
  }

  void selectAttachment(Attachment attachment) {
    setState(() {
      current = attachment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }

          Navigator.of(context).pop(attachments);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.backGroundColor
              : const Color.fromARGB(236, 225, 233, 235),
          body: Stack(children: [
            Stack(
              children: [
                Center(
                  child: KeyboardDismissOnTap(
                    child: widget.tags != null
                        ? Hero(
                            tag: widget.tags![attachments.indexOf(current)],
                            child: AttachmentRenderer(
                              attachment: widget.attachmentsFuture![0].url,
                              // attachmentType: currentType,
                              attachmentType: "image",
                              fit: BoxFit.contain,
                              controllable: true,
                            ),
                          )
                        : AttachmentRenderer(
                            attachment: widget.attachmentsFuture![0].url,
                            // attachmentType: currentType,
                            attachmentType: "image",
                            fit: BoxFit.contain,
                            controllable: true,
                          ),
                  ),
                ),
                AvoidBottomInset(
                  conditions: const [false],
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(),
                          Offstage(
                            offstage: isKeyboardVisible,
                            child: Preview(
                              attachmentsFuture: widget.attachmentsFuture,
                              onAttachmentClicked: selectAttachment,
                              onDeleteClicked: removeSelectedAttachment,
                            ),
                          ),
                          Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ChatField(
                                textController:
                                    controllers[attachments.indexOf(current)],
                                leading: GestureDetector(
                                  onTap: addNewAttachments,
                                  child: Icon(
                                    Icons.add_box_rounded,
                                    size: 24.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                actions: [
                                  GestureDetector(
                                    child:
                                        const Icon(Icons.hide_source_rounded),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              color: const Color.fromARGB(152, 0, 0, 0),
                              padding: const EdgeInsets.only(
                                top: 12.0,
                                bottom: 32,
                                left: 12,
                                right: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? AppColors.primaryColor
                                            : const Color.fromARGB(
                                                255, 242, 251, 254),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text("get full name"),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: sendAttachments,
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                      child: const Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}

class Preview extends StatelessWidget {
  const Preview({
    super.key,
    required this.attachmentsFuture,
    required this.onDeleteClicked,
    required this.onAttachmentClicked,
  });

  final List<ChatAttachmentModel> attachmentsFuture;
  final VoidCallback onDeleteClicked;
  final Function(Attachment) onAttachmentClicked;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: SizedBox(
          height: 60,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: attachmentsFuture.length,
            itemBuilder: (context, idx) {
              final attachment = attachmentsFuture[idx];
              final attachmentType = attachment.type;

              return Center(
                child: GestureDetector(
                    // onTap: () => onAttachmentClicked(attachment),
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: AttachmentRenderer(
                              attachment: attachmentsFuture[0].url,
                              attachmentType: attachmentType,
                              fit: BoxFit.cover,
                              compact: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              );
            },
            separatorBuilder: (context, idx) {
              return const SizedBox(width: 6);
            },
          ),
        ),
      ),
    );
  }
}
