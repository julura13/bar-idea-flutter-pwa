// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weigh_module.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeighModule _$WeighModuleFromJson(Map<String, dynamic> json) {
  return _WeighModule.fromJson(json);
}

/// @nodoc
mixin _$WeighModule {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'controller_id')
  int get controllerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_channel')
  String get busChannel => throw _privateConstructorUsedError;
  int get address => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_led_color')
  String get defaultLedColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'calibration_weight')
  double? get calibrationWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'tare_offset')
  double get tareOffset => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_reading')
  WeightReading? get latestReading => throw _privateConstructorUsedError;

  /// Serializes this WeighModule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeighModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeighModuleCopyWith<WeighModule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeighModuleCopyWith<$Res> {
  factory $WeighModuleCopyWith(
          WeighModule value, $Res Function(WeighModule) then) =
      _$WeighModuleCopyWithImpl<$Res, WeighModule>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'controller_id') int controllerId,
      @JsonKey(name: 'bus_channel') String busChannel,
      int address,
      String name,
      @JsonKey(name: 'default_led_color') String defaultLedColor,
      @JsonKey(name: 'calibration_weight') double? calibrationWeight,
      @JsonKey(name: 'tare_offset') double tareOffset,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'latest_reading') WeightReading? latestReading});

  $WeightReadingCopyWith<$Res>? get latestReading;
}

/// @nodoc
class _$WeighModuleCopyWithImpl<$Res, $Val extends WeighModule>
    implements $WeighModuleCopyWith<$Res> {
  _$WeighModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeighModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controllerId = null,
    Object? busChannel = null,
    Object? address = null,
    Object? name = null,
    Object? defaultLedColor = null,
    Object? calibrationWeight = freezed,
    Object? tareOffset = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? latestReading = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      controllerId: null == controllerId
          ? _value.controllerId
          : controllerId // ignore: cast_nullable_to_non_nullable
              as int,
      busChannel: null == busChannel
          ? _value.busChannel
          : busChannel // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      defaultLedColor: null == defaultLedColor
          ? _value.defaultLedColor
          : defaultLedColor // ignore: cast_nullable_to_non_nullable
              as String,
      calibrationWeight: freezed == calibrationWeight
          ? _value.calibrationWeight
          : calibrationWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      tareOffset: null == tareOffset
          ? _value.tareOffset
          : tareOffset // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latestReading: freezed == latestReading
          ? _value.latestReading
          : latestReading // ignore: cast_nullable_to_non_nullable
              as WeightReading?,
    ) as $Val);
  }

  /// Create a copy of WeighModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeightReadingCopyWith<$Res>? get latestReading {
    if (_value.latestReading == null) {
      return null;
    }

    return $WeightReadingCopyWith<$Res>(_value.latestReading!, (value) {
      return _then(_value.copyWith(latestReading: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeighModuleImplCopyWith<$Res>
    implements $WeighModuleCopyWith<$Res> {
  factory _$$WeighModuleImplCopyWith(
          _$WeighModuleImpl value, $Res Function(_$WeighModuleImpl) then) =
      __$$WeighModuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'controller_id') int controllerId,
      @JsonKey(name: 'bus_channel') String busChannel,
      int address,
      String name,
      @JsonKey(name: 'default_led_color') String defaultLedColor,
      @JsonKey(name: 'calibration_weight') double? calibrationWeight,
      @JsonKey(name: 'tare_offset') double tareOffset,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'latest_reading') WeightReading? latestReading});

  @override
  $WeightReadingCopyWith<$Res>? get latestReading;
}

