import 'package:travel_plan_mobile/src/data/model/send_message_response.dart';
import 'package:travel_plan_mobile/src/data/model/trip_detail_response.dart';
import 'package:travel_plan_mobile/src/data/model/trip_model.dart';
import 'package:travel_plan_mobile/src/data/model/itinerary_model.dart';
import 'package:travel_plan_mobile/src/data/model/activity_model.dart';
import 'package:travel_plan_mobile/src/data/model/location_model.dart';
import 'package:travel_plan_mobile/src/data/model/planning_status_model.dart';

/// Mapper class to convert SendMessageResponse to TripDetailResponse
class SendMessageToTripDetailMapper {
  
  /// Maps SendMessageResponse to TripDetailResponse
  static TripDetailResponse map(SendMessageResponse sendMessageResponse) {
    return TripDetailResponse(
      success: sendMessageResponse.success ?? false,
      data: _mapTripDetailData(sendMessageResponse),
      error: sendMessageResponse.error,
      timestamp: sendMessageResponse.timestamp ?? DateTime.now().toIso8601String(),
    );
  }

  /// Maps the trip details data
  static TripDetailDataResponse? _mapTripDetailData(SendMessageResponse response) {
    final tripDetails = response.tripDetails;
    if (tripDetails == null) return null;

    return TripDetailDataResponse(
      trip: _mapTripModel(response),
      planningStatus: _mapPlanningStatus(response),
    );
  }

  /// Maps to TripModel
  static TripModel _mapTripModel(SendMessageResponse response) {
    final tripDetails = response.tripDetails!;
    final extractedInfo = response.extractedInfo;
    
    return TripModel(
      tripId: tripDetails.tripId ?? '',
      userId: tripDetails.userId ?? '',
      destination: tripDetails.destination ?? extractedInfo?.destination ?? '',
      startDate: tripDetails.startDate ?? extractedInfo?.startDate ?? '',
      endDate: tripDetails.endDate ?? extractedInfo?.endDate ?? '',
      durationDays: tripDetails.durationDays ?? extractedInfo?.durationDays ?? 0,
      title: _generateTitle(tripDetails.destination ?? extractedInfo?.destination),
      description: _generateDescription(tripDetails.destination ?? extractedInfo?.destination, tripDetails.durationDays ?? extractedInfo?.durationDays),
      status: tripDetails.status ?? 'planned',
      itinerary: _mapItineraryList(tripDetails.itinerary),
      estimatedTotalCost: _calculateEstimatedTotalCost(tripDetails.itinerary),
      actualTotalCost: null, // Not available in SendMessageResponse
      budgetCurrency: _getBudgetCurrency(tripDetails.userProfile),
      createdAt: tripDetails.createdAt ?? DateTime.now().toIso8601String(),
      updatedAt: tripDetails.createdAt ?? DateTime.now().toIso8601String(),
      confirmedAt: _getConfirmedAt(tripDetails.itinerary),
    );
  }

  /// Maps to PlanningStatusModel
  static PlanningStatusModel? _mapPlanningStatus(SendMessageResponse response) {
    final tripDetails = response.tripDetails;
    if (tripDetails == null) return null;

    final itinerary = tripDetails.itinerary;
    final totalDays = itinerary?.length ?? 0;
    final currentDay = _calculateCurrentDay(itinerary);
    final progress = totalDays > 0 ? (currentDay / totalDays) * 100 : 0.0;

    return PlanningStatusModel(
      tripId: tripDetails.tripId ?? '',
      state: _mapStatusToState(tripDetails.status),
      currentDay: currentDay,
      totalDays: totalDays,
      progress: progress,
      createdAt: tripDetails.createdAt ?? DateTime.now().toIso8601String(),
      updatedAt: tripDetails.createdAt ?? DateTime.now().toIso8601String(),
    );
  }

  /// Maps itinerary list
  static List<ItineraryModel> _mapItineraryList(List<ItineraryDay>? itineraryDays) {
    if (itineraryDays == null) return [];
    
    return itineraryDays.map((day) => _mapItineraryModel(day)).toList();
  }

