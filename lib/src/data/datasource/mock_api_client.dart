import 'dart:async';
import 'dart:math';
import '../model/chat_history_response.dart';
import '../model/send_message_request.dart';
import '../model/send_message_response.dart';
import '../model/trip_detail_response.dart';
import '../model/trip_model.dart';
import '../model/itinerary_model.dart';
import '../model/activity_model.dart';
import '../model/location_model.dart';
import '../model/planning_status_model.dart';

class MockApiClient {
  static const Duration _responseDelay = Duration(milliseconds: 500);
  
  // Mock chat history data
  static final List<ChatMessage> _mockChatHistory = [
    ChatMessage(
      role: "user",
      timestamp: "2025-01-15T10:00:00Z",
      message: "Hello! Can you help me plan a trip to Japan?",
    ),
    ChatMessage(
      role: "model",
      timestamp: "2025-01-15T10:00:15Z",
      message: "Hello! I'd be happy to help you plan your trip to Japan. What kind of experience are you looking for? Are you interested in cultural sites, modern cities, nature, or a mix of everything?",
    ),
    ChatMessage(
      role: "user",
      timestamp: "2025-01-15T10:01:00Z",
      message: "I'm interested in both cultural sites and modern cities. I have about 10 days.",
    ),
    ChatMessage(
      role: "model",
      timestamp: "2025-01-15T10:01:30Z",
      message: "Perfect! For a 10-day trip combining culture and modern cities, I'd recommend:\n\n**Tokyo (4-5 days):**\n- Modern districts: Shibuya, Harajuku, Shinjuku\n- Cultural sites: Senso-ji Temple, Meiji Shrine\n- Day trip to Nikko for UNESCO World Heritage sites\n\n**Kyoto (3-4 days):**\n- Fushimi Inari Shrine\n- Kinkaku-ji (Golden Pavilion)\n- Arashiyama Bamboo Grove\n- Gion district for traditional culture\n\n**Osaka (2-3 days):**\n- Osaka Castle\n- Dotonbori district\n- Amazing street food scene\n\nWould you like me to elaborate on any of these destinations?",
    ),
  ];

  Future<ChatHistoryResponse> getChatHistory() async {
    // Simulate network delay
    await Future.delayed(_responseDelay);
    
    // Simulate occasional network error (10% chance)
    if (Random().nextInt(10) == 0) {
      throw Exception('Mock network error: Unable to fetch chat history');
    }
    
    return ChatHistoryResponse(chatHistory: List.from(_mockChatHistory));
  }

  Future<SendMessageResponse> sendMessage(SendMessageRequest request) async {
    // Simulate network delay
    await Future.delayed(_responseDelay);
    
    // Simulate occasional network error (5% chance)
    if (Random().nextInt(20) == 0) {
      throw Exception('Mock network error: Unable to send message');
    }
    
    // Add user message to mock history
    final userMessage = ChatMessage(
      role: "user",
      timestamp: DateTime.now().toIso8601String(),
      message: request.message,
    );
    _mockChatHistory.add(userMessage);
    
    // Generate a mock bot response
    final botResponse = _generateMockResponse(request.message);
    final botMessage = ChatMessage(
      role: "model",
      timestamp: DateTime.now().add(const Duration(seconds: 1)).toIso8601String(),
      message: botResponse,
    );
    _mockChatHistory.add(botMessage);
    
    return SendMessageResponse(
      success: true,
      message: botResponse,
      tripId: 'trip_1_1752324532',
      extractedInfo: ExtractedInfo(destination: 'Paris', startDate: '2023-11-26', endDate: '2023-11-29', durationDays: 3, foodPreferences: [], activities: [], travelers: 1, budgetLevel: null),
      tripDetails: TripDetails(userId: '1', destination: 'Paris', startDate: '2023-11-26', endDate: '2023-11-29', durationDays: 3, userProfile: UserProfile(userId: '1', preferences: Preferences(travelStyle: ['cultural'], pace: 'moderate', interests: [], dietaryRestrictions: null, accommodationPreferences: null, transportPreferences: null, activityPreferences: null), travelerInfo: TravelerInfo(groupSize: 1, travelsWith: [], ages: [], accessibilityNeeds: null), budget: Budget(level: 'mid-range', currency: 'USD', dailyMax: 100.0, totalMax: 1000.0)), itinerary: [], extractedPreferences: ExtractedPreferences(destination: 'Paris', startDate: '2023-11-26', endDate: '2023-11-29', durationDays: 3, foodPreferences: [], activities: [], travelers: 1, budgetLevel: null), status: 'planning_in_progress', createdAt: '2025-07-12T12:48:52.069446', tripId: 'trip_1_1752324532'),
      timestamp: DateTime.now().toIso8601String(),
    );
  }

