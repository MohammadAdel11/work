import 'package:herafi/data/models/userModel.dart';
import 'package:herafi/domain/entites/chat.dart';
import 'package:herafi/domain/entites/user.dart';

import '../../domain/entites/Message.dart';

class chatModel extends chatEntity{

  chatModel({
    required super.user,
    required super.lastMessage,
    required super.missedMessagesCountByMe,
    required super.missedMessagesCountByOther,
    required super.documentId
  });

  // Method to convert Chat object to JSON
  Map<String, dynamic> toJson() {
    return {
      'users': user,
      'lastMessage': lastMessage?.toJson(), // Assuming Message class has a toJson method
      'missedMessagesCountByMe': missedMessagesCountByMe,
      'missedMessagesCountByOther': missedMessagesCountByOther,
    };
  }
  // Method to create a chatModel from JSON
  factory chatModel.fromJson(Map<String, dynamic> json) {
    return chatModel(
      user: UserModel.fromJson(json), // Ensure this maps correctly to your user model if necessary
      lastMessage: json['lastMessage'].isEmpty?null:Message.fromJson(json['lastMessage']), // Assuming Message class has a fromJson method
      missedMessagesCountByMe: json['missedMessagesCountByMe']??0,
      missedMessagesCountByOther: json['missedMessagesCountByOther']??0,
      documentId: json['documentId']
    );
  }
}
