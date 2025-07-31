import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:me_calculator/domain/entities/my_character.dart';

part 'my_character_dto.freezed.dart';
part 'my_character_dto.g.dart';

@freezed
abstract class MyCharacterDTO with _$MyCharacterDTO {
  const factory MyCharacterDTO({required String nickName, required String imagePath, required String ocid}) =
      _MyCharacterDTO;

  factory MyCharacterDTO.fromJson(Map<String, dynamic> json) => _$MyCharacterDTOFromJson(json);

  factory MyCharacterDTO.fromMap(Map<String, dynamic> map) => _$MyCharacterDTOFromJson(map);
}

extension MyCharacterMapper on MyCharacterDTO {
  MyCharacter toMyCharacter() => MyCharacter(nickName: nickName, imagePath: imagePath, ocid: ocid);
}
