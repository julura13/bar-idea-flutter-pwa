// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeightReading _$WeightReadingFromJson(Map<String, dynamic> json) {
  return _WeightReading.fromJson(json);
}

/// @nodoc
mixin _$WeightReading {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'weigh_module_id')
  int get weighModuleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_value')
  double get weightValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_at')
  DateTime get readAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WeightReading to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeightReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeightReadingCopyWith<WeightReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightReadingCopyWith<$Res> {
  factory $WeightReadingCopyWith(
          WeightReading value, $Res Function(WeightReading) then) =
      _$WeightReadingCopyWithImpl<$Res, WeightReading>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'weigh_module_id') int weighModuleId,
      @JsonKey(name: 'weight_value') double weightValue,
      String unit,
      @JsonKey(name: 'read_at') DateTime readAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$WeightReadingCopyWithImpl<$Res, $Val extends WeightReading>
    implements $WeightReadingCopyWith<$Res> {
  _$WeightReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeightReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weighModuleId = null,
    Object? weightValue = null,
    Object? unit = null,
    Object? readAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      weighModuleId: null == weighModuleId
          ? _value.weighModuleId
          : weighModuleId // ignore: cast_nullable_to_non_nullable
              as int,
      weightValue: null == weightValue
          ? _value.weightValue
          : weightValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      readAt: null == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightReadingImplCopyWith<$Res>
    implements $WeightReadingCopyWith<$Res> {
  factory _$$WeightReadingImplCopyWith(
          _$WeightReadingImpl value, $Res Function(_$WeightReadingImpl) then) =
      __$$WeightReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'weigh_module_id') int weighModuleId,
      @JsonKey(name: 'weight_value') double weightValue,
      String unit,
      @JsonKey(name: 'read_at') DateTime readAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$WeightReadingImplCopyWithImpl<$Res>
    extends _$WeightReadingCopyWithImpl<$Res, _$WeightReadingImpl>
    implements _$$WeightReadingImplCopyWith<$Res> {
  __$$WeightReadingImplCopyWithImpl(
      _$WeightReadingImpl _value, $Res Function(_$WeightReadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeightReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weighModuleId = null,
    Object? weightValue = null,
    Object? unit = null,
    Object? readAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WeightReadingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      weighModuleId: null == weighModuleId
          ? _value.weighModuleId
          : weighModuleId // ignore: cast_nullable_to_non_nullable
              as int,
      weightValue: null == weightValue
          ? _value.weightValue
          : weightValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      readAt: null == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeightReadingImpl implements _WeightReading {
  const _$WeightReadingImpl(
      {required this.id,
      @JsonKey(name: 'weigh_module_id') required this.weighModuleId,
      @JsonKey(name: 'weight_value') required this.weightValue,
      required this.unit,
      @JsonKey(name: 'read_at') required this.readAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$WeightReadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightReadingImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'weigh_module_id')
  final int weighModuleId;
  @override
  @JsonKey(name: 'weight_value')
  final double weightValue;
  @override
  final String unit;
  @override
  @JsonKey(name: 'read_at')
  final DateTime readAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WeightReading(id: $id, weighModuleId: $weighModuleId, weightValue: $weightValue, unit: $unit, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightReadingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weighModuleId, weighModuleId) ||
                other.weighModuleId == weighModuleId) &&
            (identical(other.weightValue, weightValue) ||
                other.weightValue == weightValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, weighModuleId, weightValue,
      unit, readAt, createdAt, updatedAt);

  /// Create a copy of WeightReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightReadingImplCopyWith<_$WeightReadingImpl> get copyWith =>
      __$$WeightReadingImplCopyWithImpl<_$WeightReadingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightReadingImplToJson(
      this,
    );
  }
}

abstract class _WeightReading implements WeightReading {
  const factory _WeightReading(
          {required final int id,
          @JsonKey(name: 'weigh_module_id') required final int weighModuleId,
          @JsonKey(name: 'weight_value') required final double weightValue,
          required final String unit,
          @JsonKey(name: 'read_at') required final DateTime readAt,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$WeightReadingImpl;

  factory _WeightReading.fromJson(Map<String, dynamic> json) =
      _$WeightReadingImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'weigh_module_id')
  int get weighModuleId;
  @override
  @JsonKey(name: 'weight_value')
  double get weightValue;
  @override
  String get unit;
  @override
  @JsonKey(name: 'read_at')
  DateTime get readAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of WeightReading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightReadingImplCopyWith<_$WeightReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
