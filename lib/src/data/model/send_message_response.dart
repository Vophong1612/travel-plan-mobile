import 'package:json_annotation/json_annotation.dart';

part 'send_message_response.g.dart';

@JsonSerializable()
class SendMessageResponse {
  final bool? success;
  final String? message;
  @JsonKey(name: 'trip_id')
  final String? tripId;
  @JsonKey(name: 'extracted_info')
  final ExtractedInfo? extractedInfo;
  @JsonKey(name: 'trip_details')
  final TripDetails? tripDetails;
  final String? error;
  final String? timestamp;

  SendMessageResponse({
    this.success,
    this.message,
    this.tripId,
    this.extractedInfo,
    this.tripDetails,
    this.error,
    this.timestamp,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageResponseToJson(this);
}

@JsonSerializable()
class ExtractedInfo {
  final String? destination;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'duration_days')
  final int? durationDays;
  @JsonKey(name: 'food_preferences')
  final List<String>? foodPreferences;
  final List<String>? activities;
  final int? travelers;
  @JsonKey(name: 'budget_level')
  final String? budgetLevel;

  ExtractedInfo({
    this.destination,
    this.startDate,
    this.endDate,
    this.durationDays,
    this.foodPreferences,
    this.activities,
    this.travelers,
    this.budgetLevel,
  });

  factory ExtractedInfo.fromJson(Map<String, dynamic> json) =>
      _$ExtractedInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ExtractedInfoToJson(this);
}

@JsonSerializable()
class TripDetails {
  @JsonKey(name: 'user_id')
  final String? userId;
  final String? destination;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'duration_days')
  final int? durationDays;
  @JsonKey(name: 'user_profile')
  final UserProfile? userProfile;
  final List<ItineraryDay>? itinerary;
  @JsonKey(name: 'extracted_preferences')
  final ExtractedPreferences? extractedPreferences;
  final String? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'trip_id')
  final String? tripId;

  TripDetails({
    this.userId,
    this.destination,
    this.startDate,
    this.endDate,
    this.durationDays,
    this.userProfile,
    this.itinerary,
    this.extractedPreferences,
    this.status,
    this.createdAt,
    this.tripId,
  });

  factory TripDetails.fromJson(Map<String, dynamic> json) =>
      _$TripDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TripDetailsToJson(this);
}

@JsonSerializable()
class UserProfile {
  @JsonKey(name: 'user_id')
  final String? userId;
  final Preferences? preferences;
  @JsonKey(name: 'traveler_info')
  final TravelerInfo? travelerInfo;
  final Budget? budget;

