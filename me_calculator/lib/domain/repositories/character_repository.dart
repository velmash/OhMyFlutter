import 'package:dartz/dartz.dart';
import 'package:me_calculator/core/errors/failure.dart';
import 'package:me_calculator/domain/entities/my_character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, void>> addCharacter(
    String userId,
    MyCharacter character,
  );

  Future<Either<Failure, MyCharacter?>> getCharacterByOcid(
    String userId,
    String ocid,
  );

  Future<Either<Failure, void>> deleteCharacter(String userId, String ocid);

  Stream<Either<Failure, List<MyCharacter>>> getUserCharacterStream(
    String userId,
  );

  Future<Either<Failure, List<MyCharacter>>> getUserCharacters(String userId);
}
