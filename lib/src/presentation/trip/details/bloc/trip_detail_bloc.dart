import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_plan_mobile/src/common/trip_detail_storage.dart';
import 'package:travel_plan_mobile/src/presentation/trip/details/bloc/trip_detail_event.dart';
import 'package:travel_plan_mobile/src/presentation/trip/details/bloc/trip_detail_state.dart';

class TripDetailBloc extends Bloc<TripDetailEvent, TripDetailState> {
  final TripDetailStorage _storage = TripDetailStorage();

  TripDetailBloc() : super(TripDetailInitial()) {
    on<FetchTripDetail>(_onFetchTripDetail);
    on<CheckTripDetailAvailability>(_onCheckTripDetailAvailability);
  }

  Future<void> _onFetchTripDetail(
    FetchTripDetail event,
    Emitter<TripDetailState> emit,
  ) async {
    try {
      emit(TripDetailLoading());
      
      // Check storage first
      final storedTripDetail = _storage.getTripDetail();
      if (storedTripDetail != null) {
        emit(TripDetailLoadSuccess(data: storedTripDetail));
      } else {
        emit(TripDetailNotAvailable());
      }
      
      // // If not in storage, try to fetch from repository
      // final tripDetailData = await _tripRepository.getTripDetails(event.tripId);
      
      // // Store the fetched data
      // _storage.setTripDetail(tripDetailData);
      
      // emit(TripDetailLoadSuccess(data: tripDetailData));
    } catch (e) {
      emit(TripDetailLoadFailure('Failed to load trip details'));
    }
  }

  void _onCheckTripDetailAvailability(
    CheckTripDetailAvailability event,
    Emitter<TripDetailState> emit,
  ) {
    final storedTripDetail = _storage.getTripDetail();
    if (storedTripDetail != null) {
      emit(TripDetailLoadSuccess(data: storedTripDetail));
    } else {
      emit(TripDetailNotAvailable());
    }
  }
}
