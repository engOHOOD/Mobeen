// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveLocationModel {

 String? get id; String get userId; String? get name; double? get latitude; double? get longitude; DateTime? get updatedAt;
/// Create a copy of LiveLocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveLocationModelCopyWith<LiveLocationModel> get copyWith => _$LiveLocationModelCopyWithImpl<LiveLocationModel>(this as LiveLocationModel, _$identity);

  /// Serializes this LiveLocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveLocationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,latitude,longitude,updatedAt);

@override
String toString() {
  return 'LiveLocationModel(id: $id, userId: $userId, name: $name, latitude: $latitude, longitude: $longitude, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LiveLocationModelCopyWith<$Res>  {
  factory $LiveLocationModelCopyWith(LiveLocationModel value, $Res Function(LiveLocationModel) _then) = _$LiveLocationModelCopyWithImpl;
@useResult
$Res call({
 String? id, String userId, String? name, double? latitude, double? longitude, DateTime? updatedAt
});




}
/// @nodoc
class _$LiveLocationModelCopyWithImpl<$Res>
    implements $LiveLocationModelCopyWith<$Res> {
  _$LiveLocationModelCopyWithImpl(this._self, this._then);

  final LiveLocationModel _self;
  final $Res Function(LiveLocationModel) _then;

/// Create a copy of LiveLocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveLocationModel].
extension LiveLocationModelPatterns on LiveLocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveLocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveLocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveLocationModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveLocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveLocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveLocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String userId,  String? name,  double? latitude,  double? longitude,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveLocationModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.latitude,_that.longitude,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String userId,  String? name,  double? latitude,  double? longitude,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LiveLocationModel():
return $default(_that.id,_that.userId,_that.name,_that.latitude,_that.longitude,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String userId,  String? name,  double? latitude,  double? longitude,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LiveLocationModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.latitude,_that.longitude,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _LiveLocationModel implements LiveLocationModel {
  const _LiveLocationModel({this.id, required this.userId, this.name, this.latitude, this.longitude, this.updatedAt});
  factory _LiveLocationModel.fromJson(Map<String, dynamic> json) => _$LiveLocationModelFromJson(json);

@override final  String? id;
@override final  String userId;
@override final  String? name;
@override final  double? latitude;
@override final  double? longitude;
@override final  DateTime? updatedAt;

/// Create a copy of LiveLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveLocationModelCopyWith<_LiveLocationModel> get copyWith => __$LiveLocationModelCopyWithImpl<_LiveLocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveLocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveLocationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,latitude,longitude,updatedAt);

@override
String toString() {
  return 'LiveLocationModel(id: $id, userId: $userId, name: $name, latitude: $latitude, longitude: $longitude, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LiveLocationModelCopyWith<$Res> implements $LiveLocationModelCopyWith<$Res> {
  factory _$LiveLocationModelCopyWith(_LiveLocationModel value, $Res Function(_LiveLocationModel) _then) = __$LiveLocationModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String userId, String? name, double? latitude, double? longitude, DateTime? updatedAt
});




}
/// @nodoc
class __$LiveLocationModelCopyWithImpl<$Res>
    implements _$LiveLocationModelCopyWith<$Res> {
  __$LiveLocationModelCopyWithImpl(this._self, this._then);

  final _LiveLocationModel _self;
  final $Res Function(_LiveLocationModel) _then;

/// Create a copy of LiveLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? updatedAt = freezed,}) {
  return _then(_LiveLocationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
