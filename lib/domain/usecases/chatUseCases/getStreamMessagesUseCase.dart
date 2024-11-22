import 'package:dartz/dartz.dart';

import '../../../core/status/error/Failure.dart';
import '../../entites/Message.dart';
import '../../entites/chat.dart';
import '../../repositories/ChatRepository.dart';

class getStreamMessagesUseCase{
  final ChatRepository repository;

  getStreamMessagesUseCase(this.repository);

  Future<Either<Failure, Stream<List<Message>>>> call(chatEntity chat) async {
    return await repository.getStreamMessages(chat);
  }
}