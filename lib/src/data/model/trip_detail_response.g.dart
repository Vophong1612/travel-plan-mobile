// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDetailResponse _$TripDetailResponseFromJson(Map<String, dynamic> json) =>
    TripDetailResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : TripDetailDataResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      error: json['error'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$TripDetailResponseToJson(TripDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

TripDetailDataResponse _$TripDetailDataResponseFromJson(
  Map<String, dynamic> json,
) => TripDetailDataResponse(
  trip: TripModel.fromJson(json['trip'] as Map<String, dynamic>),
  planningStatus: json['planning_status'] == null
      ? null
      : PlanningStatusModel.fromJson(
          json['planning_status'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TripDetailDataResponseToJson(
  TripDetailDataResponse instance,
) => <String, dynamic>{
  'trip': instance.trip,
  'planning_status': instance.planningStatus,
};
