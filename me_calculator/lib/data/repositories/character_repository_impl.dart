import 'package:dartz/dartz.dart';
import 'package:me_calculator/core/errors/failure.dart';
import 'package:me_calculator/data/datasources/firebase/firestore_datasource.dart';
import 'package:me_calculator/domain/entities/my_character.dart';
import 'package:me_calculator/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final FirestoreDatasource storeDatasource;

  CharacterRepositoryImpl(this.storeDatasource);

  @override
  Future<Either<Failure, List<MyCharacter>>> getUserCharacters(
    String userId,
  ) async {
    try {
      final charactersModel = await storeDatasource.getUserCharacters(userId);
      return Right(charactersModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addCharacter(
    String userId,
    MyCharacter character,
  ) {
    // TODO: implement addCharacter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteCharacter(String userId, String ocid) {
    // TODO: implement deleteCharacter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MyCharacter?>> getCharacterByOcid(
    String userId,
    String ocid,
  ) {
    // TODO: implement getCharacterByOcid
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, List<MyCharacter>>> getUserCharacterStream(
    String userId,
  ) {
    // TODO: implement getUserCharacterStream
    throw UnimplementedError();
  }
}
