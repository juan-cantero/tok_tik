# 🎬 TokTik - Flutter Video Feed App

A TikTok-inspired Flutter learning project featuring vertical video scrolling, video player controls, and modern UI interactions.

## 🎯 Purpose

This project serves as a comprehensive learning experience for Flutter development, specifically focusing on video handling, state management, and creating smooth user interactions. Built to understand core Flutter concepts through practical implementation.

## 📚 Learning Objectives

- Master video playback with Flutter's video_player package
- Implement complex state management using Provider
- Create smooth scrolling experiences with PageView
- Build responsive layouts with Stack and Positioned widgets
- Handle platform-specific interactions (mobile vs web)
- Apply clean architecture principles with proper separation of concerns

## 🔧 Flutter Knowledge Practiced

### State Management
```dart
// Provider implementation for video discovery
class DiscoverProvider extends ChangeNotifier {
  List<VideoPost> videos = [];
  bool initialLoading = true;
  
  Future<void> loadNextPage() async {
    // Load and manage video state
    notifyListeners();
  }
}
```

### Video Player Integration
```dart
// Platform-specific video controls
Widget _buildTouchHandler(Widget child) {
  if (kIsWeb) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Listener(
        onPointerDown: (_) => _togglePlayPause(),
        child: child,
      ),
    );
  } else {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: child,
    );
  }
}
```

### Clean Architecture
```dart
// Domain layer entity
class VideoPost {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;
}

// Infrastructure layer model
class LocalVideoModel {
  static VideoPost videoPostFromJson(Map<String, dynamic> json) {
    return VideoPost(/* mapping logic */);
  }
}
```

## 🎨 Widgets Implemented

### Custom Video Components
- **FullscreenPlayer**: Stateful widget handling video playback with platform-specific controls
- **VideoBackground**: Gradient overlay widget for better text visibility
- **VideoButtons**: Interactive buttons with animations for likes, views, and actions
- **VideoScrollableView**: PageView-based vertical scrolling container

### UI Components
- **_VideoCaption**: Responsive text display with proper sizing
- **_CustomIconButton**: Reusable button component with value display
- **VideoButton**: Action buttons column with animated effects

## 📦 Packages Used

- **video_player**: ^2.10.0 - Video playback functionality
- **provider**: ^6.1.5 - State management solution
- **animate_do**: ^4.2.0 - Smooth animations and transitions
- **intl**: ^0.20.2 - Number formatting and localization

## 🏗️ Project Architecture

```
lib/
├── config/
│   ├── theme/           # App theming
│   └── helpers/         # Utility functions
├── domain/
│   └── entities/        # Business logic entities
├── infrastructure/
│   └── models/          # Data models and mappers
├── presentation/
│   ├── providers/       # State management
│   ├── screens/         # App screens
│   └── widgets/         # Reusable UI components
└── shared/
    └── data/           # Mock data and constants
```

## 🎯 Key Learning Takeaways

### Video Handling
- Video controller lifecycle management
- Platform-specific video interactions
- Performance optimization for video playback
- Aspect ratio handling for different screen sizes

### State Management
- Provider pattern implementation
- ChangeNotifier for reactive UI updates
- State persistence across widget rebuilds
- Loading states and error handling

### UI/UX Concepts
- Vertical scrolling with PageView
- Stack-based layouts for overlay elements
- Responsive design principles
- Smooth animations and transitions

### Platform Adaptation
- Web vs mobile interaction patterns
- Platform-specific gesture handling
- Responsive layouts across devices
- Performance considerations for different platforms

## 🚀 Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Add video files to `assets/videos/` directory
4. Run `flutter run` to start the app

## 📱 Features

- ✅ Vertical video scrolling (TikTok-style)
- ✅ Video playback controls (play/pause)
- ✅ Platform-specific interactions
- ✅ Animated UI elements
- ✅ Responsive design
- ✅ Video overlay gradients
- ✅ Action buttons with counters

---

*This project demonstrates practical Flutter development skills through building a modern video feed application with proper architecture and best practices.*