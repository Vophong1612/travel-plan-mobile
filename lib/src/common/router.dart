import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_plan_mobile/src/presentation/chat/chat_screen.dart';
import 'package:travel_plan_mobile/src/presentation/home/home_page.dart';
import 'package:travel_plan_mobile/src/presentation/debug/debug_screen.dart';
import 'package:travel_plan_mobile/src/presentation/trip/details/trip_detail_screen.dart';

// Route constants
class AppRoutes {
  static const String home = '/';
  static const String chat = '/chat';
  static const String debug = '/debug';
  static const String tripDetail = '/trip-detail';
}

// Route names for easier navigation
class RouteNames {
  static const String home = 'home';
  static const String chat = 'chat';
  static const String debug = 'debug';
}

// Navigation helpers
abstract class AppRouter {
  static void pushToHome(BuildContext context) => context.go(AppRoutes.home);
  static void pushToChat(BuildContext context) => context.push(AppRoutes.chat);
  static void pushToDebug(BuildContext context) => context.push(AppRoutes.debug);
  static void pushToTripDetail(BuildContext context, String tripId) =>
      context.push('${AppRoutes.tripDetail}/$tripId');
}

// Error page widget
class ErrorPage extends StatelessWidget {
  final String error;
  
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Theme.of(context).colorScheme.error,
        foregroundColor: Theme.of(context).colorScheme.onError,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Page Not Found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.home),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Main router configuration
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: true,
  routes: [
    // Home route
    GoRoute(
      path: AppRoutes.home,
      name: RouteNames.home,
      builder: (context, state) => const HomePage(),
    ),
    
    // Chat route
    GoRoute(
      path: AppRoutes.chat,
      name: RouteNames.chat,
      builder: (context, state) => const ChatScreen(),
    ),
    
    // Debug route
    GoRoute(
      path: AppRoutes.debug,
      name: RouteNames.debug,
      builder: (context, state) => const DebugScreen(),
    ),
    GoRoute(
      path: '/trip-detail/:tripId',
      builder: (context, state) {
        final tripId = state.pathParameters['tripId']!;
        return TripDetailScreen(tripId: tripId);
      },
    ),
  ],
  
  // Error handling
  errorBuilder: (context, state) => ErrorPage(
    error: 'The page "${state.uri.path}" was not found.',
  ),
  
  // Redirect logic (can be used for authentication)
  redirect: (context, state) {
    // Add authentication logic here if needed
    // Example: if user is not authenticated and trying to access protected routes
    // return AppRoutes.login;
    return null; // No redirect needed
  },
); 