  Future<TripDetailResponse> getTripDetails(String tripId) async {
    // Simulate network delay
    await Future.delayed(_responseDelay);
    
    // Simulate occasional network error (5% chance)
    if (Random().nextInt(20) == 0) {
      throw Exception('Mock network error: Unable to fetch trip details');
    }
    
    // Return mock trip data
    return TripDetailResponse(
      success: true,
      data: TripDetailDataResponse(
        trip: _createMockTrip(tripId),
        planningStatus: _createMockPlanningStatus(tripId),
      ),
      error: null,
      timestamp: DateTime.now().toIso8601String(),
    );
  }

  TripModel _createMockTrip(String tripId) {
    return TripModel(
      tripId: tripId,
      userId: 'demo_user',
      destination: 'Paris, France',
      startDate: '2025-07-11',
      endDate: '2025-07-17',
      durationDays: 6,
      title: 'Romantic Paris Getaway',
      description: 'A romantic trip to Paris with cultural activities and fine dining. This trip promises an unforgettable experience filled with iconic landmarks, delicious cuisine, and charming Parisian streets.',
      status: 'planning_in_progress',
      itinerary: _createMockItinerary(),
      estimatedTotalCost: 597.40,
      actualTotalCost: null,
      budgetCurrency: 'EUR',
      createdAt: '2024-01-15T08:00:00Z',
      updatedAt: '2024-01-15T08:30:00Z',
      confirmedAt: null,
    );
  }

