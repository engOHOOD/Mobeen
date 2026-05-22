// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewOrganizationModel {

 String get id; String get name; String get email;@JsonKey(name: 'national_address') String? get nationalAddress;@JsonKey(name: 'organization_logo') String? get organizationLogo;
/// Create a copy of ViewOrganizationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewOrganizationModelCopyWith<ViewOrganizationModel> get copyWith => _$ViewOrganizationModelCopyWithImpl<ViewOrganizationModel>(this as ViewOrganizationModel, _$identity);

  /// Serializes this ViewOrganizationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewOrganizationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationalAddress, nationalAddress) || other.nationalAddress == nationalAddress)&&(identical(other.organizationLogo, organizationLogo) || other.organizationLogo == organizationLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,nationalAddress,organizationLogo);

@override
String toString() {
  return 'ViewOrganizationModel(id: $id, name: $name, email: $email, nationalAddress: $nationalAddress, organizationLogo: $organizationLogo)';
}


}

/// @nodoc
abstract mixin class $ViewOrganizationModelCopyWith<$Res>  {
  factory $ViewOrganizationModelCopyWith(ViewOrganizationModel value, $Res Function(ViewOrganizationModel) _then) = _$ViewOrganizationModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email,@JsonKey(name: 'national_address') String? nationalAddress,@JsonKey(name: 'organization_logo') String? organizationLogo
});




}
/// @nodoc
class _$ViewOrganizationModelCopyWithImpl<$Res>
    implements $ViewOrganizationModelCopyWith<$Res> {
  _$ViewOrganizationModelCopyWithImpl(this._self, this._then);

  final ViewOrganizationModel _self;
  final $Res Function(ViewOrganizationModel) _then;

/// Create a copy of ViewOrganizationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? nationalAddress = freezed,Object? organizationLogo = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nationalAddress: freezed == nationalAddress ? _self.nationalAddress : nationalAddress // ignore: cast_nullable_to_non_nullable
as String?,organizationLogo: freezed == organizationLogo ? _self.organizationLogo : organizationLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewOrganizationModel].
extension ViewOrganizationModelPatterns on ViewOrganizationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewOrganizationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewOrganizationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewOrganizationModel value)  $default,){
final _that = this;
switch (_that) {
case _ViewOrganizationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewOrganizationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ViewOrganizationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email, @JsonKey(name: 'national_address')  String? nationalAddress, @JsonKey(name: 'organization_logo')  String? organizationLogo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewOrganizationModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.nationalAddress,_that.organizationLogo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email, @JsonKey(name: 'national_address')  String? nationalAddress, @JsonKey(name: 'organization_logo')  String? organizationLogo)  $default,) {final _that = this;
switch (_that) {
case _ViewOrganizationModel():
return $default(_that.id,_that.name,_that.email,_that.nationalAddress,_that.organizationLogo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email, @JsonKey(name: 'national_address')  String? nationalAddress, @JsonKey(name: 'organization_logo')  String? organizationLogo)?  $default,) {final _that = this;
switch (_that) {
case _ViewOrganizationModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.nationalAddress,_that.organizationLogo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewOrganizationModel implements ViewOrganizationModel {
  const _ViewOrganizationModel({required this.id, required this.name, required this.email, @JsonKey(name: 'national_address') required this.nationalAddress, @JsonKey(name: 'organization_logo') required this.organizationLogo});
  factory _ViewOrganizationModel.fromJson(Map<String, dynamic> json) => _$ViewOrganizationModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override@JsonKey(name: 'national_address') final  String? nationalAddress;
@override@JsonKey(name: 'organization_logo') final  String? organizationLogo;

/// Create a copy of ViewOrganizationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewOrganizationModelCopyWith<_ViewOrganizationModel> get copyWith => __$ViewOrganizationModelCopyWithImpl<_ViewOrganizationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewOrganizationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewOrganizationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationalAddress, nationalAddress) || other.nationalAddress == nationalAddress)&&(identical(other.organizationLogo, organizationLogo) || other.organizationLogo == organizationLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,nationalAddress,organizationLogo);

@override
String toString() {
  return 'ViewOrganizationModel(id: $id, name: $name, email: $email, nationalAddress: $nationalAddress, organizationLogo: $organizationLogo)';
}


}

/// @nodoc
abstract mixin class _$ViewOrganizationModelCopyWith<$Res> implements $ViewOrganizationModelCopyWith<$Res> {
  factory _$ViewOrganizationModelCopyWith(_ViewOrganizationModel value, $Res Function(_ViewOrganizationModel) _then) = __$ViewOrganizationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email,@JsonKey(name: 'national_address') String? nationalAddress,@JsonKey(name: 'organization_logo') String? organizationLogo
});




}
/// @nodoc
class __$ViewOrganizationModelCopyWithImpl<$Res>
    implements _$ViewOrganizationModelCopyWith<$Res> {
  __$ViewOrganizationModelCopyWithImpl(this._self, this._then);

  final _ViewOrganizationModel _self;
  final $Res Function(_ViewOrganizationModel) _then;

/// Create a copy of ViewOrganizationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? nationalAddress = freezed,Object? organizationLogo = freezed,}) {
  return _then(_ViewOrganizationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nationalAddress: freezed == nationalAddress ? _self.nationalAddress : nationalAddress // ignore: cast_nullable_to_non_nullable
as String?,organizationLogo: freezed == organizationLogo ? _self.organizationLogo : organizationLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
