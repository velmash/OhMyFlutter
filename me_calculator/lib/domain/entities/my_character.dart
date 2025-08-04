import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:me_calculator/domain/entities/weekly_boss.dart';
import 'package:me_calculator/utils/format_utils.dart';

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

extension CharacterCalc on MyCharacter {
  String get totalMeso {
    final total = bosses.fold(0, (sum, boss) => sum + boss.meso);
    return formatMeso(total);
  }
}
