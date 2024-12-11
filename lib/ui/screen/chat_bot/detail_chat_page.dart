import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hanam/data/constant/server/url_constants.dart';
import 'package:hanam/resource/dimens/dimens.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_cubit.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_state.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';
import 'package:hanam/ui/screen/chat_bot/widget_secondary/chat_date.dart';
import 'package:hanam/ui/screen/chat_bot/widget_secondary/chat_field.dart';
import 'package:hanam/ui/screen/chat_bot/widget_secondary/message_cards.dart';
import 'package:hanam/ui/screen/chat_bot/widget_secondary/scroll_btn.dart';
import 'package:hanam/ui/screen/chat_bot/widgets/attachment_picker.dart';
import 'package:hanam/ui/screen/chat_bot/widgets/bottom_inset.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hanam/data/preference/app_preferences.dart';
import 'package:hanam/foundation/utils/attachment_utils.dart';
import 'package:hanam/foundation/utils/permission_helpers.dart';
import 'package:hanam/resource/generated/assets.gen.dart';
import 'package:hanam/ui/di/di.dart';
import 'package:hanam/ui/navigation/app_navigator.dart';
import 'package:hanam/ui/navigation/app_popup_info.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/resource/styles/app_text_styles.dart';

import 'package:hanam/ui/share/dialog/app_dialog/app_dialog.dart';
import 'package:hanam/ui/share/loading/common_loading.dart';

import 'package:hanam/ui/share/scaffold/base_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanam/ui/share/scaffold/base_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:file_picker/file_picker.dart';

@RoutePage()
class DetailChatPage extends StatefulWidget {
  final String conversationId;

  const DetailChatPage({
    super.key,
    required this.conversationId,
  });

  @override
  DetailChatPageState createState() => DetailChatPageState();
}

class DetailChatPageState
    extends BasePageState<DetailChatPage, DetailChatCubit> {
  late IO.Socket socket;

  @override
  void initState() {
    connectSocket();
    cubit.initData();
    super.initState();
  }

  Future<void> connectSocket() async {
    final token = await getIt.get<AppPreferences>().accessToken;

    final options = IO.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .setAuth({})
        .build();
    socket = IO.io(UrlConstants.appApiBaseUrl, options);
    socket.on('connect', (_) {
      print('SocketIO Connected');
      socket.emit("message", "hello a");
    });

    socket.on("message", (message) {
      print("value $message");
      final newMessage =
          MessageItemModel.fromJson(json.decode(message.toString()));

      cubit.onUpdateMessageItem(newMessage);
    });
    socket.on('disconnect', (_) {
      print('Disconnected');
    });

    socket.connect();
  }

  @override
  void dispose() async {
    socket.emit("leave-conversation", widget.conversationId);
    socket.disconnect();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey();

  @override
  Widget buildPage(BuildContext context) {
    return Platform.isAndroid
        ? PopScope(
            canPop: true,
            onPopInvoked: (didPop) async {
              // if (!state.showEmojiPicker) {
              //   navigator.pop();
              //   return;
              // }
              // navigator.pop();
            },
            child: _build(context),
          )
        : _build(context);
  }

  Widget _build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocBuilder<DetailChatCubit, DetailChatState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return BaseScreen(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 32.h),
                  child: CommonLoading(
                      containerHeight: 42.w, containerWidth: 42.w),
                ),
              ),
            );
          }
          if (state.conversationInfo == null) {
            return Container();
          }
          final currentUser = appCubit.state.currentUser;
          if (currentUser == null) {
            return Container();
          }
          // final recordingState = state.recordingState;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldkey,
            drawer: renderDrawer(),
            appBar: AppBar(
              titleSpacing: 0.0,
              backgroundColor: Color(0xff1B1B1D),
              title: GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Trợ lý AI cho lãnh đạo tỉnh",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.s14w500Primary()
                              .copyWith(color: Colors.white)),
                    )
                  ],
                ),
              ),
              leadingWidth: 36.h,
              leading: IconButton(
                onPressed: () {
                  _scaffoldkey.currentState?.openDrawer();
                },
                icon: Icon(
                  Ionicons.list_outline,
                  size: 24.sp,
                  color: Colors.white.withOpacity(.48),
                ),
              ),
              actions: [
                Container(
                  width: 36.w,
                )
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: AppColors.backGroundColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Platform.isIOS
                        ? GestureDetector(
                            onTap: () {
                              SystemChannels.textInput.invokeMethod(
                                "TextInput.hide",
                              );
                              cubit.setShowEmojiPicker(false);
                            },
                            child: ChatStream(
                              messages: state.messages,
                              cubit: cubit,
                            ),
                          )
                        : ChatStream(
                            messages: state.messages,
                            cubit: cubit,
                          ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  ChatInputContainer(cubit: cubit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget renderDrawer() {
    return BlocBuilder<DetailChatCubit, DetailChatState>(
      builder: (context, state) {
        return SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Drawer(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimens.d16.w, vertical: 40.h),
                    decoration: BoxDecoration(color: Colors.black),
                    child: Column(children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          _scaffoldkey.currentState?.closeDrawer();
                          if (state.messages.isEmpty) {
                            return;
                          } else {
                            cubit.initData();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 16.h),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.w, color: Colors.white24))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Ionicons.create_outline,
                                size: 23.sp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2.h),
                                child: Text(
                                  "Đoạn chat mới",
                                  style: AppTextStyles.s14w600Primary()
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: state.listConversation.length,
                            itemBuilder: (ctx, index) {
                              final item = state.listConversation[index];
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  _scaffoldkey.currentState?.closeDrawer();
                                  if (state.conversationInfo?.id == item.id) {
                                    return;
                                  } else {
                                    cubit.getListMessageByConversationId(
                                        item: item);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.getName,
                                    style: AppTextStyles.s14w500Primary()
                                        .copyWith(
                                            color: state.conversationInfo?.id ==
                                                    item.id
                                                ? Colors.white70
                                                : Colors.white54),
                                  ),
                                ),
                              );
                            }),
                      )
                    ]))));
      },
    );
  }
}

