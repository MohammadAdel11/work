import 'package:dartz/dartz.dart';
import '../../../core/status/error/Failure.dart';
import '../../entites/Message.dart';
import '../../repositories/ChatRepository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<Either<Failure, void>> execute(Message message) async {
    return await repository.sendMessage(message);
  }
}
