import 'package:json_annotation/json_annotation.dart';
import 'package:travel_plan_mobile/src/data/model/location_model.dart';

part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel {
  final String id;
  final String name;
  final String type;
  final String? description;
  final LocationModel location;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  final double? cost;
  final String currency;
  @JsonKey(name: 'booking_url')
  final String? bookingUrl;
  @JsonKey(name: 'booking_reference')
  final String? bookingReference;
  final double? rating;
  @JsonKey(name: 'review_count')
  final int? reviewCount;
  @JsonKey(name: 'travel_time_from_previous')
  final int? travelTimeFromPrevious;
  @JsonKey(name: 'travel_mode')
  final String? travelMode;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String? source;

  ActivityModel({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    required this.location,
    this.startTime,
    this.endTime,
    this.durationMinutes,
    this.cost,
    required this.currency,
    this.bookingUrl,
    this.bookingReference,
    this.rating,
    this.reviewCount,
    this.travelTimeFromPrevious,
    this.travelMode,
    required this.createdAt,
    this.source,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
} 