  List<ItineraryModel> _createMockItinerary() {
    return [
      ItineraryModel(
        dayIndex: 1,
        date: '2025-07-11',
        theme: 'Arrival and Iconic Sights',
        status: 'confirmed',
        activities: [
          ActivityModel(
            id: 'act_1_1',
            name: 'Eiffel Tower Visit',
            type: 'sightseeing',
            description: 'Iconic landmark offering panoramic views.',
            location: LocationModel(
              name: 'Eiffel Tower',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-11T09:00:00Z',
            endTime: '2025-07-11T11:00:00Z',
            durationMinutes: null,
            cost: 29.40,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_1_2',
            name: 'Louvre Museum Tour',
            type: 'cultural',
            description: 'Explore world-famous art, including the Mona Lisa.',
            location: LocationModel(
              name: 'Louvre Museum',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-11T14:00:00Z',
            endTime: '2025-07-11T17:00:00Z',
            durationMinutes: null,
            cost: 22.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_1_3',
            name: 'Dinner at Le Jules Verne',
            type: 'dining',
            description: 'Fine dining experience with stunning city views.',
            location: LocationModel(
              name: 'Le Jules Verne',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-11T19:30:00Z',
            endTime: '2025-07-11T21:30:00Z',
            durationMinutes: null,
            cost: 250.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
        ],
        totalCost: 301.40,
        totalDurationMinutes: 480,
        travelDistanceKm: 15.2,
        createdAt: '2025-07-11T08:00:00Z',
        confirmedAt: '2025-07-11T10:00:00Z',
        revisionCount: 0,
      ),
      ItineraryModel(
        dayIndex: 2,
        date: '2025-07-12',
        theme: 'Art and Gardens',
        status: 'planning_in_progress',
        activities: [
          ActivityModel(
            id: 'act_2_1',
            name: 'Musée d\'Orsay',
            type: 'cultural',
            description: 'Impressionist masterpieces in a former railway station.',
            location: LocationModel(
              name: 'Musée d\'Orsay',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-12T10:00:00Z',
            endTime: '2025-07-12T13:00:00Z',
            durationMinutes: null,
            cost: 16.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_2_2',
            name: 'Luxembourg Gardens Stroll',
            type: 'outdoor',
            description: 'Relaxing walk through beautiful gardens.',
            location: LocationModel(
              name: 'Luxembourg Gardens',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-12T14:30:00Z',
            endTime: '2025-07-12T16:00:00Z',
            durationMinutes: null,
            cost: 0.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_2_3',
            name: 'Latin Quarter Exploration',
            type: 'sightseeing',
            description: 'Wander through historic streets and bookshops.',
            location: LocationModel(
              name: 'Latin Quarter',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-12T16:30:00Z',
            endTime: '2025-07-12T18:00:00Z',
            durationMinutes: null,
            cost: 0.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
        ],
        totalCost: 16.00,
        totalDurationMinutes: 270,
        travelDistanceKm: 5.0,
        createdAt: '2025-07-11T08:00:00Z',
        confirmedAt: null,
        revisionCount: 0,
      ),
      ItineraryModel(
        dayIndex: 3,
        date: '2025-07-13',
        theme: 'Palaces and Grandeur',
        status: 'planning_in_progress',
        activities: [
          ActivityModel(
            id: 'act_3_1',
            name: 'Palace of Versailles Tour',
            type: 'cultural',
            description: 'Explore the opulent palace and its magnificent gardens.',
            location: LocationModel(
              name: 'Palace of Versailles',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-13T09:00:00Z',
            endTime: '2025-07-13T14:00:00Z',
            durationMinutes: null,
            cost: 27.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_3_2',
            name: 'Lunch near Versailles',
            type: 'dining',
            description: 'Enjoy a traditional French meal.',
            location: LocationModel(
              name: 'Local Bistro',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-13T14:00:00Z',
            endTime: '2025-07-13T15:30:00Z',
            durationMinutes: null,
            cost: 30.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_3_3',
            name: 'Pont Alexandre III',
            type: 'sightseeing',
            description: 'Admire the ornate bridge and its sculptures.',
            location: LocationModel(
              name: 'Pont Alexandre III',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-13T17:00:00Z',
            endTime: '2025-07-13T18:00:00Z',
            durationMinutes: null,
            cost: 0.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
        ],
        totalCost: 57.00,
        totalDurationMinutes: 360,
        travelDistanceKm: 30.0,
        createdAt: '2025-07-11T08:00:00Z',
        confirmedAt: null,
        revisionCount: 0,
      ),
      ItineraryModel(
        dayIndex: 4,
        date: '2025-07-14',
        theme: 'Montmartre and Bohemian Charm',
        status: 'planning_in_progress',
        activities: [
          ActivityModel(
            id: 'act_4_1',
            name: 'Sacré-Cœur Basilica',
            type: 'sightseeing',
            description: 'Visit the stunning basilica with panoramic city views.',
            location: LocationModel(
              name: 'Sacré-Cœur Basilica',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-14T10:00:00Z',
            endTime: '2025-07-14T12:00:00Z',
            durationMinutes: null,
            cost: 0.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_4_2',
            name: 'Explore Montmartre',
            type: 'sightseeing',
            description: 'Wander through the artistic streets of Montmartre.',
            location: LocationModel(
              name: 'Montmartre',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-14T12:00:00Z',
            endTime: '2025-07-14T14:00:00Z',
            durationMinutes: null,
            cost: 0.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_4_3',
            name: 'Moulin Rouge Show',
            type: 'entertainment',
            description: 'Experience a classic Parisian cabaret show.',
            location: LocationModel(
              name: 'Moulin Rouge',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-14T21:00:00Z',
            endTime: '2025-07-14T23:00:00Z',
            durationMinutes: null,
            cost: 120.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
        ],
        totalCost: 120.00,
        totalDurationMinutes: 300,
        travelDistanceKm: 8.0,
        createdAt: '2025-07-11T08:00:00Z',
        confirmedAt: null,
        revisionCount: 0,
      ),
      ItineraryModel(
        dayIndex: 5,
        date: '2025-07-15',
        theme: 'Shopping and Seine Cruise',
        status: 'planning_in_progress',
        activities: [
          ActivityModel(
            id: 'act_5_1',
            name: 'Champs-Élysées Shopping',
            type: 'shopping',
            description: 'Stroll and shop along the famous avenue.',
            location: LocationModel(
              name: 'Champs-Élysées',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-15T10:00:00Z',
            endTime: '2025-07-15T13:00:00Z',
            durationMinutes: null,
            cost: 0.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_5_2',
            name: 'Arc de Triomphe',
            type: 'sightseeing',
            description: 'Visit the iconic monument and enjoy views.',
            location: LocationModel(
              name: 'Arc de Triomphe',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-15T13:00:00Z',
            endTime: '2025-07-15T14:30:00Z',
            durationMinutes: null,
            cost: 13.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_5_3',
            name: 'Seine River Cruise',
            type: 'entertainment',
            description: 'Enjoy a scenic cruise along the Seine River.',
            location: LocationModel(
              name: 'Seine River',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-15T17:00:00Z',
            endTime: '2025-07-15T18:00:00Z',
            durationMinutes: null,
            cost: 15.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
        ],
        totalCost: 28.00,
        totalDurationMinutes: 300,
        travelDistanceKm: 10.0,
        createdAt: '2025-07-11T08:00:00Z',
        confirmedAt: null,
        revisionCount: 0,
      ),
      ItineraryModel(
        dayIndex: 6,
        date: '2025-07-16',
        theme: 'Departure Day',
        status: 'planning_completed',
        activities: [
          ActivityModel(
            id: 'act_6_1',
            name: 'Breakfast at Local Cafe',
            type: 'dining',
            description: 'Enjoy a final Parisian breakfast.',
            location: LocationModel(
              name: 'Local Cafe',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-16T08:00:00Z',
            endTime: '2025-07-16T09:00:00Z',
            durationMinutes: null,
            cost: 15.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
          ActivityModel(
            id: 'act_6_2',
            name: 'Transfer to Airport',
            type: 'transport',
            description: 'Travel to Charles de Gaulle Airport.',
            location: LocationModel(
              name: 'Paris Charles de Gaulle Airport',
              address: null,
              latitude: null,
              longitude: null,
              placeId: null,
              country: null,
              city: null,
            ),
            startTime: '2025-07-16T09:30:00Z',
            endTime: '2025-07-16T11:00:00Z',
            durationMinutes: null,
            cost: 60.00,
            currency: 'EUR',
            bookingUrl: null,
            bookingReference: null,
            rating: null,
            reviewCount: null,
            travelTimeFromPrevious: null,
            travelMode: null,
            createdAt: '2025-07-11T08:00:00Z',
            source: null,
          ),
        ],
        totalCost: 75.00,
        totalDurationMinutes: 180,
        travelDistanceKm: 25.0,
        createdAt: '2025-07-11T08:00:00Z',
        confirmedAt: null,
        revisionCount: 0,
      ),
    ];
  }

  PlanningStatusModel _createMockPlanningStatus(String tripId) {
    return PlanningStatusModel(
      tripId: tripId,
      state: 'planning',
      currentDay: 2,
      totalDays: 6,
      progress: 33.3,
      createdAt: '2024-01-15T08:00:00Z',
      updatedAt: '2024-01-15T08:30:00Z',
    );
  }

  String _generateMockResponse(String userMessage) {
    final random = Random();
    
    // Simple keyword-based responses
    final lowerMessage = userMessage.toLowerCase();
    
    if (lowerMessage.contains('hello') || lowerMessage.contains('hi')) {
      return "Hello! How can I help you plan your next adventure today?";
    }
    
    if (lowerMessage.contains('travel') || lowerMessage.contains('trip')) {
      return "I'd love to help you plan your trip! Where are you thinking of going? What kind of experience are you looking for - adventure, relaxation, culture, or something else?";
    }
    
    if (lowerMessage.contains('japan')) {
      return "Japan is an amazing destination! Are you interested in the bustling cities like Tokyo and Osaka, the cultural heritage of Kyoto, or perhaps the natural beauty of places like Mount Fuji and the Japanese Alps?";
    }
    
    if (lowerMessage.contains('food') || lowerMessage.contains('eat')) {
      return "Great question about food! Each destination has its own culinary specialties. Are you looking for street food, fine dining, local markets, or cooking experiences? I can recommend the best food spots based on your preferences!";
    }
    
    if (lowerMessage.contains('budget') || lowerMessage.contains('cost')) {
      return "Budget planning is important! I can help you find options for different budget ranges - from budget-friendly hostels and local eateries to luxury accommodations and fine dining. What's your approximate budget range?";
    }
    
    if (lowerMessage.contains('hotel') || lowerMessage.contains('accommodation')) {
      return "I can help you find the perfect accommodation! Are you looking for hotels, hostels, vacation rentals, or something unique like a traditional ryokan in Japan or a boutique hotel? What's your preferred location and budget?";
    }
    
    if (lowerMessage.contains('weather') || lowerMessage.contains('climate')) {
      return "Weather is definitely important for trip planning! When are you planning to travel? Different seasons offer different experiences - spring for cherry blossoms, summer for festivals, autumn for foliage, and winter for snow activities.";
    }
    
    // Default responses for other messages
    final defaultResponses = [
      "That's interesting! Tell me more about what you're looking for, and I'll provide personalized recommendations.",
      "I can help you with that! Could you share more details about your preferences, budget, or timeline?",
      "Great question! Based on your interests, I can suggest several options. What aspects are most important to you?",
      "I'd be happy to help you plan that! What's your ideal timeframe and what kind of experience are you hoping for?",
      "That sounds like a wonderful idea! Let me know more about your preferences and I'll create some tailored suggestions for you.",
    ];
    
    return defaultResponses[random.nextInt(defaultResponses.length)];
  }
  
  // Method to clear mock chat history (useful for testing)
  void clearChatHistory() {
    _mockChatHistory.clear();
  }
  
  // Method to reset to initial mock data
  void resetToInitialData() {
    _mockChatHistory.clear();
    _mockChatHistory.addAll([
      ChatMessage(
        role: "user",
        timestamp: "2025-01-15T10:00:00Z",
        message: "Hello! Can you help me plan a trip to Japan?",
      ),
      ChatMessage(
        role: "model",
        timestamp: "2025-01-15T10:00:15Z",
        message: "Hello! I'd be happy to help you plan your trip to Japan. What kind of experience are you looking for? Are you interested in cultural sites, modern cities, nature, or a mix of everything?",
      ),
      ChatMessage(
        role: "user",
        timestamp: "2025-01-15T10:01:00Z",
        message: "I'm interested in both cultural sites and modern cities. I have about 10 days.",
      ),
      ChatMessage(
        role: "model",
        timestamp: "2025-01-15T10:01:30Z",
        message: "Perfect! For a 10-day trip combining culture and modern cities, I'd recommend:\n\n**Tokyo (4-5 days):**\n- Modern districts: Shibuya, Harajuku, Shinjuku\n- Cultural sites: Senso-ji Temple, Meiji Shrine\n- Day trip to Nikko for UNESCO World Heritage sites\n\n**Kyoto (3-4 days):**\n- Fushimi Inari Shrine\n- Kinkaku-ji (Golden Pavilion)\n- Arashiyama Bamboo Grove\n- Gion district for traditional culture\n\n**Osaka (2-3 days):**\n- Osaka Castle\n- Dotonbori district\n- Amazing street food scene\n\nWould you like me to elaborate on any of these destinations?",
      ),
    ]);
  }
} 