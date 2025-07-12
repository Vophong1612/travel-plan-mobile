import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travel_plan_mobile/src/domain/entity/location.dart';

class Activity extends Equatable {
  final String id;
  final String name;
  final String type;
  final String? description;
  final Location location;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? durationMinutes;
  final double? cost;
  final String currency;
  final String? bookingUrl;
  final String? bookingReference;
  final double? rating;
  final int? reviewCount;
  final int? travelTimeFromPrevious;
  final String? travelMode;
  final DateTime createdAt;
  final String? source;

  const Activity({
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

  IconData get icon {
    switch (type.toLowerCase()) {
      case 'sightseeing':
        return Icons.camera_alt;
      case 'cultural':
        return Icons.museum;
      case 'dining':
      case 'food':
        return Icons.restaurant;
      case 'outdoor':
        return Icons.nature_people;
      case 'entertainment':
        return Icons.movie;
      case 'shopping':
        return Icons.shopping_bag;
      case 'transport':
        return Icons.directions_bus;
      case 'accommodation':
        return Icons.hotel;
      case 'relaxation':
        return Icons.spa;
      case 'business':
        return Icons.business;
      default:
        return Icons.check_circle;
    }
  }

  String get timeRange {
    if (startTime == null || endTime == null) {
      return '';
    }
    return '${startTime?.hour.toString().padLeft(2, '0')}:${startTime?.minute.toString().padLeft(2, '0')} - ${endTime?.hour.toString().padLeft(2, '0')}:${endTime?.minute.toString().padLeft(2, '0')}';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        description,
        location,
        startTime,
        endTime,
        durationMinutes,
        cost,
        currency,
        bookingUrl,
        bookingReference,
        rating,
        reviewCount,
        travelTimeFromPrevious,
        travelMode,
        createdAt,
        source,
      ];
} 