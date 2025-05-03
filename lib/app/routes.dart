import 'package:flutter/material.dart';
import 'package:finance_manager/modules/home/screens/home_screen.dart';

import '../core/constants.dart';
import '../modules/history/screens/history_screen.dart';
import '../modules/profile/screens/profile_screen.dart';
import '../modules/transactions/screens/transaction_screen.dart';

class AppRoutes {
  static const String home = NavigationConstants.HOME_ROUTE;
  static const String profile = NavigationConstants.PROFILE_ROUTE;
  static const String history = NavigationConstants.HISTORY_ROUTE;
  static const String transaction = NavigationConstants.TRANSACTION_ROUTE;
  // Định nghĩa các route khác

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    profile: (context) => const ProfileScreen(),
    transaction: (context) => const TransactionScreen(),
    history: (context) => const HistoryScreen(),
    // Thêm các route khác của bạn ở đây
  };
}