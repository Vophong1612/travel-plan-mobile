import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_plan_mobile/src/domain/repository/trip_repository.dart';
import 'package:travel_plan_mobile/src/presentation/trip/details/bloc/trip_detail_event.dart';
import 'package:travel_plan_mobile/src/presentation/trip/details/bloc/trip_detail_state.dart';

class TripDetailBloc extends Bloc<TripDetailEvent, TripDetailState> {
  final TripRepository _tripRepository;

  TripDetailBloc(this._tripRepository) : super(TripDetailInitial()) {
    on<FetchTripDetail>(_onFetchTripDetail);
  }

  Future<void> _onFetchTripDetail(
    FetchTripDetail event,
    Emitter<TripDetailState> emit,
  ) async {
    try {
      emit(TripDetailLoading());
      final tripDetailData = await _tripRepository.getTripDetails(event.tripId);
      emit(TripDetailLoadSuccess(
        data: tripDetailData,
      ));
    } catch (e) {
      emit(TripDetailLoadFailure('Failed to load trip details'));
    }
  }
}
