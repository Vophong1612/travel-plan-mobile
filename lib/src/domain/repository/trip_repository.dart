import 'package:travel_plan_mobile/src/domain/entity/trip_detail_data.dart';

abstract class TripRepository {
  Future<TripDetailData> getTripDetails(String tripId);
}
