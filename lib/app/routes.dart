import 'package:flutter/material.dart';
import 'package:finance_manager/modules/home/screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String addTransaction = '/add-transaction';
  static const String transactionDetail = '/transaction-detail';
  // Định nghĩa các route khác

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    //addTransaction: (context) => const AddTransactionScreen(),
    //transactionDetail: (context) => const TransactionDetailScreen(),
    // Thêm các route khác của bạn ở đây
  };
}