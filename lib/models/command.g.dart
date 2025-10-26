// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommandImpl _$$CommandImplFromJson(Map<String, dynamic> json) =>
    _$CommandImpl(
      id: (json['id'] as num).toInt(),
      controllerId: (json['controller_id'] as num).toInt(),
      busChannel: json['bus_channel'] as String,
      address: (json['address'] as num).toInt(),
      commandType: json['command_type'] as String,
      commandPayload: json['command_payload'] as String,
      status: json['status'] as String,
      response: json['response'] as String?,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CommandImplToJson(_$CommandImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'controller_id': instance.controllerId,
      'bus_channel': instance.busChannel,
      'address': instance.address,
      'command_type': instance.commandType,
      'command_payload': instance.commandPayload,
      'status': instance.status,
      'response': instance.response,
      'sent_at': instance.sentAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
