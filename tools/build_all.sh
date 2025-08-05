#!/bin/bash

# Script to build all Flutter apps for specified platforms
# Usage: ./tools/build_all.sh [platform] [build_type]
# Platforms: android, ios, web, windows, macos, linux, all
# Build types: debug, profile, release (default: release)

set -e

PLATFORM="${1:-all}"
BUILD_TYPE="${2:-release}"
APPS_DIR="apps"

if [ ! -d "$APPS_DIR" ]; then
    echo "❌ Error: Apps directory not found"
    exit 1
fi

echo "🏗️ Building all apps for platform: $PLATFORM, type: $BUILD_TYPE"

build_app_for_platform() {
    local app_dir="$1"
    local platform="$2"
    local build_type="$3"
    
    echo "📱 Building $app_dir for $platform ($build_type)..."
    
    cd "$APPS_DIR/$app_dir"
    
    case $platform in
        android)
            if [ -d "android" ]; then
                case $build_type in
                    debug) flutter build apk --debug ;;
                    profile) flutter build apk --profile ;;
                    release) flutter build apk --release ;;
                esac
            else
                echo "⚠️  Skipping $app_dir: Android not supported"
            fi
            ;;
        ios)
            if [ -d "ios" ]; then
                case $build_type in
                    debug) flutter build ios --debug --no-codesign ;;
                    profile) flutter build ios --profile --no-codesign ;;
                    release) flutter build ios --release --no-codesign ;;
                esac
            else
                echo "⚠️  Skipping $app_dir: iOS not supported"
            fi
            ;;
        web)
            if [ -d "web" ]; then
                case $build_type in
                    debug) flutter build web --debug ;;
                    profile) flutter build web --profile ;;
                    release) flutter build web --release ;;
                esac
            else
                echo "⚠️  Skipping $app_dir: Web not supported"
            fi
            ;;
        windows)
            if [ -d "windows" ]; then
                case $build_type in
                    debug) flutter build windows --debug ;;
                    profile) flutter build windows --profile ;;
                    release) flutter build windows --release ;;
                esac
            else
                echo "⚠️  Skipping $app_dir: Windows not supported"
            fi
            ;;
        macos)
            if [ -d "macos" ]; then
                case $build_type in
                    debug) flutter build macos --debug ;;
                    profile) flutter build macos --profile ;;
                    release) flutter build macos --release ;;
                esac
            else
                echo "⚠️  Skipping $app_dir: macOS not supported"
            fi
            ;;
        linux)
            if [ -d "linux" ]; then
                case $build_type in
                    debug) flutter build linux --debug ;;
                    profile) flutter build linux --profile ;;
                    release) flutter build linux --release ;;
                esac
            else
                echo "⚠️  Skipping $app_dir: Linux not supported"
            fi
            ;;
    esac
    
    cd - > /dev/null
}

# Get all app directories
APP_DIRS=$(find "$APPS_DIR" -maxdepth 1 -type d -not -path "$APPS_DIR" | sed "s|$APPS_DIR/||")

if [ -z "$APP_DIRS" ]; then
    echo "⚠️  No apps found in $APPS_DIR directory"
    exit 0
fi

echo "Found apps: $(echo $APP_DIRS | tr '\n' ' ')"

for app_dir in $APP_DIRS; do
    if [ "$PLATFORM" = "all" ]; then
        for platform in android ios web windows macos linux; do
            build_app_for_platform "$app_dir" "$platform" "$BUILD_TYPE"
        done
    else
        build_app_for_platform "$app_dir" "$PLATFORM" "$BUILD_TYPE"
    fi
done

echo "✅ Build completed for all apps!"