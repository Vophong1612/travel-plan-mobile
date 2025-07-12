import 'package:flutter/material.dart';
import 'package:travel_plan_mobile/src/common/app_config.dart';
import 'package:travel_plan_mobile/src/common/colors.dart' show AppColors;
import 'package:travel_plan_mobile/src/common/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Plan'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.secondary,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.flight,
                size: 64,
                color: AppColors.primary,
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to Travel Plan!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your journey starts here',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              // Navigation buttons
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => AppRouter.pushToChat(context),
                    icon: const Icon(Icons.chat),
                    label: const Text('Chat'),
                  ),
                  if (AppConfig.useMockApi)
                    ElevatedButton.icon(
                      onPressed: () => AppRouter.pushToDebug(context),
                      icon: const Icon(Icons.bug_report),
                      label: const Text('Debug'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                    ),
                  ElevatedButton.icon(
                    onPressed: () => AppRouter.pushToTripDetail(
                        context, 'trip_demo_user_1703123456789'),
                    icon: const Icon(Icons.card_travel),
                    label: const Text('Trip Detail'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 