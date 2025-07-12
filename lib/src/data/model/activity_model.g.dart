// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(
  Map<String, dynamic> json,
) => ActivityModel(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  description: json['description'] as String?,
  location: LocationModel.fromJson(json['location'] as Map<String, dynamic>),
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
  durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
  cost: (json['cost'] as num?)?.toDouble(),
  currency: json['currency'] as String,
  bookingUrl: json['booking_url'] as String?,
  bookingReference: json['booking_reference'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['review_count'] as num?)?.toInt(),
  travelTimeFromPrevious: (json['travel_time_from_previous'] as num?)?.toInt(),
  travelMode: json['travel_mode'] as String?,
  createdAt: json['created_at'] as String,
  source: json['source'] as String?,
);

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'location': instance.location,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration_minutes': instance.durationMinutes,
      'cost': instance.cost,
      'currency': instance.currency,
      'booking_url': instance.bookingUrl,
      'booking_reference': instance.bookingReference,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'travel_time_from_previous': instance.travelTimeFromPrevious,
      'travel_mode': instance.travelMode,
      'created_at': instance.createdAt,
      'source': instance.source,
    };
