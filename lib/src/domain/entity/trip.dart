import 'package:equatable/equatable.dart';
import 'package:travel_plan_mobile/src/domain/entity/itinerary.dart';

class Trip extends Equatable {
  final String tripId;
  final String userId;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final int durationDays;
  final String? title;
  final String? description;
  final String status;
  final List<Itinerary> itinerary;
  final double? estimatedTotalCost;
  final double? actualTotalCost;
  final String budgetCurrency;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? confirmedAt;

  const Trip({
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
  String get currentDay {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tripStart = DateTime(startDate.year, startDate.month, startDate.day);
    final tripEnd = DateTime(endDate.year, endDate.month, endDate.day);

    if (today.isBefore(tripStart)) {
      return 'Upcoming';
    }

    if (today.isAfter(tripEnd)) {
      return 'Ended';
    }

    final difference = today.difference(tripStart).inDays + 1;
    return 'Day $difference';
  }
  int get currentDayIndex {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tripStart = DateTime(startDate.year, startDate.month, startDate.day);
    final tripEnd = DateTime(endDate.year, endDate.month, endDate.day);

    if (today.isBefore(tripStart)) {
      return 0;
    }

    if (today.isAfter(tripEnd)) {
      return durationDays;
    }

    final difference = today.difference(tripStart).inDays + 1;
    return difference;
  }

  @override
  List<Object?> get props => [
        tripId,
        userId,
        destination,
        startDate,
        endDate,
        durationDays,
        title,
        description,
        status,
        itinerary,
        estimatedTotalCost,
        actualTotalCost,
        budgetCurrency,
        createdAt,
        updatedAt,
        confirmedAt,
      ];
} 