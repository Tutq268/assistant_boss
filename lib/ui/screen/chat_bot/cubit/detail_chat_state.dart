import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hanam/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hanam/ui/screen/chat_bot/model/message_model.dart';

part 'detail_chat_state.freezed.dart';

@freezed
class DetailChatState extends BaseState with _$DetailChatState {
  const factory DetailChatState(
      {@Default(false) bool hideElements,
      TextEditingController? messageController,
      FocusNode? fieldFocusNode,
      @Default(false) bool showScrollBtn,
      @Default(0) int unreadCount,
      MessageModel? conversationInfo,
      @Default([]) List<MessageItemModel> messages,
      @Default(null) String? wattingMessageId,
      @Default(true) bool isWattingMessage,
      @Default(false) bool showEmojiPicker,
      @Default(false) bool loadingSentImage,
      @Default(false) bool isLoading}) = _DetailChatState;
}
