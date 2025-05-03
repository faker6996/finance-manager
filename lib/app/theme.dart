import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.grey,
    // Các thuộc tính theme khác cho chế độ sáng
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    // ...
  );

  // Bạn cũng có thể định nghĩa darkTheme nếu cần
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.deepPurple,
    hintColor: Colors.grey[600],
    // Các thuộc tính theme khác cho chế độ tối
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    // ...
  );
}