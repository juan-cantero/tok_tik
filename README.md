# 🎬 TokTik - Flutter Learning Project

A TikTok-inspired Flutter application built for educational purposes to demonstrate key Flutter concepts, widgets, and programming techniques. This project serves as a practical learning resource for intermediate Flutter development.

## 🎯 Purpose

This repository is designed as a learning resource to understand and practice essential Flutter concepts through building a real-world video feed application. Each component demonstrates specific Flutter techniques and best practices.

## 📚 Programming Techniques Learned

### 1. Manejo de Assets (Asset Management)

**What it is**: Loading and managing local files (videos, images, fonts) in Flutter applications.

**Implementation in this project**:
```dart
// pubspec.yaml configuration
flutter:
  assets:
    - assets/videos/

// Usage in video controller
controller = VideoPlayerController.asset(widget.videoUrl)
  ..setVolume(0)
  ..setLooping(true)
  ..play();
```

**Key Learning**: Assets must be declared in `pubspec.yaml` and loaded using appropriate constructors like `VideoPlayerController.asset()`.

### 2. Paquetes (Packages)

**What it is**: External dependencies that extend Flutter's functionality.

**Packages used in this project**:
```yaml
dependencies:
  video_player: ^2.10.0      # Video playback
  provider: ^6.1.5           # State management
  animate_do: ^4.2.0         # Animations
  intl: ^0.20.2             # Number formatting
```

**Implementation example**:
```dart
// Using intl package for number formatting
import 'package:intl/intl.dart';

static String humanRedableNumber(double number) {
  final formattedNumber = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: '',
  ).format(number);
  return formattedNumber;
}
```

### 3. Gesture Detector

**What it is**: Widget that detects gestures like taps, swipes, and long presses.

**Implementation**:
```dart
// Platform-specific gesture handling
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

**Key Learning**: Different platforms require different gesture handling approaches (web vs mobile).

### 4. Posicionamiento de Widgets (Widget Positioning)

**What it is**: Precisely placing widgets within layouts using positioning widgets.

**Implementation with Stack and Positioned**:
```dart
return Stack(
  children: [
    SizedBox.expand(
      child: FullscreenPlayer(
        caption: videoPost.caption,
        videoUrl: videoPost.videoUrl,
      ),
    ),
    Positioned(
      bottom: 40,
      right: 20,
      child: VideoButton(video: videoPost),
    ),
  ],
);
```

**Key Learning**: `Stack` allows overlapping widgets, `Positioned` places widgets at specific coordinates.

### 5. Mappers

**What it is**: Converting data between different formats (JSON to Objects, Models to Entities).

**Implementation**:
```dart
class LocalVideoModel {
  // Constructor and properties...
  
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json["name"] ?? "No video name",
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
      );

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}
```

**Key Learning**: Mappers separate data layer concerns from business logic entities.

### 6. Gradientes (Gradients)

**What it is**: Smooth color transitions used for visual effects and readability.

**Implementation**:
```dart
class VideoBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
```

**Key Learning**: Gradients improve text readability over video backgrounds and create visual appeal.

### 7. Loops

**What it is**: Iterating through collections to display dynamic content.

**Implementation**:
```dart
// Data source loop
List<Map<String, dynamic>> videoPosts = [
  {
    'name': 'Subiendo escaleras automáticas',
    'videoUrl': 'assets/videos/1.mp4',
    'likes': 23230,
    'views': 1523,
  },
  // ... more items
];

// UI loop with PageView.builder
return PageView.builder(
  itemCount: videos.length,
  itemBuilder: (context, index) {
    final videoPost = videos[index];
    return Stack(/* video widget */);
  },
);
```

**Key Learning**: Use `ListView.builder` or `PageView.builder` for efficient rendering of large lists.

### 8. Aserciones (Assertions)

**What it is**: Runtime checks that ensure code correctness during development.

**Implementation**:
```dart
const VideoBackground({
  super.key,
  this.colors = const [Colors.transparent, Colors.black87],
  this.stops = const [0.0, 1.0],
}) : assert(
       colors.length == stops.length,
       'Stops and colors must be same length',
     );
