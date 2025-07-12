import 'package:equatable/equatable.dart';
import 'package:travel_plan_mobile/src/domain/entity/trip_detail_data.dart';

abstract class TripDetailState extends Equatable {
  const TripDetailState();

  @override
  List<Object?> get props => [];
}

class TripDetailInitial extends TripDetailState {}

class TripDetailLoading extends TripDetailState {}

class TripDetailLoadSuccess extends TripDetailState {
  final TripDetailData data;

  const TripDetailLoadSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class TripDetailLoadFailure extends TripDetailState {
  final String error;

  const TripDetailLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class TripDetailNotAvailable extends TripDetailState {}
