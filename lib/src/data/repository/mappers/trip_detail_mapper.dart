import 'package:travel_plan_mobile/src/data/model/activity_model.dart';
import 'package:travel_plan_mobile/src/data/model/itinerary_model.dart';
import 'package:travel_plan_mobile/src/data/model/location_model.dart';
import 'package:travel_plan_mobile/src/data/model/planning_status_model.dart';
import 'package:travel_plan_mobile/src/data/model/trip_detail_response.dart';
import 'package:travel_plan_mobile/src/data/model/trip_model.dart';
import 'package:travel_plan_mobile/src/domain/entity/activity.dart';
import 'package:travel_plan_mobile/src/domain/entity/itinerary.dart';
import 'package:travel_plan_mobile/src/domain/entity/location.dart';
import 'package:travel_plan_mobile/src/domain/entity/planning_status.dart';
import 'package:travel_plan_mobile/src/domain/entity/trip.dart';
import 'package:travel_plan_mobile/src/domain/entity/trip_detail_data.dart';

class TripDetailMapper {
  TripDetailData map(TripDetailDataResponse response) {
    return TripDetailData(
      trip: _mapTrip(response.trip),
      planningStatus: response.planningStatus != null
          ? _mapPlanningStatus(response.planningStatus!)
          : null,
    );
  }

  Trip _mapTrip(TripModel model) {
    return Trip(
      tripId: model.tripId,
      userId: model.userId,
      destination: model.destination,
      startDate: DateTime.parse(model.startDate),
      endDate: DateTime.parse(model.endDate),
      durationDays: model.durationDays,
      title: model.title,
      description: model.description,
      status: model.status,
      itinerary: model.itinerary.map(_mapItinerary).toList(),
      estimatedTotalCost: model.estimatedTotalCost,
      actualTotalCost: model.actualTotalCost,
      budgetCurrency: model.budgetCurrency,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
      confirmedAt: model.confirmedAt != null
          ? DateTime.parse(model.confirmedAt!)
          : null,
    );
  }

  Itinerary _mapItinerary(ItineraryModel model) {
    return Itinerary(
      dayIndex: model.dayIndex,
      date: DateTime.parse(model.date),
      theme: model.theme,
      status: model.status,
      activities: model.activities.map(_mapActivity).toList(),
      totalCost: model.totalCost,
      totalDurationMinutes: model.totalDurationMinutes,
      travelDistanceKm: model.travelDistanceKm,
      createdAt: DateTime.parse(model.createdAt),
      confirmedAt: model.confirmedAt != null
          ? DateTime.parse(model.confirmedAt!)
          : null,
      revisionCount: model.revisionCount,
    );
  }

  Activity _mapActivity(ActivityModel model) {
    return Activity(
      id: model.id,
      name: model.name,
      type: model.type,
      description: model.description,
      location: _mapLocation(model.location),
      startTime:
          model.startTime != null ? DateTime.parse(model.startTime!) : null,
      endTime: model.endTime != null ? DateTime.parse(model.endTime!) : null,
      durationMinutes: model.durationMinutes,
      cost: model.cost,
      currency: model.currency,
      bookingUrl: model.bookingUrl,
      bookingReference: model.bookingReference,
      rating: model.rating,
      reviewCount: model.reviewCount,
      travelTimeFromPrevious: model.travelTimeFromPrevious,
      travelMode: model.travelMode,
      createdAt: DateTime.parse(model.createdAt),
      source: model.source,
    );
  }

  Location _mapLocation(LocationModel model) {
    return Location(
      name: model.name,
      address: model.address,
      latitude: model.latitude,
      longitude: model.longitude,
      placeId: model.placeId,
      country: model.country,
      city: model.city,
    );
  }

  PlanningStatus _mapPlanningStatus(PlanningStatusModel model) {
    return PlanningStatus(
      tripId: model.tripId,
      state: model.state,
      currentDay: model.currentDay,
      totalDays: model.totalDays,
      progress: model.progress,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
    );
  }
} 