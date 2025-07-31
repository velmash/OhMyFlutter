// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyCharacter {

 String get nickName; String get imagePath; String get ocid;
/// Create a copy of MyCharacter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyCharacterCopyWith<MyCharacter> get copyWith => _$MyCharacterCopyWithImpl<MyCharacter>(this as MyCharacter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyCharacter&&(identical(other.nickName, nickName) || other.nickName == nickName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.ocid, ocid) || other.ocid == ocid));
}


@override
int get hashCode => Object.hash(runtimeType,nickName,imagePath,ocid);

@override
String toString() {
  return 'MyCharacter(nickName: $nickName, imagePath: $imagePath, ocid: $ocid)';
}


}

/// @nodoc
abstract mixin class $MyCharacterCopyWith<$Res>  {
  factory $MyCharacterCopyWith(MyCharacter value, $Res Function(MyCharacter) _then) = _$MyCharacterCopyWithImpl;
@useResult
$Res call({
 String nickName, String imagePath, String ocid
});




}
/// @nodoc
class _$MyCharacterCopyWithImpl<$Res>
    implements $MyCharacterCopyWith<$Res> {
  _$MyCharacterCopyWithImpl(this._self, this._then);

  final MyCharacter _self;
  final $Res Function(MyCharacter) _then;

/// Create a copy of MyCharacter
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


/// Adds pattern-matching-related methods to [MyCharacter].
extension MyCharacterPatterns on MyCharacter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyCharacter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyCharacter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyCharacter value)  $default,){
final _that = this;
switch (_that) {
case _MyCharacter():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyCharacter value)?  $default,){
final _that = this;
switch (_that) {
case _MyCharacter() when $default != null:
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
case _MyCharacter() when $default != null:
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
case _MyCharacter():
return $default(_that.nickName,_that.imagePath,_that.ocid);}
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
case _MyCharacter() when $default != null:
return $default(_that.nickName,_that.imagePath,_that.ocid);case _:
  return null;

}
}

}

/// @nodoc


class _MyCharacter implements MyCharacter {
  const _MyCharacter({required this.nickName, required this.imagePath, required this.ocid});
  

@override final  String nickName;
@override final  String imagePath;
@override final  String ocid;

/// Create a copy of MyCharacter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyCharacterCopyWith<_MyCharacter> get copyWith => __$MyCharacterCopyWithImpl<_MyCharacter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyCharacter&&(identical(other.nickName, nickName) || other.nickName == nickName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.ocid, ocid) || other.ocid == ocid));
}


@override
int get hashCode => Object.hash(runtimeType,nickName,imagePath,ocid);

@override
String toString() {
  return 'MyCharacter(nickName: $nickName, imagePath: $imagePath, ocid: $ocid)';
}


}

/// @nodoc
abstract mixin class _$MyCharacterCopyWith<$Res> implements $MyCharacterCopyWith<$Res> {
  factory _$MyCharacterCopyWith(_MyCharacter value, $Res Function(_MyCharacter) _then) = __$MyCharacterCopyWithImpl;
@override @useResult
$Res call({
 String nickName, String imagePath, String ocid
});




}
/// @nodoc
class __$MyCharacterCopyWithImpl<$Res>
    implements _$MyCharacterCopyWith<$Res> {
  __$MyCharacterCopyWithImpl(this._self, this._then);

  final _MyCharacter _self;
  final $Res Function(_MyCharacter) _then;

/// Create a copy of MyCharacter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickName = null,Object? imagePath = null,Object? ocid = null,}) {
  return _then(_MyCharacter(
nickName: null == nickName ? _self.nickName : nickName // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,ocid: null == ocid ? _self.ocid : ocid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
