import 'package:equatable/equatable.dart';

class PlanningStatus extends Equatable {
  final String tripId;
  final String state;
  final int currentDay;
  final int totalDays;
  final double progress;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PlanningStatus({
    required this.tripId,
    required this.state,
    required this.currentDay,
    required this.totalDays,
    required this.progress,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        tripId,
        state,
        currentDay,
        totalDays,
        progress,
        createdAt,
        updatedAt,
      ];
} 