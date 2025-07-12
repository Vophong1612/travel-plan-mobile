// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planning_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanningStatusModel _$PlanningStatusModelFromJson(Map<String, dynamic> json) =>
    PlanningStatusModel(
      tripId: json['trip_id'] as String,
      state: json['state'] as String,
      currentDay: (json['current_day'] as num).toInt(),
      totalDays: (json['total_days'] as num).toInt(),
      progress: (json['progress'] as num).toDouble(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PlanningStatusModelToJson(
  PlanningStatusModel instance,
) => <String, dynamic>{
  'trip_id': instance.tripId,
  'state': instance.state,
  'current_day': instance.currentDay,
  'total_days': instance.totalDays,
  'progress': instance.progress,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
