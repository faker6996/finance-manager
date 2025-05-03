import 'package:flutter/material.dart';

class CustomBottomMenu extends StatelessWidget {
  final Function(int)? onMenuItemSelected;
  final int selectedIndex;

  const CustomBottomMenu({
    super.key,
    required this.onMenuItemSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildMenuItem(
            context: context, // Pass the context here
            index: 0,
            icon: Icons.home,
            label: 'Home',
            isSelected: selectedIndex == 0,
            onTap: onMenuItemSelected,
          ),
          _buildMenuItem(
            context: context, // Pass the context here
            index: 1,
            icon: Icons.history,
            label: 'History',
            isSelected: selectedIndex == 1,
            onTap: onMenuItemSelected,
          ),
          _buildMenuItem(
            context: context, // Pass the context here
            index: 2,
            icon: Icons.person,
            label: 'Profile',
            isSelected: selectedIndex == 2,
            onTap: onMenuItemSelected,
          ),
          // Thêm các item menu khác nếu cần
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context, // Receive the context
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
    required Function(int)? onTap,
  }) {
    final Color color = isSelected ? Theme.of(context).primaryColor : Colors.grey;

    return InkWell(
      onTap: () => onTap?.call(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: color),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(color: color, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}