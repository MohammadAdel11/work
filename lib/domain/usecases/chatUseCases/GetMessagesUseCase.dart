import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:herafi/domain/entites/chat.dart';
import '../../../core/status/error/Failure.dart';
import '../../entites/Message.dart';
import '../../repositories/ChatRepository.dart';

class GetMessagesUseCase {
  final ChatRepository repository;

  GetMessagesUseCase(this.repository);

  Future<Either<Failure, List<Message>>> call(chatEntity chat) async {
    return await repository.getMessages(chat);
  }
}
