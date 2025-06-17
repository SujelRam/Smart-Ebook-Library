#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Checking Flutter version..."
flutter --version

echo "Getting dependencies..."
flutter pub get

echo "Building APK..."
flutter build apk --release

# Optional: Build for iOS (only on macOS with Xcode installed)
# echo "Building iOS app..."
# flutter build ios --release

echo "Flutter build completed successfully."
