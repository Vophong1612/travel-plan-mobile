// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map<String, dynamic> json) => TripModel(
  tripId: json['trip_id'] as String,
  userId: json['user_id'] as String,
  destination: json['destination'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  durationDays: (json['duration_days'] as num).toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  status: json['status'] as String,
  itinerary: (json['itinerary'] as List<dynamic>)
      .map((e) => ItineraryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimatedTotalCost: (json['estimated_total_cost'] as num?)?.toDouble(),
  actualTotalCost: (json['actual_total_cost'] as num?)?.toDouble(),
  budgetCurrency: json['budget_currency'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  confirmedAt: json['confirmed_at'] as String?,
);

Map<String, dynamic> _$TripModelToJson(TripModel instance) => <String, dynamic>{
  'trip_id': instance.tripId,
  'user_id': instance.userId,
  'destination': instance.destination,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'duration_days': instance.durationDays,
  'title': instance.title,
  'description': instance.description,
  'status': instance.status,
  'itinerary': instance.itinerary,
  'estimated_total_cost': instance.estimatedTotalCost,
  'actual_total_cost': instance.actualTotalCost,
  'budget_currency': instance.budgetCurrency,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'confirmed_at': instance.confirmedAt,
};
