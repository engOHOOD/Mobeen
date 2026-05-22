// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateFormModel {

 FormModel get form; List<QuestionModel> get questions;
/// Create a copy of GenerateFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateFormModelCopyWith<GenerateFormModel> get copyWith => _$GenerateFormModelCopyWithImpl<GenerateFormModel>(this as GenerateFormModel, _$identity);

  /// Serializes this GenerateFormModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateFormModel&&(identical(other.form, form) || other.form == form)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,form,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'GenerateFormModel(form: $form, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $GenerateFormModelCopyWith<$Res>  {
  factory $GenerateFormModelCopyWith(GenerateFormModel value, $Res Function(GenerateFormModel) _then) = _$GenerateFormModelCopyWithImpl;
@useResult
$Res call({
 FormModel form, List<QuestionModel> questions
});


$FormModelCopyWith<$Res> get form;

}
/// @nodoc
class _$GenerateFormModelCopyWithImpl<$Res>
    implements $GenerateFormModelCopyWith<$Res> {
  _$GenerateFormModelCopyWithImpl(this._self, this._then);

  final GenerateFormModel _self;
  final $Res Function(GenerateFormModel) _then;

/// Create a copy of GenerateFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? form = null,Object? questions = null,}) {
  return _then(_self.copyWith(
form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as FormModel,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}
/// Create a copy of GenerateFormModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormModelCopyWith<$Res> get form {
  
  return $FormModelCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenerateFormModel].
extension GenerateFormModelPatterns on GenerateFormModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateFormModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateFormModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateFormModel value)  $default,){
final _that = this;
switch (_that) {
case _GenerateFormModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateFormModel value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateFormModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FormModel form,  List<QuestionModel> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateFormModel() when $default != null:
return $default(_that.form,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FormModel form,  List<QuestionModel> questions)  $default,) {final _that = this;
switch (_that) {
case _GenerateFormModel():
return $default(_that.form,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FormModel form,  List<QuestionModel> questions)?  $default,) {final _that = this;
switch (_that) {
case _GenerateFormModel() when $default != null:
return $default(_that.form,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateFormModel implements GenerateFormModel {
  const _GenerateFormModel({required this.form, required final  List<QuestionModel> questions}): _questions = questions;
  factory _GenerateFormModel.fromJson(Map<String, dynamic> json) => _$GenerateFormModelFromJson(json);

@override final  FormModel form;
 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of GenerateFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateFormModelCopyWith<_GenerateFormModel> get copyWith => __$GenerateFormModelCopyWithImpl<_GenerateFormModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateFormModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateFormModel&&(identical(other.form, form) || other.form == form)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,form,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'GenerateFormModel(form: $form, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$GenerateFormModelCopyWith<$Res> implements $GenerateFormModelCopyWith<$Res> {
  factory _$GenerateFormModelCopyWith(_GenerateFormModel value, $Res Function(_GenerateFormModel) _then) = __$GenerateFormModelCopyWithImpl;
@override @useResult
$Res call({
 FormModel form, List<QuestionModel> questions
});


@override $FormModelCopyWith<$Res> get form;

}
/// @nodoc
class __$GenerateFormModelCopyWithImpl<$Res>
    implements _$GenerateFormModelCopyWith<$Res> {
  __$GenerateFormModelCopyWithImpl(this._self, this._then);

  final _GenerateFormModel _self;
  final $Res Function(_GenerateFormModel) _then;

/// Create a copy of GenerateFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? form = null,Object? questions = null,}) {
  return _then(_GenerateFormModel(
form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as FormModel,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}

/// Create a copy of GenerateFormModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormModelCopyWith<$Res> get form {
  
  return $FormModelCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}

// dart format on
