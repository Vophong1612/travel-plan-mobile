import 'package:json_annotation/json_annotation.dart';
import 'package:travel_plan_mobile/src/data/model/planning_status_model.dart';
import 'package:travel_plan_mobile/src/data/model/trip_model.dart';

part 'trip_detail_response.g.dart';

@JsonSerializable()
class TripDetailResponse {
  final bool success;
  final TripDetailDataResponse? data;
  final String? error;
  final String timestamp;

  TripDetailResponse({
    required this.success,
    this.data,
    this.error,
    required this.timestamp,
  });

  factory TripDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TripDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TripDetailResponseToJson(this);
}

@JsonSerializable()
class TripDetailDataResponse {
  final TripModel trip;
  @JsonKey(name: 'planning_status')
  final PlanningStatusModel? planningStatus;

  TripDetailDataResponse({
    required this.trip,
    this.planningStatus,
  });

  factory TripDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TripDetailDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TripDetailDataResponseToJson(this);
} 