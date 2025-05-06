import 'package:flutter/material.dart';
import 'package:finance_manager/app/layout/base_layout.dart';
import 'package:finance_manager/app/routes.dart';

import '../../../core/constants.dart';
import '../../../widgets/custom_bottom_menu.dart';
import '../widgets/gyroscope_display.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      header: AppBar(
        title: const Text('Home'),
      ),
      content: const Center(
        child: GyroscopeDisplay(),
      ),
      footer: const CustomBottomMenu(selectedIndex: NavigationConstants.HOME_INDEX, onMenuItemSelected: null), // onMenuItemSelected không cần thiết nữa
      currentRoute: AppRoutes.home,
    );
  }
}