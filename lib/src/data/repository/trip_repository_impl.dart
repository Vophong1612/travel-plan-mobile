import 'package:travel_plan_mobile/src/domain/entity/trip_detail_data.dart';
import 'package:travel_plan_mobile/src/domain/repository/trip_repository.dart';
import 'package:travel_plan_mobile/src/data/repository/mappers/trip_detail_mapper.dart';

class TripRepositoryImpl implements TripRepository {
  final dynamic _apiClient;
  final TripDetailMapper _mapper;

  TripRepositoryImpl(this._apiClient, this._mapper);

  @override
  Future<TripDetailData> getTripDetails(String tripId) async {
    try {
      final tripDetailResponse = await _apiClient.getTripDetails(tripId);
      if (tripDetailResponse.data != null) {
        return _mapper.map(tripDetailResponse.data!);
      } else {
        throw Exception(tripDetailResponse.error ?? 'Failed to get trip details');
      }
    } catch (e) {
      throw Exception('Failed to get trip details: $e');
    }
  }
}
