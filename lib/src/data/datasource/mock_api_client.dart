import 'dart:async';
import 'dart:math';
import '../model/chat_history_response.dart';
import '../model/send_message_request.dart';
import '../model/send_message_response.dart';

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
    
    return SendMessageResponse(response: botResponse);
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