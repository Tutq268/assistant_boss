import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_cubit.dart';
import 'package:hanam/ui/screen/chat_bot/cubit/detail_chat_state.dart';


class ChatInputMic extends StatelessWidget {
  const ChatInputMic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final recordingState = ref.watch(
    //   chatControllerProvider.select((s) => s.recordingState),
    // );

    return BlocBuilder<DetailChatCubit, DetailChatState>(
      builder: (context, state) {
        return GestureDetector(
          onLongPress: () {
            // ref.read(chatControllerProvider.notifier).startRecording,
          },
          onLongPressUp: () {
            // if (recordingState == RecordingState.notRecording) {
            //   return;
            // }
            // ref.read(chatControllerProvider.notifier).onRecordingDone();
          },
          onLongPressMoveUpdate: (details) async {
            // ref.read(chatControllerProvider.notifier).onMicDragLeft(
            //       details.globalPosition.dx,
            //       MediaQuery.of(context).size.width,
            //     );

            // ref.read(chatControllerProvider.notifier).onMicDragUp(
            //       details.globalPosition.dy,
            //       MediaQuery.of(context).size.height,
            //     );
          },
          child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 24.sp,
                        backgroundColor: AppColors.backGroundColor,
                        child: const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CircleAvatar(
                        radius: 24.sp,
                        backgroundColor: Colors.green,
                        child: const Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