/// @nodoc
class __$$WeighModuleImplCopyWithImpl<$Res>
    extends _$WeighModuleCopyWithImpl<$Res, _$WeighModuleImpl>
    implements _$$WeighModuleImplCopyWith<$Res> {
  __$$WeighModuleImplCopyWithImpl(
      _$WeighModuleImpl _value, $Res Function(_$WeighModuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeighModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controllerId = null,
    Object? busChannel = null,
    Object? address = null,
    Object? name = null,
    Object? defaultLedColor = null,
    Object? calibrationWeight = freezed,
    Object? tareOffset = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? latestReading = freezed,
  }) {
    return _then(_$WeighModuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      controllerId: null == controllerId
          ? _value.controllerId
          : controllerId // ignore: cast_nullable_to_non_nullable
              as int,
      busChannel: null == busChannel
          ? _value.busChannel
          : busChannel // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      defaultLedColor: null == defaultLedColor
          ? _value.defaultLedColor
          : defaultLedColor // ignore: cast_nullable_to_non_nullable
              as String,
      calibrationWeight: freezed == calibrationWeight
          ? _value.calibrationWeight
          : calibrationWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      tareOffset: null == tareOffset
          ? _value.tareOffset
          : tareOffset // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latestReading: freezed == latestReading
          ? _value.latestReading
          : latestReading // ignore: cast_nullable_to_non_nullable
              as WeightReading?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeighModuleImpl implements _WeighModule {
  const _$WeighModuleImpl(
      {required this.id,
      @JsonKey(name: 'controller_id') required this.controllerId,
      @JsonKey(name: 'bus_channel') required this.busChannel,
      required this.address,
      required this.name,
      @JsonKey(name: 'default_led_color') required this.defaultLedColor,
      @JsonKey(name: 'calibration_weight') this.calibrationWeight,
      @JsonKey(name: 'tare_offset') required this.tareOffset,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'latest_reading') this.latestReading});

  factory _$WeighModuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeighModuleImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'controller_id')
  final int controllerId;
  @override
  @JsonKey(name: 'bus_channel')
  final String busChannel;
  @override
  final int address;
  @override
  final String name;
  @override
  @JsonKey(name: 'default_led_color')
  final String defaultLedColor;
  @override
  @JsonKey(name: 'calibration_weight')
  final double? calibrationWeight;
  @override
  @JsonKey(name: 'tare_offset')
  final double tareOffset;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'latest_reading')
  final WeightReading? latestReading;

  @override
  String toString() {
    return 'WeighModule(id: $id, controllerId: $controllerId, busChannel: $busChannel, address: $address, name: $name, defaultLedColor: $defaultLedColor, calibrationWeight: $calibrationWeight, tareOffset: $tareOffset, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, latestReading: $latestReading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeighModuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.controllerId, controllerId) ||
                other.controllerId == controllerId) &&
            (identical(other.busChannel, busChannel) ||
                other.busChannel == busChannel) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.defaultLedColor, defaultLedColor) ||
                other.defaultLedColor == defaultLedColor) &&
            (identical(other.calibrationWeight, calibrationWeight) ||
                other.calibrationWeight == calibrationWeight) &&
            (identical(other.tareOffset, tareOffset) ||
                other.tareOffset == tareOffset) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.latestReading, latestReading) ||
                other.latestReading == latestReading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      controllerId,
      busChannel,
      address,
      name,
      defaultLedColor,
      calibrationWeight,
      tareOffset,
      isActive,
      createdAt,
      updatedAt,
      latestReading);

  /// Create a copy of WeighModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeighModuleImplCopyWith<_$WeighModuleImpl> get copyWith =>
      __$$WeighModuleImplCopyWithImpl<_$WeighModuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeighModuleImplToJson(
      this,
    );
  }
}

abstract class _WeighModule implements WeighModule {
  const factory _WeighModule(
      {required final int id,
      @JsonKey(name: 'controller_id') required final int controllerId,
      @JsonKey(name: 'bus_channel') required final String busChannel,
      required final int address,
      required final String name,
      @JsonKey(name: 'default_led_color') required final String defaultLedColor,
      @JsonKey(name: 'calibration_weight') final double? calibrationWeight,
      @JsonKey(name: 'tare_offset') required final double tareOffset,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'latest_reading')
      final WeightReading? latestReading}) = _$WeighModuleImpl;

  factory _WeighModule.fromJson(Map<String, dynamic> json) =
      _$WeighModuleImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'controller_id')
  int get controllerId;
  @override
  @JsonKey(name: 'bus_channel')
  String get busChannel;
  @override
  int get address;
  @override
  String get name;
  @override
  @JsonKey(name: 'default_led_color')
  String get defaultLedColor;
  @override
  @JsonKey(name: 'calibration_weight')
  double? get calibrationWeight;
  @override
  @JsonKey(name: 'tare_offset')
  double get tareOffset;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'latest_reading')
  WeightReading? get latestReading;

  /// Create a copy of WeighModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeighModuleImplCopyWith<_$WeighModuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
