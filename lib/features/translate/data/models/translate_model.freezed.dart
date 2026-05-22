// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslateModel {

 String get inputText; String get translatedText; String get detectedLanguage; String get targetLanguage;
/// Create a copy of TranslateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslateModelCopyWith<TranslateModel> get copyWith => _$TranslateModelCopyWithImpl<TranslateModel>(this as TranslateModel, _$identity);

  /// Serializes this TranslateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslateModel&&(identical(other.inputText, inputText) || other.inputText == inputText)&&(identical(other.translatedText, translatedText) || other.translatedText == translatedText)&&(identical(other.detectedLanguage, detectedLanguage) || other.detectedLanguage == detectedLanguage)&&(identical(other.targetLanguage, targetLanguage) || other.targetLanguage == targetLanguage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputText,translatedText,detectedLanguage,targetLanguage);

@override
String toString() {
  return 'TranslateModel(inputText: $inputText, translatedText: $translatedText, detectedLanguage: $detectedLanguage, targetLanguage: $targetLanguage)';
}


}

/// @nodoc
abstract mixin class $TranslateModelCopyWith<$Res>  {
  factory $TranslateModelCopyWith(TranslateModel value, $Res Function(TranslateModel) _then) = _$TranslateModelCopyWithImpl;
@useResult
$Res call({
 String inputText, String translatedText, String detectedLanguage, String targetLanguage
});




}
/// @nodoc
class _$TranslateModelCopyWithImpl<$Res>
    implements $TranslateModelCopyWith<$Res> {
  _$TranslateModelCopyWithImpl(this._self, this._then);

  final TranslateModel _self;
  final $Res Function(TranslateModel) _then;

/// Create a copy of TranslateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputText = null,Object? translatedText = null,Object? detectedLanguage = null,Object? targetLanguage = null,}) {
  return _then(_self.copyWith(
inputText: null == inputText ? _self.inputText : inputText // ignore: cast_nullable_to_non_nullable
as String,translatedText: null == translatedText ? _self.translatedText : translatedText // ignore: cast_nullable_to_non_nullable
as String,detectedLanguage: null == detectedLanguage ? _self.detectedLanguage : detectedLanguage // ignore: cast_nullable_to_non_nullable
as String,targetLanguage: null == targetLanguage ? _self.targetLanguage : targetLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslateModel].
extension TranslateModelPatterns on TranslateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslateModel value)  $default,){
final _that = this;
switch (_that) {
case _TranslateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslateModel value)?  $default,){
final _that = this;
switch (_that) {
case _TranslateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String inputText,  String translatedText,  String detectedLanguage,  String targetLanguage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslateModel() when $default != null:
return $default(_that.inputText,_that.translatedText,_that.detectedLanguage,_that.targetLanguage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String inputText,  String translatedText,  String detectedLanguage,  String targetLanguage)  $default,) {final _that = this;
switch (_that) {
case _TranslateModel():
return $default(_that.inputText,_that.translatedText,_that.detectedLanguage,_that.targetLanguage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String inputText,  String translatedText,  String detectedLanguage,  String targetLanguage)?  $default,) {final _that = this;
switch (_that) {
case _TranslateModel() when $default != null:
return $default(_that.inputText,_that.translatedText,_that.detectedLanguage,_that.targetLanguage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslateModel implements TranslateModel {
  const _TranslateModel({required this.inputText, required this.translatedText, required this.detectedLanguage, required this.targetLanguage});
  factory _TranslateModel.fromJson(Map<String, dynamic> json) => _$TranslateModelFromJson(json);

@override final  String inputText;
@override final  String translatedText;
@override final  String detectedLanguage;
@override final  String targetLanguage;

/// Create a copy of TranslateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslateModelCopyWith<_TranslateModel> get copyWith => __$TranslateModelCopyWithImpl<_TranslateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslateModel&&(identical(other.inputText, inputText) || other.inputText == inputText)&&(identical(other.translatedText, translatedText) || other.translatedText == translatedText)&&(identical(other.detectedLanguage, detectedLanguage) || other.detectedLanguage == detectedLanguage)&&(identical(other.targetLanguage, targetLanguage) || other.targetLanguage == targetLanguage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputText,translatedText,detectedLanguage,targetLanguage);

@override
String toString() {
  return 'TranslateModel(inputText: $inputText, translatedText: $translatedText, detectedLanguage: $detectedLanguage, targetLanguage: $targetLanguage)';
}


}

/// @nodoc
abstract mixin class _$TranslateModelCopyWith<$Res> implements $TranslateModelCopyWith<$Res> {
  factory _$TranslateModelCopyWith(_TranslateModel value, $Res Function(_TranslateModel) _then) = __$TranslateModelCopyWithImpl;
@override @useResult
$Res call({
 String inputText, String translatedText, String detectedLanguage, String targetLanguage
});




}
/// @nodoc
class __$TranslateModelCopyWithImpl<$Res>
    implements _$TranslateModelCopyWith<$Res> {
  __$TranslateModelCopyWithImpl(this._self, this._then);

  final _TranslateModel _self;
  final $Res Function(_TranslateModel) _then;

/// Create a copy of TranslateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputText = null,Object? translatedText = null,Object? detectedLanguage = null,Object? targetLanguage = null,}) {
  return _then(_TranslateModel(
inputText: null == inputText ? _self.inputText : inputText // ignore: cast_nullable_to_non_nullable
as String,translatedText: null == translatedText ? _self.translatedText : translatedText // ignore: cast_nullable_to_non_nullable
as String,detectedLanguage: null == detectedLanguage ? _self.detectedLanguage : detectedLanguage // ignore: cast_nullable_to_non_nullable
as String,targetLanguage: null == targetLanguage ? _self.targetLanguage : targetLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
