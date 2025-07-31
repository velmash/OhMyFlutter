// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_character_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyCharacterDTO {

 String get nickName; String get imagePath; String get ocid;
/// Create a copy of MyCharacterDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyCharacterDTOCopyWith<MyCharacterDTO> get copyWith => _$MyCharacterDTOCopyWithImpl<MyCharacterDTO>(this as MyCharacterDTO, _$identity);

  /// Serializes this MyCharacterDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyCharacterDTO&&(identical(other.nickName, nickName) || other.nickName == nickName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.ocid, ocid) || other.ocid == ocid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nickName,imagePath,ocid);

@override
String toString() {
  return 'MyCharacterDTO(nickName: $nickName, imagePath: $imagePath, ocid: $ocid)';
}


}

/// @nodoc
abstract mixin class $MyCharacterDTOCopyWith<$Res>  {
  factory $MyCharacterDTOCopyWith(MyCharacterDTO value, $Res Function(MyCharacterDTO) _then) = _$MyCharacterDTOCopyWithImpl;
@useResult
$Res call({
 String nickName, String imagePath, String ocid
});




}
/// @nodoc
class _$MyCharacterDTOCopyWithImpl<$Res>
    implements $MyCharacterDTOCopyWith<$Res> {
  _$MyCharacterDTOCopyWithImpl(this._self, this._then);

  final MyCharacterDTO _self;
  final $Res Function(MyCharacterDTO) _then;

/// Create a copy of MyCharacterDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nickName = null,Object? imagePath = null,Object? ocid = null,}) {
  return _then(_self.copyWith(
nickName: null == nickName ? _self.nickName : nickName // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,ocid: null == ocid ? _self.ocid : ocid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MyCharacterDTO].
extension MyCharacterDTOPatterns on MyCharacterDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyCharacterDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyCharacterDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyCharacterDTO value)  $default,){
final _that = this;
switch (_that) {
case _MyCharacterDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyCharacterDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MyCharacterDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nickName,  String imagePath,  String ocid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyCharacterDTO() when $default != null:
return $default(_that.nickName,_that.imagePath,_that.ocid);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nickName,  String imagePath,  String ocid)  $default,) {final _that = this;
switch (_that) {
case _MyCharacterDTO():
return $default(_that.nickName,_that.imagePath,_that.ocid);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nickName,  String imagePath,  String ocid)?  $default,) {final _that = this;
switch (_that) {
case _MyCharacterDTO() when $default != null:
return $default(_that.nickName,_that.imagePath,_that.ocid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyCharacterDTO implements MyCharacterDTO {
  const _MyCharacterDTO({required this.nickName, required this.imagePath, required this.ocid});
  factory _MyCharacterDTO.fromJson(Map<String, dynamic> json) => _$MyCharacterDTOFromJson(json);

@override final  String nickName;
@override final  String imagePath;
@override final  String ocid;

/// Create a copy of MyCharacterDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyCharacterDTOCopyWith<_MyCharacterDTO> get copyWith => __$MyCharacterDTOCopyWithImpl<_MyCharacterDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyCharacterDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyCharacterDTO&&(identical(other.nickName, nickName) || other.nickName == nickName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.ocid, ocid) || other.ocid == ocid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nickName,imagePath,ocid);

@override
String toString() {
  return 'MyCharacterDTO(nickName: $nickName, imagePath: $imagePath, ocid: $ocid)';
}


}

/// @nodoc
abstract mixin class _$MyCharacterDTOCopyWith<$Res> implements $MyCharacterDTOCopyWith<$Res> {
  factory _$MyCharacterDTOCopyWith(_MyCharacterDTO value, $Res Function(_MyCharacterDTO) _then) = __$MyCharacterDTOCopyWithImpl;
@override @useResult
$Res call({
 String nickName, String imagePath, String ocid
});




}
/// @nodoc
class __$MyCharacterDTOCopyWithImpl<$Res>
    implements _$MyCharacterDTOCopyWith<$Res> {
  __$MyCharacterDTOCopyWithImpl(this._self, this._then);

  final _MyCharacterDTO _self;
  final $Res Function(_MyCharacterDTO) _then;

/// Create a copy of MyCharacterDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickName = null,Object? imagePath = null,Object? ocid = null,}) {
  return _then(_MyCharacterDTO(
nickName: null == nickName ? _self.nickName : nickName // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,ocid: null == ocid ? _self.ocid : ocid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
