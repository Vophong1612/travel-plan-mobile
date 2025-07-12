import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:travel_plan_mobile/src/domain/entity/itinerary.dart';
import 'package:travel_plan_mobile/src/domain/entity/trip.dart' show Trip;
import 'package:travel_plan_mobile/src/presentation/trip/details/bloc/trip_detail_bloc.dart';
import 'package:travel_plan_mobile/src/presentation/trip/details/bloc/trip_detail_event.dart';
import 'package:travel_plan_mobile/src/presentation/trip/details/bloc/trip_detail_state.dart';
import 'package:travel_plan_mobile/injection.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key, required this.tripId});

  final String tripId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<TripDetailBloc>()..add(FetchTripDetail(tripId)),
      child: const TripDetailView(),
    );
  }
}

class TripDetailView extends StatelessWidget {
  const TripDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: BlocBuilder<TripDetailBloc, TripDetailState>(
          builder: (context, state) {
            if (state is TripDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TripDetailLoadSuccess) {
              final trip = state.data.trip;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTripSummary(context, trip),
                    const SizedBox(height: 36),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Daily Schedule', style: textTheme.titleLarge),
                    ),
                    const SizedBox(height: 8),
                    CarouselSlider.builder(
                      itemCount: trip.itinerary.length,
                      itemBuilder: (context, index, realIndex) {
                        final dayItinerary = trip.itinerary[index];
                        return DailyItineraryCard(itinerary: dayItinerary);
                      },
                      options: CarouselOptions(
                        height: 500,
                        initialPage: trip.currentDayIndex - 1,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: false,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is TripDetailLoadFailure) {
              return Center(child: Text(state.error));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/chat');
        },
        child: const Icon(Icons.chat_bubble_outline),
      ),
    );
  }

  Widget _buildTripSummary(BuildContext context, Trip trip) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.primaryFixed.withValues(alpha: 0),
            colorScheme.primaryFixed.withValues(alpha: 0.1),
            colorScheme.primaryFixed.withValues(alpha: 0.2),
            colorScheme.primaryFixed.withValues(alpha: 0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(trip.title ?? '', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 4),
                _buildCurrentTripDay(context, trip.currentDay),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, color: colorScheme.onPrimaryFixed),
              const SizedBox(width: 8),
              Text(trip.destination),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_month, color: colorScheme.onPrimaryFixed),
              const SizedBox(width: 8),
              Text(
                '${DateFormat.yMMMd().format(trip.startDate)} - ${DateFormat.yMMMd().format(trip.endDate)} (${trip.durationDays} days)',
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (trip.estimatedTotalCost != null)
            Row(
              children: [
                Icon(Icons.wallet, color: colorScheme.onPrimaryFixed),
                const SizedBox(width: 8),
                Text('${trip.estimatedTotalCost} ${trip.budgetCurrency}'),
              ],
            ),
          const SizedBox(height: 8),
          Text(trip.description ?? ''),
        ],
      ),
    );
  }

  Widget _buildCurrentTripDay(BuildContext context, String day) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: colorScheme.primary, borderRadius: BorderRadius.circular(16)),
      child: Text(day, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary)),
    );
  }
}

class DailyItineraryCard extends StatelessWidget {
  const DailyItineraryCard({super.key, required this.itinerary});

  final Itinerary itinerary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: itinerary.isCurrentDay
            ? BoxDecoration(
                border: Border.all(color: colorScheme.outline, width: 2),
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Day ${itinerary.dayIndex} - ${DateFormat.yMMMd().format(itinerary.date)}',
                  style: textTheme.titleMedium,
                ),
                const Spacer(),
                if (itinerary.isCurrentDay)
                  Text('On-going', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colorScheme.tertiary)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              itinerary.theme ?? '',
              style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.7)),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: itinerary.activities.length,
                itemBuilder: (context, index) {
                  final activity = itinerary.activities[index];
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryFixed,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(activity.icon, size: 24.0),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  activity.name,
                                  style: textTheme.titleMedium?.copyWith(overflow: TextOverflow.ellipsis),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 16.0),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        activity.location.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 16.0),
                                    const SizedBox(width: 4),
                                    Text(
                                      activity.timeRange,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money, size: 16.0),
                                    const SizedBox(width: 4),
                                    Text('${activity.cost.toString()} ${activity.currency}'),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  activity.description ?? '',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
