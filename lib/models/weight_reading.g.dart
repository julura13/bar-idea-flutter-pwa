// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightReadingImpl _$$WeightReadingImplFromJson(Map<String, dynamic> json) =>
    _$WeightReadingImpl(
      id: (json['id'] as num).toInt(),
      weighModuleId: (json['weigh_module_id'] as num).toInt(),
      weightValue: (json['weight_value'] as num).toDouble(),
      unit: json['unit'] as String,
      readAt: DateTime.parse(json['read_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$WeightReadingImplToJson(_$WeightReadingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weigh_module_id': instance.weighModuleId,
      'weight_value': instance.weightValue,
      'unit': instance.unit,
      'read_at': instance.readAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