```

**Key Learning**: Assertions help catch bugs early and document expected behavior.

### 9. Stacks

**What it is**: Widget that allows overlapping children in a layered layout.

**Implementation**:
```dart
return Stack(
  children: [
    // Background layer - full screen video
    SizedBox.expand(
      child: FullscreenPlayer(
        caption: videoPost.caption,
        videoUrl: videoPost.videoUrl,
      ),
    ),
    // Overlay layer - positioned buttons
    Positioned(
      bottom: 40,
      right: 20,
      child: VideoButton(video: videoPost),
    ),
  ],
);
```

**Key Learning**: Stack widgets are perfect for overlays, floating buttons, and layered UIs.

### 10. Controladores de Video (Video Controllers)

**What it is**: Managing video playback, state, and lifecycle in Flutter applications.

**Implementation**:
```dart
class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }
}
```

**Key Learning**: Always dispose video controllers to prevent memory leaks and manage video lifecycle properly.

## 🔧 Flutter Widgets Used

### Core Widgets
- **[Stack](https://api.flutter.dev/flutter/widgets/Stack-class.html)**: Overlapping widgets in layers
- **[Positioned](https://api.flutter.dev/flutter/widgets/Positioned-class.html)**: Precise widget positioning within Stack
- **[PageView](https://api.flutter.dev/flutter/widgets/PageView-class.html)**: Swipeable page navigation
- **[GestureDetector](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html)**: Gesture recognition
- **[Column](https://api.flutter.dev/flutter/widgets/Column-class.html)**: Vertical widget arrangement
- **[SizedBox](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)**: Fixed size containers

### Video & Media Widgets
- **[VideoPlayer](https://pub.dev/documentation/video_player/latest/video_player/VideoPlayer-class.html)**: Video playback widget
- **[VideoPlayerController](https://pub.dev/documentation/video_player/latest/video_player/VideoPlayerController-class.html)**: Video controller management

### Styling & Visual Widgets
- **[DecoratedBox](https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html)**: Widget decoration
- **[LinearGradient](https://api.flutter.dev/flutter/painting/LinearGradient-class.html)**: Gradient backgrounds
- **[IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html)**: Interactive icon buttons

### State Management
- **[ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)**: State management base class
- **[Provider](https://pub.dev/documentation/provider/latest/provider/Provider-class.html)**: State management widget

### Animation Widgets
- **[SpinPerfect](https://pub.dev/documentation/animate_do/latest/animate_do/SpinPerfect-class.html)**: Spinning animations (from animate_do)

## 🚀 How to Run This Project

### Prerequisites
- Flutter SDK installed on your machine
- An IDE (VS Code, Android Studio, or IntelliJ)
- Device or emulator for testing

### Step-by-Step Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/juan-cantero/tok_tik.git
   cd tok_tik
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```

4. **Add video files** (Optional for testing)
   - Place MP4 video files in the `assets/videos/` directory
   - Videos should be named `1.mp4`, `2.mp4`, etc.

5. **Run the application**
   ```bash
   # For default device
   flutter run
   
   # For specific platform
   flutter run -d chrome      # Web
   flutter run -d ios         # iOS
   flutter run -d android     # Android
   ```

### Available Commands
```bash
# Development
flutter run --debug          # Debug mode
flutter run --profile        # Profile mode
flutter run --release        # Release mode

# Building
flutter build apk           # Android APK
flutter build ios           # iOS build
flutter build web           # Web build

# Testing
flutter test                # Run tests
flutter analyze             # Code analysis
```

### Project Structure
```
lib/
├── config/              # Configuration files
├── domain/              # Business logic entities
├── infrastructure/      # Data models and external APIs
├── presentation/        # UI components and screens
├── shared/             # Shared utilities and data
└── main.dart           # Application entry point
```

## 📱 Features Demonstrated

- ✅ Vertical video scrolling (TikTok-style)
- ✅ Video playback with controls
- ✅ Platform-specific interactions
- ✅ State management with Provider
- ✅ Custom animations
- ✅ Gradient overlays
- ✅ Responsive design
- ✅ Asset management

---

**🎓 This project is designed for learning purposes and demonstrates practical Flutter development techniques through building a modern video application.**


example clean architecture: 
1 . ui
2 . presentation
3 . use cases
4 . repositories and datasources
5 . information returns to UI