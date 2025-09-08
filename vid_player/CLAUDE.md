# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter video player application that allows users to select videos from their device gallery and play them with custom controls. The app uses the `video_player` and `image_picker` packages for core functionality.

## Architecture

- **Single-screen architecture**: The app consists primarily of a `HomeScreen` that toggles between video selection and video playback interfaces
- **Widget-based components**: UI is broken down into focused, reusable widgets (`_VideoSelector`, `_VideoPlayer`, `_PlayButton`, `_Bottom`, etc.)
- **State management**: Uses Flutter's built-in `StatefulWidget` for local component state
- **File handling**: Videos are handled as `XFile` objects from the image_picker package and converted to `File` objects for the video player

## Key Components

### Main Application Flow
- `lib/main.dart`: Entry point with MaterialApp wrapper
- `lib/screens/home_screen.dart`: Main screen containing all UI logic

### UI Components
- `_VideoSelector`: Landing screen with gradient background and logo
- `_VideoPlayer`: Video playback interface with AspectRatio container
- `_PlayButton`: Custom playback controls (play/pause/seek)
- `_Bottom`: Progress slider and time display
- `_Logo`: Clickable logo for video selection

## Development Commands

### Building and Running
```bash
# Run on iOS simulator
flutter run

# Run on Android emulator  
flutter run -d android

# Build for production
flutter build ios
flutter build android
```

### Testing and Analysis
```bash
# Run widget tests
flutter test

# Run static analysis
flutter analyze

# Check for dependency updates
flutter pub outdated
```

### Package Management
```bash
# Get dependencies
flutter pub get

# Clean build artifacts
flutter clean

# Upgrade dependencies
flutter pub upgrade
```

## Dependencies

### Main Dependencies
- `video_player: ^2.8.2`: Core video playback functionality
- `image_picker: ^1.0.7`: Device gallery access for video selection
- `cupertino_icons: ^1.0.8`: iOS-style icons

### Dev Dependencies
- `flutter_lints: ^5.0.0`: Dart/Flutter linting rules
- `flutter_test`: Flutter testing framework

## Common Issues

### Build Errors
- Ensure no invalid dart imports are present (like internal VM libraries)
- Run `flutter clean` followed by `flutter pub get` if build cache issues occur
- Check that all dependencies are properly specified in `pubspec.yaml`

### Asset Management
- Images are stored in `assets/image/` directory
- Asset references in `pubspec.yaml` must match actual file structure
- Logo asset is referenced as `'assets/image/logo.png'`

## Testing

The project includes basic widget tests in `test/widget_test.dart`. However, the current test appears to be a template and may not match the actual app functionality - it should be updated to test the video player interface rather than looking for counter functionality.