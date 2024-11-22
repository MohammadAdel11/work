import 'package:dartz/dartz.dart';
import 'package:herafi/domain/entites/chat.dart';

import '../../../core/status/error/Failure.dart';
import '../../repositories/ChatRepository.dart';

class fetchUserChatsUseCase{
  final ChatRepository repository;

  fetchUserChatsUseCase(this.repository);

  Future<Either<Failure, List<chatEntity>>> call({required String userId}) async {
    return await repository.fetchChats(userId);
  }
}