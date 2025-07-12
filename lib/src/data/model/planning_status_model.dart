import 'package:json_annotation/json_annotation.dart';

part 'planning_status_model.g.dart';

@JsonSerializable()
class PlanningStatusModel {
  @JsonKey(name: 'trip_id')
  final String tripId;
  final String state;
  @JsonKey(name: 'current_day')
  final int currentDay;
  @JsonKey(name: 'total_days')
  final int totalDays;
  final double progress;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  PlanningStatusModel({
    required this.tripId,
    required this.state,
    required this.currentDay,
    required this.totalDays,
    required this.progress,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlanningStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PlanningStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanningStatusModelToJson(this);
} 