import 'package:herafi/domain/entites/user.dart';

import 'Message.dart';

class chatEntity{
  final String documentId;
  final UserEntity user;
  final Message? lastMessage;
  final int missedMessagesCountByMe;
  final int missedMessagesCountByOther;

  chatEntity({
    required this.user,
    required this.lastMessage,
    required this.missedMessagesCountByMe,
    required this.missedMessagesCountByOther,
    required this.documentId
});
}