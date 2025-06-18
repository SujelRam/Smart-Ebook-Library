#!/bin/bash

set -e  # Exit on first error

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
  echo "Flutter could not be found. Please install Flutter and add it to your PATH."
  exit 1
fi

echo "Checking Flutter version..."
flutter --version

echo "Running Flutter doctor..."
flutter doctor

echo "Getting dependencies..."
flutter pub get

echo "Building APK (release mode)..."
flutter build apk --release

# Uncomment the following if you're on macOS with Xcode for iOS builds
# echo "Building iOS app..."
# flutter build ios --release

echo "✅ Flutter build completed successfully."
