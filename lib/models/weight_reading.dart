import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_reading.freezed.dart';
part 'weight_reading.g.dart';

@freezed
class WeightReading with _$WeightReading {
  const factory WeightReading({
    required int id,
    @JsonKey(name: 'weigh_module_id') required int weighModuleId,
    @JsonKey(name: 'weight_value') required double weightValue,
    required String unit,
    @JsonKey(name: 'read_at') required DateTime readAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _WeightReading;

  factory WeightReading.fromJson(Map<String, dynamic> json) => _$WeightReadingFromJson(json);
}
