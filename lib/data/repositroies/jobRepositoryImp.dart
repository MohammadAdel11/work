import 'package:dartz/dartz.dart';
import 'package:herafi/core/status/error/Failure.dart';
import 'package:herafi/data/remotDataSource/jobRemotDataSource.dart';
import 'package:herafi/domain/entites/job.dart';
import 'package:herafi/domain/repositories/jobRepository.dart';

class JobRepositoryImpl extends JobRepository {
  final JobRemoteDataSource dataSource;

  JobRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, void>> insertJob(JobEntity job) async {
    try {
      await dataSource.insertJobData(
        id: job.id,
        createdAt: job.createdAt,
        category: job.category,
        location: job.location,
        description: job.description,
        startDate: job.startDate,
        cost: job.cost,
        endDate: job.endDate,
        status: job.status,
      );
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
