// import 'package:dartz/dartz.dart';
// import 'package:herafi/core/status/error/Failure.dart';
// import 'package:herafi/data/models/WorkModel.dart';
// import 'package:herafi/data/remotDataSource/WorksRemoteDataSource.dart';
// import 'package:herafi/domain/entites/work.dart';
// import 'package:herafi/domain/repositories/WorksRepository.dart';

// class WorksRepositoryImpl extends WorksRepository {
//   final WorksRemoteDataSource remoteDataSource;

//   WorksRepositoryImpl(this.remoteDataSource);

//   @override
//   Future<Either<Failure, List<WorkEntity>>> fetchWorks(String craftsmanId) async {
//     try {
//       // Fetch works from the remote data source and map them to WorkEntity
//       final works = await remoteDataSource.fetchWorks(craftsmanId);
//       return Right(works.map((work) => WorkModel.fromJson(work.toJson())).toList());
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> insertWork(WorkEntity work) async {
//     try {
//       // Convert WorkEntity to WorkModel
//       final workModel = WorkModel(
//         id: work.id,
//         craftsmanId: work.craftsmanId,
//         image: work.image,
//         title: work.title,
//         description: work.description,
//         createdAt: work.createdAt,
//       );

//       await remoteDataSource.insertWork(workModel);
//       return const Right(null);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }