import 'package:flutter/material.dart';
import 'package:finance_manager/app/layout/base_layout.dart';
import 'package:finance_manager/app/routes.dart';

import '../../../core/constants.dart';
import '../../../widgets/custom_bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      header: AppBar(
        title: const Text('Profile'),
      ),
      content: const Center(
        child: Text('Profile Content'),
      ),
      footer: const CustomBottomMenu(selectedIndex: NavigationConstants.PROFILE_INDEX, onMenuItemSelected: null), // onMenuItemSelected không cần thiết nữa
      currentRoute: AppRoutes.profile,
    );
  }
}