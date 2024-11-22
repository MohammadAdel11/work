import 'package:herafi/domain/repositories/userRepository.dart';

class fetchUserDataUseCase{
  final UserRepository userRepos;
  fetchUserDataUseCase({required this.userRepos});
  Future call({required String userId})async{
    return userRepos.fetchUserData(userId: userId);
  }
}