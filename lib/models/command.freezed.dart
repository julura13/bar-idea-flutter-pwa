// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Command _$CommandFromJson(Map<String, dynamic> json) {
  return _Command.fromJson(json);
}

/// @nodoc
mixin _$Command {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'controller_id')
  int get controllerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bus_channel')
  String get busChannel => throw _privateConstructorUsedError;
  int get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'command_type')
  String get commandType => throw _privateConstructorUsedError;
  @JsonKey(name: 'command_payload')
  String get commandPayload => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_at')
  DateTime? get sentAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Command to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommandCopyWith<Command> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandCopyWith<$Res> {
  factory $CommandCopyWith(Command value, $Res Function(Command) then) =
      _$CommandCopyWithImpl<$Res, Command>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'controller_id') int controllerId,
      @JsonKey(name: 'bus_channel') String busChannel,
      int address,
      @JsonKey(name: 'command_type') String commandType,
      @JsonKey(name: 'command_payload') String commandPayload,
      String status,
      String? response,
      @JsonKey(name: 'sent_at') DateTime? sentAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$CommandCopyWithImpl<$Res, $Val extends Command>
    implements $CommandCopyWith<$Res> {
  _$CommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controllerId = null,
    Object? busChannel = null,
    Object? address = null,
    Object? commandType = null,
    Object? commandPayload = null,
    Object? status = null,
    Object? response = freezed,
    Object? sentAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      commandType: null == commandType
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
              as String,
      commandPayload: null == commandPayload
          ? _value.commandPayload
          : commandPayload // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$CommandImplCopyWith<$Res> implements $CommandCopyWith<$Res> {
  factory _$$CommandImplCopyWith(
          _$CommandImpl value, $Res Function(_$CommandImpl) then) =
      __$$CommandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'controller_id') int controllerId,
      @JsonKey(name: 'bus_channel') String busChannel,
      int address,
      @JsonKey(name: 'command_type') String commandType,
      @JsonKey(name: 'command_payload') String commandPayload,
      String status,
      String? response,
      @JsonKey(name: 'sent_at') DateTime? sentAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$CommandImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandImpl>
    implements _$$CommandImplCopyWith<$Res> {
  __$$CommandImplCopyWithImpl(
      _$CommandImpl _value, $Res Function(_$CommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controllerId = null,
    Object? busChannel = null,
    Object? address = null,
    Object? commandType = null,
    Object? commandPayload = null,
    Object? status = null,
    Object? response = freezed,
    Object? sentAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommandImpl(
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
      commandType: null == commandType
          ? _value.commandType
          : commandType // ignore: cast_nullable_to_non_nullable
              as String,
      commandPayload: null == commandPayload
          ? _value.commandPayload
          : commandPayload // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$CommandImpl implements _Command {
  const _$CommandImpl(
      {required this.id,
      @JsonKey(name: 'controller_id') required this.controllerId,
      @JsonKey(name: 'bus_channel') required this.busChannel,
      required this.address,
      @JsonKey(name: 'command_type') required this.commandType,
      @JsonKey(name: 'command_payload') required this.commandPayload,
      required this.status,
      this.response,
      @JsonKey(name: 'sent_at') this.sentAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$CommandImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommandImplFromJson(json);

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
  @JsonKey(name: 'command_type')
  final String commandType;
  @override
  @JsonKey(name: 'command_payload')
  final String commandPayload;
  @override
  final String status;
  @override
  final String? response;
  @override
  @JsonKey(name: 'sent_at')
  final DateTime? sentAt;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Command(id: $id, controllerId: $controllerId, busChannel: $busChannel, address: $address, commandType: $commandType, commandPayload: $commandPayload, status: $status, response: $response, sentAt: $sentAt, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.controllerId, controllerId) ||
                other.controllerId == controllerId) &&
            (identical(other.busChannel, busChannel) ||
                other.busChannel == busChannel) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.commandType, commandType) ||
                other.commandType == commandType) &&
            (identical(other.commandPayload, commandPayload) ||
                other.commandPayload == commandPayload) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      controllerId,
      busChannel,
      address,
      commandType,
      commandPayload,
      status,
      response,
      sentAt,
      completedAt,
      createdAt,
      updatedAt);

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      __$$CommandImplCopyWithImpl<_$CommandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommandImplToJson(
      this,
    );
  }
}

abstract class _Command implements Command {
  const factory _Command(
      {required final int id,
      @JsonKey(name: 'controller_id') required final int controllerId,
      @JsonKey(name: 'bus_channel') required final String busChannel,
      required final int address,
      @JsonKey(name: 'command_type') required final String commandType,
      @JsonKey(name: 'command_payload') required final String commandPayload,
      required final String status,
      final String? response,
      @JsonKey(name: 'sent_at') final DateTime? sentAt,
      @JsonKey(name: 'completed_at') final DateTime? completedAt,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
      required final DateTime updatedAt}) = _$CommandImpl;

  factory _Command.fromJson(Map<String, dynamic> json) = _$CommandImpl.fromJson;

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
  @JsonKey(name: 'command_type')
  String get commandType;
  @override
  @JsonKey(name: 'command_payload')
  String get commandPayload;
  @override
  String get status;
  @override
  String? get response;
  @override
  @JsonKey(name: 'sent_at')
  DateTime? get sentAt;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of Command
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
