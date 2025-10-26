import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.freezed.dart';
part 'command.g.dart';

@freezed
class Command with _$Command {
  const factory Command({
    required int id,
    @JsonKey(name: 'controller_id') required int controllerId,
    @JsonKey(name: 'bus_channel') required String busChannel,
    required int address,
    @JsonKey(name: 'command_type') required String commandType,
    @JsonKey(name: 'command_payload') required String commandPayload,
    required String status,
    String? response,
    @JsonKey(name: 'sent_at') DateTime? sentAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Command;

  factory Command.fromJson(Map<String, dynamic> json) => _$CommandFromJson(json);
}
