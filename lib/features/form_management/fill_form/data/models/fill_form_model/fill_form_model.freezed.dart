// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fill_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FillFormModel {

 String get id; String get formId; String get questionId; String get userId; List<dynamic> get answer;
/// Create a copy of FillFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FillFormModelCopyWith<FillFormModel> get copyWith => _$FillFormModelCopyWithImpl<FillFormModel>(this as FillFormModel, _$identity);

  /// Serializes this FillFormModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FillFormModel&&(identical(other.id, id) || other.id == id)&&(identical(other.formId, formId) || other.formId == formId)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.answer, answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,formId,questionId,userId,const DeepCollectionEquality().hash(answer));

@override
String toString() {
  return 'FillFormModel(id: $id, formId: $formId, questionId: $questionId, userId: $userId, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $FillFormModelCopyWith<$Res>  {
  factory $FillFormModelCopyWith(FillFormModel value, $Res Function(FillFormModel) _then) = _$FillFormModelCopyWithImpl;
@useResult
$Res call({
 String id, String formId, String questionId, String userId, List<dynamic> answer
});




}
/// @nodoc
class _$FillFormModelCopyWithImpl<$Res>
    implements $FillFormModelCopyWith<$Res> {
  _$FillFormModelCopyWithImpl(this._self, this._then);

  final FillFormModel _self;
  final $Res Function(FillFormModel) _then;

/// Create a copy of FillFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? formId = null,Object? questionId = null,Object? userId = null,Object? answer = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,formId: null == formId ? _self.formId : formId // ignore: cast_nullable_to_non_nullable
as String,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [FillFormModel].
extension FillFormModelPatterns on FillFormModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FillFormModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FillFormModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FillFormModel value)  $default,){
final _that = this;
switch (_that) {
case _FillFormModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FillFormModel value)?  $default,){
final _that = this;
switch (_that) {
case _FillFormModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String formId,  String questionId,  String userId,  List<dynamic> answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FillFormModel() when $default != null:
return $default(_that.id,_that.formId,_that.questionId,_that.userId,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String formId,  String questionId,  String userId,  List<dynamic> answer)  $default,) {final _that = this;
switch (_that) {
case _FillFormModel():
return $default(_that.id,_that.formId,_that.questionId,_that.userId,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String formId,  String questionId,  String userId,  List<dynamic> answer)?  $default,) {final _that = this;
switch (_that) {
case _FillFormModel() when $default != null:
return $default(_that.id,_that.formId,_that.questionId,_that.userId,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FillFormModel implements FillFormModel {
  const _FillFormModel({required this.id, required this.formId, required this.questionId, required this.userId, required final  List<dynamic> answer}): _answer = answer;
  factory _FillFormModel.fromJson(Map<String, dynamic> json) => _$FillFormModelFromJson(json);

@override final  String id;
@override final  String formId;
@override final  String questionId;
@override final  String userId;
 final  List<dynamic> _answer;
@override List<dynamic> get answer {
  if (_answer is EqualUnmodifiableListView) return _answer;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answer);
}


/// Create a copy of FillFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FillFormModelCopyWith<_FillFormModel> get copyWith => __$FillFormModelCopyWithImpl<_FillFormModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FillFormModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FillFormModel&&(identical(other.id, id) || other.id == id)&&(identical(other.formId, formId) || other.formId == formId)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._answer, _answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,formId,questionId,userId,const DeepCollectionEquality().hash(_answer));

@override
String toString() {
  return 'FillFormModel(id: $id, formId: $formId, questionId: $questionId, userId: $userId, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$FillFormModelCopyWith<$Res> implements $FillFormModelCopyWith<$Res> {
  factory _$FillFormModelCopyWith(_FillFormModel value, $Res Function(_FillFormModel) _then) = __$FillFormModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String formId, String questionId, String userId, List<dynamic> answer
});




}
/// @nodoc
class __$FillFormModelCopyWithImpl<$Res>
    implements _$FillFormModelCopyWith<$Res> {
  __$FillFormModelCopyWithImpl(this._self, this._then);

  final _FillFormModel _self;
  final $Res Function(_FillFormModel) _then;

/// Create a copy of FillFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? formId = null,Object? questionId = null,Object? userId = null,Object? answer = null,}) {
  return _then(_FillFormModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,formId: null == formId ? _self.formId : formId // ignore: cast_nullable_to_non_nullable
as String,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self._answer : answer // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
