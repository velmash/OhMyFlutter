import 'package:dartz/dartz.dart';
import 'package:me_calculator/core/errors/failure.dart';
import 'package:me_calculator/domain/entities/my_character.dart';
import 'package:me_calculator/domain/repositories/character_repository.dart';

class GetCharacterUsecase {
  final CharacterRepository repository;

  GetCharacterUsecase(this.repository);

  Future<Either<Failure, List<MyCharacter>>> fetchCharacters(
    String userId,
  ) async {
    return await repository.getUserCharacters(userId);
  }
}