class ChatInputContainer extends StatefulWidget {
  const ChatInputContainer({super.key, required this.cubit});

  final DetailChatCubit cubit;

  @override
  ChatInputContainerState createState() => ChatInputContainerState();
}

class ChatInputContainerState extends State<ChatInputContainer>
    with WidgetsBindingObserver {
  // double keyboardHeight = getIt.get<AppPreferences>().getKeyboardHeight;
  bool isKeyboardVisible = false;
  late final StreamSubscription<bool> _keyboardSubscription;

  @override
  void initState() {
    _keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((isVisible) async {
      isKeyboardVisible = isVisible;
      if (isVisible) {
        widget.cubit.setShowEmojiPicker(false);
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    _keyboardSubscription.cancel();
  }

  void switchKeyboards() async {
    final showEmojiPicker = widget.cubit.state.showEmojiPicker;

    if (!showEmojiPicker && !isKeyboardVisible) {
      widget.cubit.setShowEmojiPicker(true);
    } else if (showEmojiPicker) {
      widget.cubit.state.fieldFocusNode?.requestFocus();
      SystemChannels.textInput.invokeMethod('TextInput.show');
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted || showEmojiPicker) return;
        widget.cubit.setShowEmojiPicker(false);
      });
    } else if (isKeyboardVisible) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      widget.cubit.setShowEmojiPicker(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hideElements = widget.cubit.state.hideElements;
    final showEmojiPicker = widget.cubit.state.showEmojiPicker;

    return AvoidBottomInset(
        padding: EdgeInsets.only(bottom: Platform.isAndroid ? 4.h : 24.h),
        conditions: [showEmojiPicker],
        // offstage: Offstage(
        //   offstage: !showEmojiPicker,
        //   child: CustomEmojiPicker(
        //     afterEmojiPlaced: (emoji) => widget.cubit.onTextChanged(emoji.emoji),
        //     textController: widget.cubit.state.messageController!,
        //   ),
        // ),
        child: BlocBuilder<DetailChatCubit, DetailChatState>(
          builder: (context, state) {
            return Container(
              color: const Color(0xff1B1B1D),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              color: const Color(0xff1B1B1D)),
                          // child: recordingState == RecordingState.notRecording
                          //     ? _buildChatField(
                          //         showEmojiPicker, context, hideElements)
                          //     : VoiceRecorderField(
                          //         cubit: widget.cubit,
                          //       ),
                          child: _buildChatField(
                              showEmojiPicker,
                              context,
                              state.isWattingMessage == true
                                  ? true
                                  : hideElements)),
                    ),
                    state.isWattingMessage
                        ? Icon(
                            Ionicons.radio_button_on_outline,
                            size: 23.sp,
                            color: Colors.grey,
                          )
                        : hideElements
                            ? InkWell(
                                onTap: () async {
                                  if (widget.cubit.state.conversationInfo ==
                                      null) {
                                    return;
                                  }
                                  widget.cubit.onSendBtnPressed();
                                },
                                child: Icon(
                                  Ionicons.send_outline,
                                  color: AppColors.white90,
                                  size: 22.sp,
                                ),
                              )
                            : Container()
                    // : const ChatInputMic(),
                  ],
                ),
              ),
            );
          },
        ));
  }

  ChatField _buildChatField(
      bool showEmojiPicker, BuildContext context, bool hideElements) {
    return ChatField(
        leading: GestureDetector(
          onTap: switchKeyboards,
        ),
        focusNode: widget.cubit.state.fieldFocusNode,
        onTextChanged: (value) => widget.cubit.onTextChanged(value),
        textController: widget.cubit.state.messageController!,
        actions: [
          // if (!hideElements) ...[
          //   InkWell(
          //     onTap: () {
          //       onAttachmentsIconPressed(
          //         context,
          //       );
          //     },
          //     child: Transform.rotate(
          //         angle: -0.8, child: Assets.images.chat.attackIcon.svg()),
          //   )
          // ],
          if (!hideElements) ...[
            InkWell(
              onTap: () async {
                widget.cubit.pickFileWithPermission();
              },
              child: Icon(
                Ionicons.document_attach_outline,
                size: 24.sp,
                color: AppColors.white90,
              ),
            ),
          ],
        ]);
  }

  void onAttachmentsIconPressed(BuildContext context) {
    final focusNode = widget.cubit.state.fieldFocusNode;
    focusNode?.unfocus();
    Future.delayed(
      Duration(
        milliseconds: MediaQuery.of(context).viewInsets.bottom > 0 ? 200 : 0,
      ),
      () async {
        if (!mounted) return;
        getIt.get<AppNavigator>().showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: AppColors.backGroundColor,
            AppPopupInfo.blankBottomSheet(
                renderData: Wrap(children: [
              AppDialog(
                  isShowBottomAction: false,
                  title: null,
                  content: AttachmentPicker(
                    onCamera: () async {
                      Navigator.pop(context);

                      final cameraPermission =
                          await PermissionHelpers.requestCameraPermission(
                              context);
                      if (cameraPermission == true) {
                      } else {
                        print("loi cmnr");
                      }
                    },
                    onGallery: () async {
                      Navigator.pop(context);
                      final cameraPermission =
                          await PermissionHelpers.requestCameraPermission(
                              context);
                      if (cameraPermission == true) {
                        widget.cubit.navigateToCameraView(
                            imageSource: ImageSource.gallery,
                            onUploadDone: (String url) {
                              if (widget.cubit.state.conversationInfo == null) {
                                return;
                              }
                            });
                      } else {
                        print("loi cmnr");
                      }
                    },
                    onAttachment: () async {
                      Navigator.pop(context);
                      await Permission.photos.request();
                      final cameraPermission =
                          await PermissionHelpers.requestPhotoPermission(
                              context);
                      if (cameraPermission == true) {
                        widget.cubit.handlePickVideo(
                            imageSource: ImageSource.gallery,
                            onUploadDone: (String url) {
                              if (widget.cubit.state.conversationInfo == null) {
                                return;
                              }

                              // final Map<String, dynamic> messageSent = {
                              //   "senderId": userId,
                              //   "senderName": "User $userId",
                              //   "text": "",
                              //   "attachment": [
                              //     {"type": "video", "url": url}
                              //   ],
                              //   "conversationId":
                              //       widget.cubit.state.conversationInfo!.id
                              // };
                              // widget.socket
                              //     .emit("message", json.encode(messageSent));
                            });
                      } else {
                        print("loi");
                      }
                    },
                  ))
            ])));
      },
    );
  }
}

