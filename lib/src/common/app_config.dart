class AppConfig {
  // API Configuration
  static const bool useMockApi = true; // Set to false when real API is ready
  static const bool enableApiLogging = true;
  
  // Mock API Configuration
  static const Duration mockApiDelay = Duration(milliseconds: 500);
  static const double mockErrorRate = 0.1; // 10% error rate for testing
  
  // Chat Configuration
  static const int maxChatHistoryLength = 100;
  static const Duration chatTimeout = Duration(seconds: 30);
  
  // Debug Configuration
  static const bool enableDebugMode = true;
  static const bool showNetworkLogs = true;
} 