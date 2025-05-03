import 'package:flutter/material.dart';
import 'package:finance_manager/app/layout/base_layout.dart';
import 'package:finance_manager/app/routes.dart';

import '../../../core/constants.dart';
import '../../../widgets/custom_bottom_menu.dart'; // Import your routes

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      header: AppBar(
        title: const Text('History'),
      ),
      content: const Center(
        child: Text('History Content'),
      ),
      footer: const CustomBottomMenu(selectedIndex: NavigationConstants.HISTORY_INDEX, onMenuItemSelected: null), // onMenuItemSelected không cần thiết nữa
      currentRoute: AppRoutes.profile,
    );
  }
}