import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final String name;
  final String? address;
  final double? latitude;
  final double? longitude;
  @JsonKey(name: 'place_id')
  final String? placeId;
  final String? country;
  final String? city;

  LocationModel({
    required this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.placeId,
    this.country,
    this.city,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
} 