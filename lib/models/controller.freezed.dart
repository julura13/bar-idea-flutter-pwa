// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Controller _$ControllerFromJson(Map<String, dynamic> json) {
  return _Controller.fromJson(json);
}

/// @nodoc
mixin _$Controller {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  int get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mac_address')
  String get macAddress => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_seen_at')
  DateTime? get lastSeenAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ip_address')
  String? get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<WeighModule> get weighModules => throw _privateConstructorUsedError;

  /// Serializes this Controller to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ControllerCopyWith<Controller> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControllerCopyWith<$Res> {
  factory $ControllerCopyWith(
          Controller value, $Res Function(Controller) then) =
      _$ControllerCopyWithImpl<$Res, Controller>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'mac_address') String macAddress,
      String name,
      String status,
      @JsonKey(name: 'last_seen_at') DateTime? lastSeenAt,
      @JsonKey(name: 'ip_address') String? ipAddress,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<WeighModule> weighModules});
}

/// @nodoc
class _$ControllerCopyWithImpl<$Res, $Val extends Controller>
    implements $ControllerCopyWith<$Res> {
  _$ControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? macAddress = null,
    Object? name = null,
    Object? status = null,
    Object? lastSeenAt = freezed,
    Object? ipAddress = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? weighModules = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weighModules: null == weighModules
          ? _value.weighModules
          : weighModules // ignore: cast_nullable_to_non_nullable
              as List<WeighModule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ControllerImplCopyWith<$Res>
    implements $ControllerCopyWith<$Res> {
  factory _$$ControllerImplCopyWith(
          _$ControllerImpl value, $Res Function(_$ControllerImpl) then) =
      __$$ControllerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'client_id') int clientId,
      @JsonKey(name: 'mac_address') String macAddress,
      String name,
      String status,
      @JsonKey(name: 'last_seen_at') DateTime? lastSeenAt,
      @JsonKey(name: 'ip_address') String? ipAddress,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<WeighModule> weighModules});
}

/// @nodoc
class __$$ControllerImplCopyWithImpl<$Res>
    extends _$ControllerCopyWithImpl<$Res, _$ControllerImpl>
    implements _$$ControllerImplCopyWith<$Res> {
  __$$ControllerImplCopyWithImpl(
      _$ControllerImpl _value, $Res Function(_$ControllerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? macAddress = null,
    Object? name = null,
    Object? status = null,
    Object? lastSeenAt = freezed,
    Object? ipAddress = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? weighModules = null,
  }) {
    return _then(_$ControllerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeenAt: freezed == lastSeenAt
          ? _value.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weighModules: null == weighModules
          ? _value._weighModules
          : weighModules // ignore: cast_nullable_to_non_nullable
              as List<WeighModule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ControllerImpl implements _Controller {
  const _$ControllerImpl(
      {required this.id,
      @JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'mac_address') required this.macAddress,
      required this.name,
      required this.status,
      @JsonKey(name: 'last_seen_at') this.lastSeenAt,
      @JsonKey(name: 'ip_address') this.ipAddress,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      final List<WeighModule> weighModules = const []})
      : _weighModules = weighModules;

  factory _$ControllerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ControllerImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'client_id')
  final int clientId;
  @override
  @JsonKey(name: 'mac_address')
  final String macAddress;
  @override
  final String name;
  @override
  final String status;
  @override
  @JsonKey(name: 'last_seen_at')
  final DateTime? lastSeenAt;
  @override
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final List<WeighModule> _weighModules;
  @override
  @JsonKey()
  List<WeighModule> get weighModules {
    if (_weighModules is EqualUnmodifiableListView) return _weighModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weighModules);
  }

  @override
  String toString() {
    return 'Controller(id: $id, clientId: $clientId, macAddress: $macAddress, name: $name, status: $status, lastSeenAt: $lastSeenAt, ipAddress: $ipAddress, createdAt: $createdAt, updatedAt: $updatedAt, weighModules: $weighModules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControllerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._weighModules, _weighModules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clientId,
      macAddress,
      name,
      status,
      lastSeenAt,
      ipAddress,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_weighModules));

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ControllerImplCopyWith<_$ControllerImpl> get copyWith =>
      __$$ControllerImplCopyWithImpl<_$ControllerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ControllerImplToJson(
      this,
    );
  }
}

abstract class _Controller implements Controller {
  const factory _Controller(
      {required final int id,
      @JsonKey(name: 'client_id') required final int clientId,
      @JsonKey(name: 'mac_address') required final String macAddress,
      required final String name,
      required final String status,
      @JsonKey(name: 'last_seen_at') final DateTime? lastSeenAt,
      @JsonKey(name: 'ip_address') final String? ipAddress,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final List<WeighModule> weighModules}) = _$ControllerImpl;

  factory _Controller.fromJson(Map<String, dynamic> json) =
      _$ControllerImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'client_id')
  int get clientId;
  @override
  @JsonKey(name: 'mac_address')
  String get macAddress;
  @override
  String get name;
  @override
  String get status;
  @override
  @JsonKey(name: 'last_seen_at')
  DateTime? get lastSeenAt;
  @override
  @JsonKey(name: 'ip_address')
  String? get ipAddress;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  List<WeighModule> get weighModules;

  /// Create a copy of Controller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ControllerImplCopyWith<_$ControllerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
