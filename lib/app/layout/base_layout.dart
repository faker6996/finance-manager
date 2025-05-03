import 'package:flutter/material.dart';
import 'package:finance_manager/widgets/custom_bottom_menu.dart';
import 'package:finance_manager/app/routes.dart';

import '../../core/constants.dart'; // Import your routes

class BaseLayout extends StatelessWidget {
  final PreferredSizeWidget? header;
  final Widget content;
  final Widget? footer;
  final String currentRoute;

  const BaseLayout({
    super.key,
    this.header,
    required this.content,
    this.footer,
    required this.currentRoute,
  });

  void _handleMenuItemSelected(BuildContext context, int index) {
    if (index == NavigationConstants.HOME_INDEX && currentRoute != AppRoutes.home) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else if (index == NavigationConstants.HISTORY_INDEX && currentRoute != AppRoutes.history) {
      Navigator.pushReplacementNamed(context, AppRoutes.history);
    } else if (index == NavigationConstants.PROFILE_INDEX && currentRoute != AppRoutes.profile) {
      Navigator.pushReplacementNamed(context, AppRoutes.profile);
    }
    // Bạn có thể thêm xử lý cho các index khác nếu có thêm item menu
  }

  int _getSelectedIndex() {
    if (currentRoute == AppRoutes.home) {
      return NavigationConstants.HOME_INDEX;
    } else if (currentRoute == AppRoutes.history) {
      return NavigationConstants.HISTORY_INDEX;
    } else if (currentRoute == AppRoutes.profile) {
      return NavigationConstants.PROFILE_INDEX;
    }
    return 0; // Default to home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header,
      body: Column(
        children: <Widget>[
          Expanded(
            child: content,
          ),
          if (footer != null)
            footer is CustomBottomMenu
                ? CustomBottomMenu(
              onMenuItemSelected: (index) => _handleMenuItemSelected(context, index),
              selectedIndex: _getSelectedIndex(),
            )
                : footer!,
        ],
      ),
    );
  }
}