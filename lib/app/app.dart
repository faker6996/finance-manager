import 'package:flutter/material.dart';
import 'package:finance_manager/app/routes.dart'; // Import quản lý routes (nếu có)
import 'package:finance_manager/app/theme.dart'; // Import theme (nếu có)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Manager',
      theme: AppTheme.lightTheme, // Sử dụng theme (nếu có)
      // initialRoute: AppRoutes.home, // Sử dụng routes (nếu có)
      //home: const HomeScreen(), // Gọi trực tiếp màn hình Home
      routes: AppRoutes.routes, // Định nghĩa routes (nếu có)
    );
  }
}