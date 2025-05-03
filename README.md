# finance_manager

A new Flutter project for personal finance management.

## Getting Started

This project serves as a foundation for a Flutter application designed to help users manage their personal finances effectively.

If you're new to Flutter, here are some helpful resources to get you started:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For comprehensive guidance on Flutter development, including tutorials, samples, mobile development best practices, and a complete API reference, visit the [online documentation](https://docs.flutter.dev/).

## Project Structure

The project is organized into the following directories to separate concerns and improve maintainability:

```bash
lib/
├── main.dart                # Entry point of the application. Initializes and runs the root widget.
├── app/                     # Application-level configurations and core components.
│   ├── app.dart             # Main application widget (e.g., MaterialApp), setting up theme and routes.
│   ├── routes.dart          # Defines the application's navigation routes.
│   └── theme.dart           # Defines the visual theme (colors, typography) of the application.
├── core/                    # Reusable and fundamental classes and utilities used across the application.
│   ├── constants.dart       # Defines global constants used throughout the app.
│   ├── utils/               # Utility functions and helper classes.
│   └── services/            # Abstract interfaces for various services (API, local storage, etc.).
├── data/                    # Handles data-related operations.
│   ├── datasources/       # Implementations for different data sources (API, local database).
│   ├── repositories/      # Abstracts data source implementations, providing a clean data access layer.
│   └── local/             # Handles local data storage (e.g., SharedPreferences, SQLite).
├── models/                  # Defines the data structures (Dart classes) used in the application.
│   └── transaction.dart     # Model for transaction data.
├── modules/                 # Contains the main features or sections of the application.
│   ├── home/                # Module for the home screen and related functionalities.
│   │   ├── controllers/     # Manages the logic and state for the home screen.
│   │   │   └── home_controller.dart
│   │   ├── screens/         # UI components for the home screen.
│   │   │   └── home_screen.dart
│   │   └── widgets/         # Reusable widgets specific to the home module.
│   └── transactions/        # Module for managing transactions.
│       ├── controllers/     # Manages the logic and state for transaction-related screens.
│       │   └── transaction_controller.dart
│       └── screens/         # UI components for transaction-related screens (e.g., transaction_screen.dart).
├── widgets/                 # Globally reusable UI widgets used across different modules.
│   └── custom_button.dart   # A custom button widget.
└── main.dart                # (Duplicated in the list, should be just at the top level)