import 'package:travel_plan_mobile/src/domain/entity/trip_detail_data.dart';

/// Singleton class to temporarily store trip detail data while the app is running
class TripDetailStorage {
  static final TripDetailStorage _instance = TripDetailStorage._internal();
  factory TripDetailStorage() => _instance;
  TripDetailStorage._internal();

  TripDetailData? _tripDetail;

  /// Get the stored trip detail
  TripDetailData? get tripDetail => _tripDetail;

  /// Store trip detail data
  void setTripDetail(TripDetailData tripDetail) {
    _tripDetail = tripDetail;
  }

  /// Clear stored trip detail
  void clearTripDetail() {
    _tripDetail = null;
  }

  /// Check if trip detail exists
  bool get hasTripDetail => _tripDetail != null;

  /// Get trip detail or null if not available
  TripDetailData? getTripDetail() {
    return _tripDetail;
  }
} 