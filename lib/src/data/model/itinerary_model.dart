import 'package:json_annotation/json_annotation.dart';
import 'package:travel_plan_mobile/src/data/model/activity_model.dart';

part 'itinerary_model.g.dart';

@JsonSerializable()
class ItineraryModel {
  @JsonKey(name: 'day_index')
  final int dayIndex;
  final String date;
  final String? theme;
  final String status;
  final List<ActivityModel> activities;
  @JsonKey(name: 'total_cost')
  final double? totalCost;
  @JsonKey(name: 'total_duration_minutes')
  final int? totalDurationMinutes;
  @JsonKey(name: 'travel_distance_km')
  final double? travelDistanceKm;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'confirmed_at')
  final String? confirmedAt;
  @JsonKey(name: 'revision_count')
  final int revisionCount;

  ItineraryModel({
    required this.dayIndex,
    required this.date,
    this.theme,
    required this.status,
    required this.activities,
    this.totalCost,
    this.totalDurationMinutes,
    this.travelDistanceKm,
    required this.createdAt,
    this.confirmedAt,
    required this.revisionCount,
  });

  factory ItineraryModel.fromJson(Map<String, dynamic> json) =>
      _$ItineraryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryModelToJson(this);
} 