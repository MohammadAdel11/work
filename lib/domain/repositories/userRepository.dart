import 'package:dartz/dartz.dart';
import 'package:herafi/core/status/error/Failure.dart';
import 'package:herafi/domain/entites/user.dart';

abstract class UserRepository{
  Future<Either<Failure,UserEntity?>> fetchUserData({required String userId});
}