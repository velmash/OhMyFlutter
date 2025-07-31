// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyCharacterDTO _$MyCharacterDTOFromJson(Map<String, dynamic> json) =>
    _MyCharacterDTO(
      nickName: json['nickName'] as String,
      imagePath: json['imagePath'] as String,
      ocid: json['ocid'] as String,
    );

Map<String, dynamic> _$MyCharacterDTOToJson(_MyCharacterDTO instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'imagePath': instance.imagePath,
      'ocid': instance.ocid,
    };