class ChatStream extends StatefulWidget {
  const ChatStream({super.key, required this.cubit, required this.messages});
  final DetailChatCubit cubit;
  final List<MessageItemModel> messages;

  @override
  ChatStreamState createState() => ChatStreamState();
}

class ChatStreamState extends State<ChatStream> {
  late final String chatId;
  late final ScrollController scrollController;
  late StreamController<List<MessageItemModel>> _messageController;
  Stream<List<MessageItemModel>> get messageStream => _messageController.stream;

  // late Stream<List<MessageItemModel>> messageStream;
  bool isInitialRender = true;
  int unreadCount = 0;
  int prevMsgCount = 0;
  final bannerKey = GlobalKey();

  @override
  void initState() {
    _messageController = StreamController<List<MessageItemModel>>.broadcast();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _messageController.add(widget.cubit.state.messages);
    });
    scrollController = ScrollController();
    super.initState();
  }

  void handleNewMessage(MessageModel message) {
    // if (message.senderId == self.id) {
    //   unreadCount = 0;
    //   if (message.status == MessageStatus.pending) {
    //     scrollToBottom();
    //   }
    // } else {
    //   unreadCount = unreadCount > 0 ? unreadCount + 1 : 0;
    // }
  }

  void handleInitialData(int unreadMsgCount) {
    isInitialRender = false;
    unreadCount = unreadMsgCount;

    if (unreadCount > 0) {
      scrollToUnreadBanner();
    }
  }

  // int updateUnreadCount(List<MessageModel> messages) {
  //   int unreadCount = 0;

  //   for (final message in messages) {
  //     // if (message.senderId == self.id) break;
  //     if (message.status == MessageStatus.seen) break;
  //     unreadCount++;
  //   }

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     widget.cubit.setUnreadCount(unreadCount);
  //   });

  //   return unreadCount;
  // }

  void scrollToUnreadBanner() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Scrollable.ensureVisible(
        bannerKey.currentContext!,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    });
  }

  // void markAsSeen(MessageModel message) {
  //   // if (message.senderId == self.id) return;
  //   if (message.status == MessageStatus.seen) return;
  //   widget.cubit.markMessageAsSeen(message);
  // }

  int getMessageIndexByKey(Key key, List<MessageItemModel> messages) {
    final messageKey = key as ValueKey;
    return messages.indexWhere((msg) => msg.id == messageKey.value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailChatCubit, DetailChatState>(
      listener: (context, state) {
        _messageController.add(widget.cubit.state.messages);
      },
      buildWhen: (previous, current) =>
          previous.messages.length != current.messages.length,
      builder: (context, state) {
        return StreamBuilder<List<MessageItemModel>>(
          stream: _messageController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            final messages = snapshot.data!;
            // final unreadMsgCount = updateUnreadCount(messages);
            if (isInitialRender) {
              // handleInitialData(unreadMsgCount);
            } else if (messages.length - prevMsgCount > 0) {
              // handleNewMessage(messages.first);
            }
            prevMsgCount = messages.length;
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(color: Colors.transparent),
                Container(
                  margin: EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                      bottom: widget.cubit.state.loadingSentImage == true
                          ? MediaQuery.of(context).size.width * .4 + 16
                          : 0),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    reverse: true,
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverList.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return buildMessageCard(index, messages);
                        },
                        findChildIndexCallback: (key) {
                          return getMessageIndexByKey(key, messages);
                        },
                      ),
                      SliverToBoxAdapter(
                        child: widget.cubit.state.messages.isEmpty
                            ? Container()
                            : Center(
                                child: ChatDate(
                                  date: messages.isEmpty
                                      ? 'Today'
                                      : dateFromTimestamp(
                                          messages.last.createdAt ??
                                              DateTime.now()),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ScrollButton(
                    scrollController: scrollController,
                    cubit: widget.cubit,
                  ),
                ),
                Visibility(
                  visible: widget.cubit.state.messages.isEmpty,
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.chat.noDataFound
                          .image(width: 180.w, height: 180.w),
                    ],
                  )),
                ),
                Visibility(
                  visible: false,
                  child: Text(
                    widget.cubit.state.messages.length.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                widget.cubit.state.loadingSentImage == true
                    ? Positioned(
                        right: 16.w,
                        bottom: 10.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.4),
                            highlightColor: Colors.grey.withOpacity(0.2),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .6,
                              height: MediaQuery.of(context).size.width * .4,
                              color: Colors.white,
                            ),
                          ),
                        ))
                    : Container(),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildMessageCard(int index, List<MessageItemModel> messages) {
    final message = messages[index];
    print(message.question);
    // final isFirstMsg = index == messages.length - 1;
    // final isSpecial =
    //     isFirstMsg || messages[index].senderId != messages[index + 1].senderId;
    // final currMsgDate = messages[index].createdAt == null
    //     ? 'Today'
    //     : dateFromTimestamp(messages[index].createdAt!);
    // final showDate = isFirstMsg ||
    //     currMsgDate !=
    //         dateFromTimestamp(messages[index + 1].createdAt ?? DateTime.now());
    // return Container();
    return Column(
      key: ValueKey(message.id),
      children: [
        VisibilityDetector(
          key: ValueKey(message.id),
          onVisibilityChanged: (info) {
            if (info.visibleFraction < 0.1) return;
            // markAsSeen(message);
          },
          child: MessageCard(
            message: message,
            onDoneAnimation: () {
              widget.cubit.continueQuestion();
            },
            isAnimationText: widget.cubit.state.wattingMessageId == message.id
                ? true
                : false,
            isLoading: message.answer == "" &&
                widget.cubit.state.isWattingMessage == true,
          ),
        ),
      ],
    );
  }
}
