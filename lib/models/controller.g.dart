// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ControllerImpl _$$ControllerImplFromJson(Map<String, dynamic> json) =>
    _$ControllerImpl(
      id: (json['id'] as num).toInt(),
      clientId: (json['client_id'] as num).toInt(),
      macAddress: json['mac_address'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      lastSeenAt: json['last_seen_at'] == null
          ? null
          : DateTime.parse(json['last_seen_at'] as String),
      ipAddress: json['ip_address'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      weighModules: (json['weighModules'] as List<dynamic>?)
              ?.map((e) => WeighModule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ControllerImplToJson(_$ControllerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.clientId,
      'mac_address': instance.macAddress,
      'name': instance.name,
      'status': instance.status,
      'last_seen_at': instance.lastSeenAt?.toIso8601String(),
      'ip_address': instance.ipAddress,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'weighModules': instance.weighModules,
    };