  UserProfile({
    this.userId,
    this.preferences,
    this.travelerInfo,
    this.budget,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class Preferences {
  @JsonKey(name: 'travel_style')
  final List<String>? travelStyle;
  final String? pace;
  final List<String>? interests;
  @JsonKey(name: 'dietary_restrictions')
  final String? dietaryRestrictions;
  @JsonKey(name: 'accommodation_preferences')
  final String? accommodationPreferences;
  @JsonKey(name: 'transport_preferences')
  final String? transportPreferences;
  @JsonKey(name: 'activity_preferences')
  final String? activityPreferences;

  Preferences({
    this.travelStyle,
    this.pace,
    this.interests,
    this.dietaryRestrictions,
    this.accommodationPreferences,
    this.transportPreferences,
    this.activityPreferences,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}

@JsonSerializable()
class TravelerInfo {
  @JsonKey(name: 'group_size')
  final int? groupSize;
  @JsonKey(name: 'travels_with')
  final List<String>? travelsWith;
  final List<int>? ages;
  @JsonKey(name: 'accessibility_needs')
  final String? accessibilityNeeds;

  TravelerInfo({
    this.groupSize,
    this.travelsWith,
    this.ages,
    this.accessibilityNeeds,
  });

  factory TravelerInfo.fromJson(Map<String, dynamic> json) =>
      _$TravelerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TravelerInfoToJson(this);
}

@JsonSerializable()
class Budget {
  final String? level;
  final String? currency;
  @JsonKey(name: 'daily_max')
  final double? dailyMax;
  @JsonKey(name: 'total_max')
  final double? totalMax;

  Budget({
    this.level,
    this.currency,
    this.dailyMax,
    this.totalMax,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}

@JsonSerializable()
class ItineraryDay {
  @JsonKey(name: 'day_index')
  final int? dayIndex;
  final String? date;
  final String? theme;
  final String? status;
  final List<Activity>? activities;
  @JsonKey(name: 'total_cost')
  final double? totalCost;
  @JsonKey(name: 'total_duration_minutes')
  final int? totalDurationMinutes;
  @JsonKey(name: 'travel_distance_km')
  final double? travelDistanceKm;
  @JsonKey(name: 'weather_forecast')
  final WeatherForecast? weatherForecast;
  @JsonKey(name: 'special_considerations')
  final String? specialConsiderations;
  @JsonKey(name: 'user_feedback')
  final String? userFeedback;
  @JsonKey(name: 'revision_count')
  final int? revisionCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'confirmed_at')
  final String? confirmedAt;

  ItineraryDay({
    this.dayIndex,
    this.date,
    this.theme,
    this.status,
    this.activities,
    this.totalCost,
    this.totalDurationMinutes,
    this.travelDistanceKm,
    this.weatherForecast,
    this.specialConsiderations,
    this.userFeedback,
    this.revisionCount,
    this.createdAt,
    this.confirmedAt,
  });

  factory ItineraryDay.fromJson(Map<String, dynamic> json) =>
      _$ItineraryDayFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryDayToJson(this);
}

@JsonSerializable()
class Activity {
  final String? id;
  final String? name;
  final String? type;
  final String? description;
  final Location? location;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'duration_minutes')
  final int? durationMinutes;
  final double? cost;
  final String? currency;
  @JsonKey(name: 'booking_url')
  final String? bookingUrl;
  @JsonKey(name: 'booking_reference')
  final String? bookingReference;
  final double? rating;
  @JsonKey(name: 'review_count')
  final int? reviewCount;
  @JsonKey(name: 'opening_hours')
  final String? openingHours;
  @JsonKey(name: 'contact_info')
  final String? contactInfo;
  @JsonKey(name: 'travel_time_from_previous')
  final int? travelTimeFromPrevious;
  @JsonKey(name: 'travel_mode')
  final String? travelMode;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final String? source;

  Activity({
    this.id,
    this.name,
    this.type,
    this.description,
    this.location,
    this.startTime,
    this.endTime,
    this.durationMinutes,
    this.cost,
    this.currency,
    this.bookingUrl,
    this.bookingReference,
    this.rating,
    this.reviewCount,
    this.openingHours,
    this.contactInfo,
    this.travelTimeFromPrevious,
    this.travelMode,
    this.createdAt,
    this.source,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}

@JsonSerializable()
class Location {
  final String? name;
  final String? address;
  final double? latitude;
  final double? longitude;
  @JsonKey(name: 'place_id')
  final String? placeId;
  final String? country;
  final String? city;

  Location({
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.placeId,
    this.country,
    this.city,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class WeatherForecast {
  final WeatherLocation? location;
  @JsonKey(name: 'current_weather')
  final CurrentWeather? currentWeather;
  final WeatherUnits? units;

  WeatherForecast({
    this.location,
    this.currentWeather,
    this.units,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}

@JsonSerializable()
class WeatherLocation {
  final double? latitude;
  final double? longitude;
  final String? timezone;
  @JsonKey(name: 'timezone_offset')
  final int? timezoneOffset;

  WeatherLocation({
    this.latitude,
    this.longitude,
    this.timezone,
    this.timezoneOffset,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationToJson(this);
}

@JsonSerializable()
class CurrentWeather {
  final int? dt;
  final String? timestamp;
  final String? sunrise;
  final String? sunset;
  final double? temperature;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  @JsonKey(name: 'dew_point')
  final double? dewPoint;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_deg')
  final int? windDeg;
  @JsonKey(name: 'wind_gust')
  final int? windGust;
  final List<WeatherCondition>? weather;

  CurrentWeather({
    this.dt,
    this.timestamp,
    this.sunrise,
    this.sunset,
    this.temperature,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class WeatherCondition {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherCondition({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}

@JsonSerializable()
class WeatherUnits {
  final String? temperature;
  @JsonKey(name: 'wind_speed')
  final String? windSpeed;
  final String? pressure;
  final String? visibility;

  WeatherUnits({
    this.temperature,
    this.windSpeed,
    this.pressure,
    this.visibility,
  });

  factory WeatherUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherUnitsToJson(this);
}

@JsonSerializable()
class ExtractedPreferences {
  final String? destination;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'duration_days')
  final int? durationDays;
  @JsonKey(name: 'food_preferences')
  final List<String>? foodPreferences;
  final List<String>? activities;
  final int? travelers;
  @JsonKey(name: 'budget_level')
  final String? budgetLevel;

  ExtractedPreferences({
    this.destination,
    this.startDate,
    this.endDate,
    this.durationDays,
    this.foodPreferences,
    this.activities,
    this.travelers,
    this.budgetLevel,
  });

  factory ExtractedPreferences.fromJson(Map<String, dynamic> json) =>
      _$ExtractedPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtractedPreferencesToJson(this);
} 