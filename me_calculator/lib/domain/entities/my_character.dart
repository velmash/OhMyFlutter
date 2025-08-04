import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:me_calculator/domain/entities/weekly_boss.dart';

part 'my_character.freezed.dart';

@freezed
sealed class MyCharacter with _$MyCharacter {
  const factory MyCharacter({
    required String nickName,
    required String imagePath,
    required String ocid,
    required List<WeeklyBoss> bosses,
  }) = _MyCharacter;
}