  /// Maps single itinerary day
  static ItineraryModel _mapItineraryModel(ItineraryDay day) {
    return ItineraryModel(
      dayIndex: day.dayIndex ?? 0,
      date: day.date ?? '',
      theme: day.theme,
      status: day.status ?? 'pending_confirmation',
      activities: _mapActivityList(day.activities),
      totalCost: day.totalCost,
      totalDurationMinutes: day.totalDurationMinutes,
      travelDistanceKm: day.travelDistanceKm,
      createdAt: day.createdAt ?? DateTime.now().toIso8601String(),
      confirmedAt: day.confirmedAt,
      revisionCount: day.revisionCount ?? 0,
    );
  }

  /// Maps activity list
  static List<ActivityModel> _mapActivityList(List<Activity>? activities) {
    if (activities == null) return [];
    
    return activities.map((activity) => _mapActivityModel(activity)).toList();
  }

  /// Maps single activity
  static ActivityModel _mapActivityModel(Activity activity) {
    return ActivityModel(
      id: activity.id ?? '',
      name: activity.name ?? '',
      type: activity.type ?? '',
      description: activity.description,
      location: _mapLocationModel(activity.location),
      startTime: activity.startTime,
      endTime: activity.endTime,
      durationMinutes: activity.durationMinutes,
      cost: activity.cost,
      currency: activity.currency ?? 'USD',
      bookingUrl: activity.bookingUrl,
      bookingReference: activity.bookingReference,
      rating: activity.rating,
      reviewCount: activity.reviewCount,
      travelTimeFromPrevious: activity.travelTimeFromPrevious,
      travelMode: activity.travelMode,
      createdAt: activity.createdAt ?? DateTime.now().toIso8601String(),
      source: activity.source,
    );
  }

  /// Maps location
  static LocationModel _mapLocationModel(Location? location) {
    if (location == null) {
      return LocationModel(
        name: 'Unknown Location',
        address: null,
        latitude: null,
        longitude: null,
        placeId: null,
        country: null,
        city: null,
      );
    }

    return LocationModel(
      name: location.name ?? 'Unknown Location',
      address: location.address,
      latitude: location.latitude,
      longitude: location.longitude,
      placeId: location.placeId,
      country: location.country,
      city: location.city,
    );
  }

  /// Helper method to generate title
  static String? _generateTitle(String? destination) {
    if (destination == null || destination.isEmpty) return null;
    return 'Trip to $destination';
  }

  /// Helper method to generate description
  static String? _generateDescription(String? destination, int? durationDays) {
    if (destination == null || destination.isEmpty) return null;
    final days = durationDays ?? 0;
    return 'A ${days}-day trip to $destination with carefully planned activities and experiences.';
  }

  /// Helper method to calculate estimated total cost
  static double? _calculateEstimatedTotalCost(List<ItineraryDay>? itinerary) {
    if (itinerary == null) return null;
    
    double totalCost = 0.0;
    for (final day in itinerary) {
      totalCost += day.totalCost ?? 0.0;
    }
    return totalCost > 0 ? totalCost : null;
  }

  /// Helper method to get budget currency
  static String _getBudgetCurrency(UserProfile? userProfile) {
    return userProfile?.budget?.currency ?? 'USD';
  }

  /// Helper method to get confirmed at timestamp
  static String? _getConfirmedAt(List<ItineraryDay>? itinerary) {
    if (itinerary == null || itinerary.isEmpty) return null;
    
    // Find the first day that has been confirmed
    for (final day in itinerary) {
      if (day.confirmedAt != null) {
        return day.confirmedAt;
      }
    }
    return null;
  }

  /// Helper method to calculate current day
  static int _calculateCurrentDay(List<ItineraryDay>? itinerary) {
    if (itinerary == null || itinerary.isEmpty) return 0;
    
    // Find the first day that has been confirmed
    for (int i = 0; i < itinerary.length; i++) {
      final day = itinerary[i];
      if (day.confirmedAt != null) {
        return i + 1;
      }
    }
    return 0;
  }

  /// Helper method to map status to state
  static String _mapStatusToState(String? status) {
    switch (status) {
      case 'planned':
        return 'completed';
      case 'planning_in_progress':
        return 'in_progress';
      case 'pending_confirmation':
        return 'pending';
      default:
        return 'pending';
    }
  }
} 