import 'package:equatable/equatable.dart';
import 'package:travel_plan_mobile/src/domain/entity/activity.dart';

class Itinerary extends Equatable {
  final int dayIndex;
  final DateTime date;
  final String? theme;
  final String status;
  final List<Activity> activities;
  final double? totalCost;
  final int? totalDurationMinutes;
  final double? travelDistanceKm;
  final DateTime createdAt;
  final DateTime? confirmedAt;
  final int revisionCount;

  bool get isCurrentDay {
    final now = DateTime.now();
    return now.year == date.year && now.month == date.month && now.day == date.day;
  }

  const Itinerary({
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

  @override
  List<Object?> get props => [
        dayIndex,
        date,
        theme,
        status,
        activities,
        totalCost,
        totalDurationMinutes,
        travelDistanceKm,
        createdAt,
        confirmedAt,
        revisionCount,
      ];
} 