// import 'package:dartz/dartz.dart';
// import 'package:herafi/core/status/error/Failure.dart';
// import 'package:herafi/data/models/craftsmanModel.dart';
// import 'package:herafi/domain/entites/craftsman.dart';
// import 'package:herafi/domain/repositories/craftsmanRepository.dart';
// import '../remotDataSource/craftsmanRemotDataSource.dart';
//
// class CraftsmanRepositoryImpl extends CraftsmanRepository {
//   final CraftsmanRemoteDataSource dataSource;
//
//   CraftsmanRepositoryImpl(this.dataSource);
//
//   @override
//   Future<Either<Failure, void>> insertCraftsman(CraftsmanEntity craftsman) async {
//     try {
//       await dataSource.saveCraftsmanDetails(
//         category: craftsman.category,
//         yearsOfExperience: craftsman.yearsOfExp,
//         name: craftsman.name,
//         location: craftsman.location, phoneNumber: '',
//       );
//       return const Right(null);
//     } catch (error) {
//       return Left(ServerFailure(error.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, CraftsmanEntity>> fetchCraftsmanById(String craftsmanId) async {
//     try {
//       final data = await dataSource.fetchCraftsmanDetails(craftsmanId);
//       final craftsmanModel = CraftsmanModel.fromJson(data!);
//       return Right(craftsmanModel);
//     } catch (error) {
//       return Left(ServerFailure(error.toString()));
//     }
//   }
// }
