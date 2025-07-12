import 'package:equatable/equatable.dart';
import 'package:travel_plan_mobile/src/domain/entity/planning_status.dart';
import 'package:travel_plan_mobile/src/domain/entity/trip.dart';

class TripDetailData extends Equatable {
  final Trip trip;
  final PlanningStatus? planningStatus;

  const TripDetailData({
    required this.trip,
    this.planningStatus,
  });

  @override
  List<Object?> get props => [trip, planningStatus];
} 