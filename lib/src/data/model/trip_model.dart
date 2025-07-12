import 'package:json_annotation/json_annotation.dart';
import 'package:travel_plan_mobile/src/data/model/itinerary_model.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class TripModel {
  @JsonKey(name: 'trip_id')
  final String tripId;
  @JsonKey(name: 'user_id')
  final String userId;
  final String destination;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'duration_days')
  final int durationDays;
  final String? title;
  final String? description;
  final String status;
  final List<ItineraryModel> itinerary;
  @JsonKey(name: 'estimated_total_cost')
  final double? estimatedTotalCost;
  @JsonKey(name: 'actual_total_cost')
  final double? actualTotalCost;
  @JsonKey(name: 'budget_currency')
  final String budgetCurrency;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'confirmed_at')
  final String? confirmedAt;

  TripModel({
    required this.tripId,
    required this.userId,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.durationDays,
    this.title,
    this.description,
    required this.status,
    required this.itinerary,
    this.estimatedTotalCost,
    this.actualTotalCost,
    required this.budgetCurrency,
    required this.createdAt,
    required this.updatedAt,
    this.confirmedAt,
  });

  String get statusText => status == 'planning_in_progress' ? 'In Progress' : 'Completed';

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Map<String, dynamic> toJson() => _$TripModelToJson(this);
} 