import 'package:dartz/dartz.dart';
import 'package:herafi/data/models/userModel.dart';
import 'package:herafi/data/remotDataSource/userDataSource.dart';
import 'package:herafi/domain/repositories/userRepository.dart';

import '../../core/status/error/Failure.dart';
import '../../domain/entites/user.dart';

class userRepositoryImp extends UserRepository{
  final userRemotDataSource dataSource=userRemotDataSource();


  Future<Either<Failure,UserEntity?>> fetchUserData({required String userId})async{
    try{
      final result=await dataSource.fetchUserData(userId: userId);
      if(result.isEmpty){
        return Right(null);
      }
      else{
        return Right(UserModel.fromJson(result.first));
      }


    }
    catch(e){
      return Left(DatabaseFailure(e.toString()));
    }
  }
}