import 'package:hanam/data/model/account/account_model.dart';
import 'package:hanam/ui/screen/chat_bot/model/message.dart';

class RecentChat {
  final Message message;
  final AccountModel user;
  int unreadCount;

  RecentChat({
    required this.message,
    required this.user,
    this.unreadCount = 0,
  });

  factory RecentChat.fromMap(Map<String, dynamic> chatData) {
    return RecentChat(
      message: Message.fromMap(chatData['message']),
      user: AccountModel.fromJson(chatData['user']),
      unreadCount: chatData['unreadCount'],
    );
  }

  @override
  String toString() {
    return 'Recent Chat => ${message.content}';
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message.toMap(),
      'user': user.toJson(),
      'unreadCount': unreadCount,
    };
  }
}
