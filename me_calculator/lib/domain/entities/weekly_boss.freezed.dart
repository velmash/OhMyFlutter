// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_boss.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeeklyBoss {

/// 서버와 통신할 때 사용하는 ID (예: "zakum_chaos")
 String get serverId;/// 화면에 표시될 이름 (예: "자쿰 카오스")
 String get displayName;/// 결정석 보상
 int get meso;
/// Create a copy of WeeklyBoss
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyBossCopyWith<WeeklyBoss> get copyWith => _$WeeklyBossCopyWithImpl<WeeklyBoss>(this as WeeklyBoss, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyBoss&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.meso, meso) || other.meso == meso));
}


@override
int get hashCode => Object.hash(runtimeType,serverId,displayName,meso);

@override
String toString() {
  return 'WeeklyBoss(serverId: $serverId, displayName: $displayName, meso: $meso)';
}


}

/// @nodoc
abstract mixin class $WeeklyBossCopyWith<$Res>  {
  factory $WeeklyBossCopyWith(WeeklyBoss value, $Res Function(WeeklyBoss) _then) = _$WeeklyBossCopyWithImpl;
@useResult
$Res call({
 String serverId, String displayName, int meso
});




}
/// @nodoc
class _$WeeklyBossCopyWithImpl<$Res>
    implements $WeeklyBossCopyWith<$Res> {
  _$WeeklyBossCopyWithImpl(this._self, this._then);

  final WeeklyBoss _self;
  final $Res Function(WeeklyBoss) _then;

/// Create a copy of WeeklyBoss
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverId = null,Object? displayName = null,Object? meso = null,}) {
  return _then(_self.copyWith(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,meso: null == meso ? _self.meso : meso // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyBoss].
extension WeeklyBossPatterns on WeeklyBoss {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyBoss value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyBoss() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyBoss value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyBoss():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyBoss value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyBoss() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverId,  String displayName,  int meso)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyBoss() when $default != null:
return $default(_that.serverId,_that.displayName,_that.meso);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverId,  String displayName,  int meso)  $default,) {final _that = this;
switch (_that) {
case _WeeklyBoss():
return $default(_that.serverId,_that.displayName,_that.meso);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverId,  String displayName,  int meso)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyBoss() when $default != null:
return $default(_that.serverId,_that.displayName,_that.meso);case _:
  return null;

}
}

}

/// @nodoc


class _WeeklyBoss implements WeeklyBoss {
  const _WeeklyBoss({required this.serverId, required this.displayName, required this.meso});
  

/// 서버와 통신할 때 사용하는 ID (예: "zakum_chaos")
@override final  String serverId;
/// 화면에 표시될 이름 (예: "자쿰 카오스")
@override final  String displayName;
/// 결정석 보상
@override final  int meso;

/// Create a copy of WeeklyBoss
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyBossCopyWith<_WeeklyBoss> get copyWith => __$WeeklyBossCopyWithImpl<_WeeklyBoss>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyBoss&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.meso, meso) || other.meso == meso));
}


@override
int get hashCode => Object.hash(runtimeType,serverId,displayName,meso);

@override
String toString() {
  return 'WeeklyBoss(serverId: $serverId, displayName: $displayName, meso: $meso)';
}


}

/// @nodoc
abstract mixin class _$WeeklyBossCopyWith<$Res> implements $WeeklyBossCopyWith<$Res> {
  factory _$WeeklyBossCopyWith(_WeeklyBoss value, $Res Function(_WeeklyBoss) _then) = __$WeeklyBossCopyWithImpl;
@override @useResult
$Res call({
 String serverId, String displayName, int meso
});




}
/// @nodoc
class __$WeeklyBossCopyWithImpl<$Res>
    implements _$WeeklyBossCopyWith<$Res> {
  __$WeeklyBossCopyWithImpl(this._self, this._then);

  final _WeeklyBoss _self;
  final $Res Function(_WeeklyBoss) _then;

/// Create a copy of WeeklyBoss
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? displayName = null,Object? meso = null,}) {
  return _then(_WeeklyBoss(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,meso: null == meso ? _self.meso : meso // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
