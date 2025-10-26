import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iot_weight_pwa/models/weight_reading.dart';

part 'weigh_module.freezed.dart';
part 'weigh_module.g.dart';

@freezed
class WeighModule with _$WeighModule {
  const factory WeighModule({
    required int id,
    @JsonKey(name: 'controller_id') required int controllerId,
    @JsonKey(name: 'bus_channel') required String busChannel,
    required int address,
    required String name,
    @JsonKey(name: 'default_led_color') required String defaultLedColor,
    @JsonKey(name: 'calibration_weight') double? calibrationWeight,
    @JsonKey(name: 'tare_offset') required double tareOffset,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'latest_reading') WeightReading? latestReading,
  }) = _WeighModule;

  factory WeighModule.fromJson(Map<String, dynamic> json) => _$WeighModuleFromJson(json);
}
