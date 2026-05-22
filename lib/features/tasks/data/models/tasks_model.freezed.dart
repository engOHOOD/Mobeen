// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TasksModel {

@JsonKey(includeIfNull: false) String? get id; String get researcherId; String get supervisorId; String get locationId; ShiftType get shift; DateTime get taskDate; TaskStatus get status;
/// Create a copy of TasksModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksModelCopyWith<TasksModel> get copyWith => _$TasksModelCopyWithImpl<TasksModel>(this as TasksModel, _$identity);

  /// Serializes this TasksModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksModel&&(identical(other.id, id) || other.id == id)&&(identical(other.researcherId, researcherId) || other.researcherId == researcherId)&&(identical(other.supervisorId, supervisorId) || other.supervisorId == supervisorId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.taskDate, taskDate) || other.taskDate == taskDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,researcherId,supervisorId,locationId,shift,taskDate,status);

@override
String toString() {
  return 'TasksModel(id: $id, researcherId: $researcherId, supervisorId: $supervisorId, locationId: $locationId, shift: $shift, taskDate: $taskDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $TasksModelCopyWith<$Res>  {
  factory $TasksModelCopyWith(TasksModel value, $Res Function(TasksModel) _then) = _$TasksModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String researcherId, String supervisorId, String locationId, ShiftType shift, DateTime taskDate, TaskStatus status
});




}
/// @nodoc
class _$TasksModelCopyWithImpl<$Res>
    implements $TasksModelCopyWith<$Res> {
  _$TasksModelCopyWithImpl(this._self, this._then);

  final TasksModel _self;
  final $Res Function(TasksModel) _then;

/// Create a copy of TasksModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? researcherId = null,Object? supervisorId = null,Object? locationId = null,Object? shift = null,Object? taskDate = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,researcherId: null == researcherId ? _self.researcherId : researcherId // ignore: cast_nullable_to_non_nullable
as String,supervisorId: null == supervisorId ? _self.supervisorId : supervisorId // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as ShiftType,taskDate: null == taskDate ? _self.taskDate : taskDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksModel].
extension TasksModelPatterns on TasksModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksModel value)  $default,){
final _that = this;
switch (_that) {
case _TasksModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksModel value)?  $default,){
final _that = this;
switch (_that) {
case _TasksModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String researcherId,  String supervisorId,  String locationId,  ShiftType shift,  DateTime taskDate,  TaskStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksModel() when $default != null:
return $default(_that.id,_that.researcherId,_that.supervisorId,_that.locationId,_that.shift,_that.taskDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String researcherId,  String supervisorId,  String locationId,  ShiftType shift,  DateTime taskDate,  TaskStatus status)  $default,) {final _that = this;
switch (_that) {
case _TasksModel():
return $default(_that.id,_that.researcherId,_that.supervisorId,_that.locationId,_that.shift,_that.taskDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id,  String researcherId,  String supervisorId,  String locationId,  ShiftType shift,  DateTime taskDate,  TaskStatus status)?  $default,) {final _that = this;
switch (_that) {
case _TasksModel() when $default != null:
return $default(_that.id,_that.researcherId,_that.supervisorId,_that.locationId,_that.shift,_that.taskDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _TasksModel implements TasksModel {
  const _TasksModel({@JsonKey(includeIfNull: false) this.id, required this.researcherId, required this.supervisorId, required this.locationId, required this.shift, required this.taskDate, required this.status});
  factory _TasksModel.fromJson(Map<String, dynamic> json) => _$TasksModelFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override final  String researcherId;
@override final  String supervisorId;
@override final  String locationId;
@override final  ShiftType shift;
@override final  DateTime taskDate;
@override final  TaskStatus status;

/// Create a copy of TasksModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksModelCopyWith<_TasksModel> get copyWith => __$TasksModelCopyWithImpl<_TasksModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasksModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksModel&&(identical(other.id, id) || other.id == id)&&(identical(other.researcherId, researcherId) || other.researcherId == researcherId)&&(identical(other.supervisorId, supervisorId) || other.supervisorId == supervisorId)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.taskDate, taskDate) || other.taskDate == taskDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,researcherId,supervisorId,locationId,shift,taskDate,status);

@override
String toString() {
  return 'TasksModel(id: $id, researcherId: $researcherId, supervisorId: $supervisorId, locationId: $locationId, shift: $shift, taskDate: $taskDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TasksModelCopyWith<$Res> implements $TasksModelCopyWith<$Res> {
  factory _$TasksModelCopyWith(_TasksModel value, $Res Function(_TasksModel) _then) = __$TasksModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String researcherId, String supervisorId, String locationId, ShiftType shift, DateTime taskDate, TaskStatus status
});




}
/// @nodoc
class __$TasksModelCopyWithImpl<$Res>
    implements _$TasksModelCopyWith<$Res> {
  __$TasksModelCopyWithImpl(this._self, this._then);

  final _TasksModel _self;
  final $Res Function(_TasksModel) _then;

/// Create a copy of TasksModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? researcherId = null,Object? supervisorId = null,Object? locationId = null,Object? shift = null,Object? taskDate = null,Object? status = null,}) {
  return _then(_TasksModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,researcherId: null == researcherId ? _self.researcherId : researcherId // ignore: cast_nullable_to_non_nullable
as String,supervisorId: null == supervisorId ? _self.supervisorId : supervisorId // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as ShiftType,taskDate: null == taskDate ? _self.taskDate : taskDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,
  ));
}


}

// dart format on
