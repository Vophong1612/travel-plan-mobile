import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? placeId;
  final String? country;
  final String? city;

  const Location({
    required this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.placeId,
    this.country,
    this.city,
  });

  @override
  List<Object?> get props =>
      [name, address, latitude, longitude, placeId, country, city];
} 