import 'package:flutter/material.dart';
import 'injection.dart';
import 'src/common/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const TravelPlanApp());
}

class TravelPlanApp extends StatelessWidget {
  const TravelPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Travel Plan',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF000000),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFFFFF),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.light,
      routerConfig: appRouter,
    );
  }
}


