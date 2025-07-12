import 'package:equatable/equatable.dart';

abstract class TripDetailEvent extends Equatable {
  const TripDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchTripDetail extends TripDetailEvent {
  final String tripId;

  const FetchTripDetail(this.tripId);

  @override
  List<Object?> get props => [tripId];
}

class CheckTripDetailAvailability extends TripDetailEvent {}
