import 'package:flutter/material.dart';

class ScreenSizes {
  static double get width => MediaQuery.of(navigatorKey.currentContext!).size.width;
  static double get height => MediaQuery.of(navigatorKey.currentContext!).size.height;
  
  // Breakpoints
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  
  // Global navigator key
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  // Responsive helpers
  static bool get isMobile => width < mobile;
  static bool get isTablet => width >= mobile && width < tablet;
  static bool get isDesktop => width >= desktop;
} 