import 'package:dartz/dartz.dart';
import 'package:herafi/core/status/error/Failure.dart';
import 'package:herafi/domain/entites/craftsman.dart';

abstract class CraftsmanRepository {
  /// Insert a new craftsman
  Future<Either<Failure, void>> insertCraftsman(CraftsmanEntity craftsman);
  Future<Either<Failure, void>> updateCraftsman(CraftsmanEntity craftsman);

  /// Fetch craftsman by ID
  Future<Either<Failure, CraftsmanEntity>> fetchCraftsmanById(String craftsmanId);
}
