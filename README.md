# finance_manager

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project structure
```bash
lib/
├── main.dart                # Điểm khởi đầu của ứng dụng
├── app/                     # Cấu hình app (routes, themes...)
│   ├── app.dart
│   ├── routes.dart
│   └── theme.dart
├── core/                    # Các lớp, tiện ích dùng chung
│   ├── constants.dart
│   ├── utils/
│   └── services/
├── models/                  # Các model dữ liệu (Dart classes)
│   └── transaction.dart
├── modules/                 # Mỗi tính năng lớn là 1 module
│   ├── home/
│   │   ├── home_screen.dart
│   │   ├── home_controller.dart
│   │   └── widgets/
│   └── transactions/
│       ├── transaction_screen.dart
│       └── transaction_controller.dart
├── widgets/                 # Widget tái sử dụng chung toàn app
│   └── custom_button.dart
└── data/                    # Nơi xử lý data: API, local, db
    ├── datasources/
    ├── repositories/
    └── local/

```
