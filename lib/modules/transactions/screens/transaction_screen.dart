import 'package:flutter/material.dart';
import 'package:finance_manager/app/layout/base_layout.dart';

import '../../../app/routes.dart';
import '../../../core/constants.dart';
import '../../../widgets/custom_bottom_menu.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      header: AppBar(
        title: const Text('Transaction'),
      ),
      content: const Center(
        child: Text('Transaction Content'),
      ),
      footer: const CustomBottomMenu(selectedIndex: NavigationConstants.TRANSACTION_INDEX, onMenuItemSelected: null), // onMenuItemSelected không cần thiết nữa
      currentRoute: AppRoutes.profile,
    );
  }
}