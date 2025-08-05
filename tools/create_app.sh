#!/bin/bash

# Script to create a new Flutter app in the workspace
# Usage: ./tools/create_app.sh <app_name> [description]

set -e

APP_NAME="$1"
DESCRIPTION="${2:-A new Flutter application}"
APPS_DIR="apps"
TEMPLATE_DIR="template"

if [ -z "$APP_NAME" ]; then
    echo "❌ Error: App name is required"
    echo "Usage: ./tools/create_app.sh <app_name> [description]"
    exit 1
fi

if [ -d "$APPS_DIR/$APP_NAME" ]; then
    echo "❌ Error: App '$APP_NAME' already exists"
    exit 1
fi

echo "🚀 Creating new Flutter app: $APP_NAME"

# Create the app using Flutter CLI
cd $APPS_DIR
flutter create \
    --org com.example \
    --project-name "$APP_NAME" \
    --description "$DESCRIPTION" \
    --platforms android,ios,web,windows,macos,linux \
    "$APP_NAME"

cd "$APP_NAME"

echo "📝 Setting up pubspec.yaml with shared dependencies..."

# Create the new pubspec.yaml with shared dependencies
cat > pubspec.yaml << EOF
name: $APP_NAME
description: $DESCRIPTION
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.10.0"

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
    
  # Shared packages
  core_shared:
    path: ../../packages/core_shared
  design_system:
    path: ../../packages/design_system
    
  # State Management
  flutter_bloc: ^8.1.3
  
  # Navigation
  go_router: ^12.1.1
  
  # Dependency Injection
  get_it: ^7.6.4
  injectable: ^2.3.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  
  # Code Generation
  build_runner: ^2.4.7
  injectable_generator: ^2.4.1
  
  # Testing
  bloc_test: ^9.1.5
  mocktail: ^1.0.1

flutter:
  uses-material-design: true
  generate: true
EOF

echo "🏗️ Setting up basic app structure..."

# Create feature-based directory structure
mkdir -p lib/features
mkdir -p lib/app/{di,router,theme}
mkdir -p lib/core/{constants,utils}

# Create main.dart with base template
cat > lib/main.dart << EOF
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:core_shared/core_shared.dart';

import 'app/app.dart';
import 'app/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Setup dependency injection
  await configureDependencies();
  
  runApp(const ${APP_NAME^}App());
}
EOF

# Create app.dart
cat > lib/app/app.dart << EOF
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class ${APP_NAME^}App extends StatelessWidget {
  const ${APP_NAME^}App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$APP_NAME',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to $APP_NAME!'),
        ),
      ),
    );
  }
}
EOF

# Create dependency injection setup
cat > lib/app/di/injection.dart << EOF
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:core_shared/core_shared.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Initialize core shared dependencies
  await initializeCoreShared();
  
  // Initialize app-specific dependencies
  getIt.init();
}
EOF

echo "📱 Getting dependencies..."
flutter pub get

echo "🔨 Running code generation..."
flutter packages pub run build_runner build --delete-conflicting-outputs

echo "✅ Successfully created app: $APP_NAME"
echo "📁 Location: $APPS_DIR/$APP_NAME"
echo ""
echo "Next steps:"
echo "1. cd $APPS_DIR/$APP_NAME"
echo "2. flutter run"
echo ""
echo "🎉 Happy coding!"