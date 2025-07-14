import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

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

  Widget _buildTouchHandler(Widget child) {
    if (kIsWeb) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Listener(onPointerDown: (_) => _togglePlayPause(), child: child),
      );
    } else {
      return GestureDetector(onTap: _togglePlayPause, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        return _buildTouchHandler(
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                VideoBackground(stops: [0.8, 1.0]),
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
