import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iot_weight_pwa/models/weigh_module.dart';

part 'controller.freezed.dart';
part 'controller.g.dart';

@freezed
class Controller with _$Controller {
  const factory Controller({
    required int id,
    @JsonKey(name: 'client_id') required int clientId,
    @JsonKey(name: 'mac_address') required String macAddress,
    required String name,
    required String status,
    @JsonKey(name: 'last_seen_at') DateTime? lastSeenAt,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @Default([]) List<WeighModule> weighModules,
  }) = _Controller;

  factory Controller.fromJson(Map<String, dynamic> json) => _$ControllerFromJson(json);
}
