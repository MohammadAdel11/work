import 'package:dartz/dartz.dart';
import 'package:herafi/core/status/error/Failure.dart';
import 'package:herafi/domain/repositories/craftsmanRepository.dart';
import '../../domain/entites/craftsman.dart';
import '../remotDataSource/craftsmanRemotDataSource.dart';

class CraftsmanRepositoryImpl extends CraftsmanRepository {
  final CraftsmanRemoteDataSource dataSource;

  CraftsmanRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, void>> insertCraftsman(CraftsmanEntity craftsman) async {
    try {
      await dataSource.saveCraftsmanDetails(
        category: craftsman.category,
        yearsOfExperience: craftsman.yearsOfExp,
        name: craftsman.name,
        location: craftsman.location,
        phoneNumber: craftsman.phoneNumber,
        dateOfBirth: craftsman.dateOfBirth,
      );
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCraftsman(CraftsmanEntity craftsman) async {
    try {
      await dataSource.updateCraftsmanDetails(
        id: craftsman.id,
        name: craftsman.name,
        location: craftsman.location,
        dateOfBirth: craftsman.dateOfBirth,
        yearsOfExperience: craftsman.yearsOfExp,
        category: craftsman.category,
        image: craftsman.image,
      );
      return const Right(null);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
@override
Future<Either<Failure, CraftsmanEntity>> fetchCraftsmanById(String craftsmanId) async {
  try {
    final data = await dataSource.fetchCraftsmanDetails(craftsmanId);
    if (data == null) throw Exception('Craftsman not found.');

    final craftsmanModel = CraftsmanEntity(
      id: data['id'], // ID from craftsman table
      name: data['name'], // From users table
      location: data['location'], // From users table
      phoneNumber: data['phone_number'], // From users table
      userType: data['user_type'], // From users table
      dateOfBirth: DateTime.parse(data['date_of_birth']), // From users table
      createdAt: DateTime.now(), // Replace with actual field if needed
      image: data['image'] ?? '', // From users table
      category: data['category'], // From craftsman table
      yearsOfExp: data['years_of_experience'], // From craftsman table
    );

    return Right(craftsmanModel);
  } catch (error) {
    return Left(ServerFailure(error.toString()));
  }
}

}
