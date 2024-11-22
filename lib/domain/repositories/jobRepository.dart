import 'package:dartz/dartz.dart';
import 'package:herafi/core/status/error/Failure.dart';
import 'package:herafi/domain/entites/job.dart';

abstract class JobRepository {
  Future<Either<Failure, void>> insertJob(JobEntity job);
}
