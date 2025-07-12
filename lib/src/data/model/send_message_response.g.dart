// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) =>
    SendMessageResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      tripId: json['trip_id'] as String?,
      extractedInfo: json['extracted_info'] == null
          ? null
          : ExtractedInfo.fromJson(
              json['extracted_info'] as Map<String, dynamic>,
            ),
      tripDetails: json['trip_details'] == null
          ? null
          : TripDetails.fromJson(json['trip_details'] as Map<String, dynamic>),
      error: json['error'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$SendMessageResponseToJson(
  SendMessageResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'trip_id': instance.tripId,
  'extracted_info': instance.extractedInfo,
  'trip_details': instance.tripDetails,
  'error': instance.error,
  'timestamp': instance.timestamp,
};

ExtractedInfo _$ExtractedInfoFromJson(Map<String, dynamic> json) =>
    ExtractedInfo(
      destination: json['destination'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      durationDays: (json['duration_days'] as num?)?.toInt(),
      foodPreferences: (json['food_preferences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      travelers: (json['travelers'] as num?)?.toInt(),
      budgetLevel: json['budget_level'] as String?,
    );

Map<String, dynamic> _$ExtractedInfoToJson(ExtractedInfo instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'duration_days': instance.durationDays,
      'food_preferences': instance.foodPreferences,
      'activities': instance.activities,
      'travelers': instance.travelers,
      'budget_level': instance.budgetLevel,
    };

TripDetails _$TripDetailsFromJson(Map<String, dynamic> json) => TripDetails(
  userId: json['user_id'] as String?,
  destination: json['destination'] as String?,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  durationDays: (json['duration_days'] as num?)?.toInt(),
  userProfile: json['user_profile'] == null
      ? null
      : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
  itinerary: (json['itinerary'] as List<dynamic>?)
      ?.map((e) => ItineraryDay.fromJson(e as Map<String, dynamic>))
      .toList(),
  extractedPreferences: json['extracted_preferences'] == null
      ? null
      : ExtractedPreferences.fromJson(
          json['extracted_preferences'] as Map<String, dynamic>,
        ),
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  tripId: json['trip_id'] as String?,
);

Map<String, dynamic> _$TripDetailsToJson(TripDetails instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'destination': instance.destination,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'duration_days': instance.durationDays,
      'user_profile': instance.userProfile,
      'itinerary': instance.itinerary,
      'extracted_preferences': instance.extractedPreferences,
      'status': instance.status,
      'created_at': instance.createdAt,
      'trip_id': instance.tripId,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
  userId: json['user_id'] as String?,
  preferences: json['preferences'] == null
      ? null
      : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
  travelerInfo: json['traveler_info'] == null
      ? null
      : TravelerInfo.fromJson(json['traveler_info'] as Map<String, dynamic>),
  budget: json['budget'] == null
      ? null
      : Budget.fromJson(json['budget'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'preferences': instance.preferences,
      'traveler_info': instance.travelerInfo,
      'budget': instance.budget,
    };

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
  travelStyle: (json['travel_style'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  pace: json['pace'] as String?,
  interests: (json['interests'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  dietaryRestrictions: json['dietary_restrictions'] as String?,
  accommodationPreferences: json['accommodation_preferences'] as String?,
  transportPreferences: json['transport_preferences'] as String?,
  activityPreferences: json['activity_preferences'] as String?,
);

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'travel_style': instance.travelStyle,
      'pace': instance.pace,
      'interests': instance.interests,
      'dietary_restrictions': instance.dietaryRestrictions,
      'accommodation_preferences': instance.accommodationPreferences,
      'transport_preferences': instance.transportPreferences,
      'activity_preferences': instance.activityPreferences,
    };

TravelerInfo _$TravelerInfoFromJson(Map<String, dynamic> json) => TravelerInfo(
  groupSize: (json['group_size'] as num?)?.toInt(),
  travelsWith: (json['travels_with'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ages: (json['ages'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  accessibilityNeeds: json['accessibility_needs'] as String?,
);

Map<String, dynamic> _$TravelerInfoToJson(TravelerInfo instance) =>
    <String, dynamic>{
      'group_size': instance.groupSize,
      'travels_with': instance.travelsWith,
      'ages': instance.ages,
      'accessibility_needs': instance.accessibilityNeeds,
    };

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
  level: json['level'] as String?,
  currency: json['currency'] as String?,
  dailyMax: (json['daily_max'] as num?)?.toDouble(),
  totalMax: (json['total_max'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
  'level': instance.level,
  'currency': instance.currency,
  'daily_max': instance.dailyMax,
  'total_max': instance.totalMax,
};

ItineraryDay _$ItineraryDayFromJson(Map<String, dynamic> json) => ItineraryDay(
  dayIndex: (json['day_index'] as num?)?.toInt(),
  date: json['date'] as String?,
  theme: json['theme'] as String?,
  status: json['status'] as String?,
  activities: (json['activities'] as List<dynamic>?)
      ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCost: (json['total_cost'] as num?)?.toDouble(),
  totalDurationMinutes: (json['total_duration_minutes'] as num?)?.toInt(),
  travelDistanceKm: (json['travel_distance_km'] as num?)?.toDouble(),
  weatherForecast: json['weather_forecast'] == null
      ? null
      : WeatherForecast.fromJson(
          json['weather_forecast'] as Map<String, dynamic>,
        ),
  specialConsiderations: json['special_considerations'] as String?,
  userFeedback: json['user_feedback'] as String?,
  revisionCount: (json['revision_count'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  confirmedAt: json['confirmed_at'] as String?,
);

Map<String, dynamic> _$ItineraryDayToJson(ItineraryDay instance) =>
    <String, dynamic>{
      'day_index': instance.dayIndex,
      'date': instance.date,
      'theme': instance.theme,
      'status': instance.status,
      'activities': instance.activities,
      'total_cost': instance.totalCost,
      'total_duration_minutes': instance.totalDurationMinutes,
      'travel_distance_km': instance.travelDistanceKm,
      'weather_forecast': instance.weatherForecast,
      'special_considerations': instance.specialConsiderations,
      'user_feedback': instance.userFeedback,
      'revision_count': instance.revisionCount,
      'created_at': instance.createdAt,
      'confirmed_at': instance.confirmedAt,
    };

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
  id: json['id'] as String?,
  name: json['name'] as String?,
  type: json['type'] as String?,
  description: json['description'] as String?,
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
  durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
  cost: (json['cost'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  bookingUrl: json['booking_url'] as String?,
  bookingReference: json['booking_reference'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['review_count'] as num?)?.toInt(),
  openingHours: json['opening_hours'] as String?,
  contactInfo: json['contact_info'] as String?,
  travelTimeFromPrevious: (json['travel_time_from_previous'] as num?)?.toInt(),
  travelMode: json['travel_mode'] as String?,
  createdAt: json['created_at'] as String?,
  source: json['source'] as String?,
);

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'description': instance.description,
  'location': instance.location,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'duration_minutes': instance.durationMinutes,
  'cost': instance.cost,
  'currency': instance.currency,
  'booking_url': instance.bookingUrl,
  'booking_reference': instance.bookingReference,
  'rating': instance.rating,
  'review_count': instance.reviewCount,
  'opening_hours': instance.openingHours,
  'contact_info': instance.contactInfo,
  'travel_time_from_previous': instance.travelTimeFromPrevious,
  'travel_mode': instance.travelMode,
  'created_at': instance.createdAt,
  'source': instance.source,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  name: json['name'] as String?,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  placeId: json['place_id'] as String?,
  country: json['country'] as String?,
  city: json['city'] as String?,
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'place_id': instance.placeId,
  'country': instance.country,
  'city': instance.city,
};

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      location: json['location'] == null
          ? null
          : WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
      currentWeather: json['current_weather'] == null
          ? null
          : CurrentWeather.fromJson(
              json['current_weather'] as Map<String, dynamic>,
            ),
      units: json['units'] == null
          ? null
          : WeatherUnits.fromJson(json['units'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current_weather': instance.currentWeather,
      'units': instance.units,
    };

WeatherLocation _$WeatherLocationFromJson(Map<String, dynamic> json) =>
    WeatherLocation(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      timezoneOffset: (json['timezone_offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeatherLocationToJson(WeatherLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
    };

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      dt: (json['dt'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toInt(),
      dewPoint: (json['dew_point'] as num?)?.toDouble(),
      uvi: (json['uvi'] as num?)?.toDouble(),
      clouds: (json['clouds'] as num?)?.toInt(),
      visibility: (json['visibility'] as num?)?.toInt(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDeg: (json['wind_deg'] as num?)?.toInt(),
      windGust: (json['wind_gust'] as num?)?.toInt(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'timestamp': instance.timestamp,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temperature': instance.temperature,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather,
    };

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) =>
    WeatherCondition(
      id: (json['id'] as num?)?.toInt(),
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherConditionToJson(WeatherCondition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

WeatherUnits _$WeatherUnitsFromJson(Map<String, dynamic> json) => WeatherUnits(
  temperature: json['temperature'] as String?,
  windSpeed: json['wind_speed'] as String?,
  pressure: json['pressure'] as String?,
  visibility: json['visibility'] as String?,
);

Map<String, dynamic> _$WeatherUnitsToJson(WeatherUnits instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'wind_speed': instance.windSpeed,
      'pressure': instance.pressure,
      'visibility': instance.visibility,
    };

ExtractedPreferences _$ExtractedPreferencesFromJson(
  Map<String, dynamic> json,
) => ExtractedPreferences(
  destination: json['destination'] as String?,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  durationDays: (json['duration_days'] as num?)?.toInt(),
  foodPreferences: (json['food_preferences'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  activities: (json['activities'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  travelers: (json['travelers'] as num?)?.toInt(),
  budgetLevel: json['budget_level'] as String?,
);

Map<String, dynamic> _$ExtractedPreferencesToJson(
  ExtractedPreferences instance,
) => <String, dynamic>{
  'destination': instance.destination,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'duration_days': instance.durationDays,
  'food_preferences': instance.foodPreferences,
  'activities': instance.activities,
  'travelers': instance.travelers,
  'budget_level': instance.budgetLevel,
};
