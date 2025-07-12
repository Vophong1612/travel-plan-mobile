import 'package:flutter/material.dart';
import '../../common/app_config.dart';
import '../../common/colors.dart';
import '../../data/datasource/mock_api_client.dart';
import '../../../injection.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Settings'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'API Configuration',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // API Status Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          AppConfig.useMockApi ? Icons.bug_report : Icons.cloud,
                          color: AppConfig.useMockApi ? Colors.orange : Colors.green,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          AppConfig.useMockApi ? 'Mock API (Active)' : 'Real API (Active)',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppConfig.useMockApi 
                          ? 'Using mock responses for testing. No real server connection.'
                          : 'Connected to real API server.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Mock API Controls (only show if using mock)
            if (AppConfig.useMockApi) ...[
              const Text(
                'Mock API Controls',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              
              ElevatedButton.icon(
                onPressed: () {
                  if (di.isRegistered<MockApiClient>()) {
                    di<MockApiClient>().clearChatHistory();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Chat history cleared')),
                    );
                  }
                },
                icon: const Icon(Icons.clear_all),
                label: const Text('Clear Chat History'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
              
              const SizedBox(height: 8),
              
              ElevatedButton.icon(
                onPressed: () {
                  if (di.isRegistered<MockApiClient>()) {
                    di<MockApiClient>().resetToInitialData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reset to initial mock data')),
                    );
                  }
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reset to Initial Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
            
            const SizedBox(height: 24),
            
            // Configuration Details
            const Text(
              'Configuration Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildConfigItem('Mock API Enabled', AppConfig.useMockApi.toString()),
                    _buildConfigItem('API Logging', AppConfig.enableApiLogging.toString()),
                    _buildConfigItem('Debug Mode', AppConfig.enableDebugMode.toString()),
                    _buildConfigItem('Mock Delay', '${AppConfig.mockApiDelay.inMilliseconds}ms'),
                    _buildConfigItem('Mock Error Rate', '${(AppConfig.mockErrorRate * 100).toInt()}%'),
                  ],
                ),
              ),
            ),
            
            const Spacer(),
            
            // Instructions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Instructions:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• To switch to real API, change AppConfig.useMockApi to false in app_config.dart',
                    style: TextStyle(fontSize: 12),
                  ),
                  const Text(
                    '• Mock API provides realistic responses for testing',
                    style: TextStyle(fontSize: 12),
                  ),
                  const Text(
                    '• Use the controls above to manage mock data',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
} 