import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_character.freezed.dart';

@freezed
sealed class MyCharacter with _$MyCharacter {
  const factory MyCharacter({required String nickName, required String imagePath, required String ocid}) = _MyCharacter;
}
