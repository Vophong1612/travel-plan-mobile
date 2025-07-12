// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryModel _$ItineraryModelFromJson(Map<String, dynamic> json) =>
    ItineraryModel(
      dayIndex: (json['day_index'] as num).toInt(),
      date: json['date'] as String,
      theme: json['theme'] as String?,
      status: json['status'] as String,
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCost: (json['total_cost'] as num?)?.toDouble(),
      totalDurationMinutes: (json['total_duration_minutes'] as num?)?.toInt(),
      travelDistanceKm: (json['travel_distance_km'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String,
      confirmedAt: json['confirmed_at'] as String?,
      revisionCount: (json['revision_count'] as num).toInt(),
    );

Map<String, dynamic> _$ItineraryModelToJson(ItineraryModel instance) =>
    <String, dynamic>{
      'day_index': instance.dayIndex,
      'date': instance.date,
      'theme': instance.theme,
      'status': instance.status,
      'activities': instance.activities,
      'total_cost': instance.totalCost,
      'total_duration_minutes': instance.totalDurationMinutes,
      'travel_distance_km': instance.travelDistanceKm,
      'created_at': instance.createdAt,
      'confirmed_at': instance.confirmedAt,
      'revision_count': instance.revisionCount,
    };
