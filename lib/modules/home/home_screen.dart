import 'package:flutter/material.dart';
import 'package:finance_manager/widgets/custom_button.dart'; // Import widget tùy chỉnh

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Finance Manager!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Add Transaction',
              onPressed: () {
                // Xử lý sự kiện nút
                print('Add Transaction button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
