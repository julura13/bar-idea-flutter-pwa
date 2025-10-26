// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weigh_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeighModuleImpl _$$WeighModuleImplFromJson(Map<String, dynamic> json) =>
    _$WeighModuleImpl(
      id: (json['id'] as num).toInt(),
      controllerId: (json['controller_id'] as num).toInt(),
      busChannel: json['bus_channel'] as String,
      address: (json['address'] as num).toInt(),
      name: json['name'] as String,
      defaultLedColor: json['default_led_color'] as String,
      calibrationWeight: (json['calibration_weight'] as num?)?.toDouble(),
      tareOffset: (json['tare_offset'] as num).toDouble(),
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      latestReading: json['latest_reading'] == null
          ? null
          : WeightReading.fromJson(
              json['latest_reading'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeighModuleImplToJson(_$WeighModuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'controller_id': instance.controllerId,
      'bus_channel': instance.busChannel,
      'address': instance.address,
      'name': instance.name,
      'default_led_color': instance.defaultLedColor,
      'calibration_weight': instance.calibrationWeight,
      'tare_offset': instance.tareOffset,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'latest_reading': instance.latestReading,
    };
