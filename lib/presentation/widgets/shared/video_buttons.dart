import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButton extends StatelessWidget {
  final VideoPost video;
  const VideoButton({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          color: Colors.redAccent,
        ),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color),
          iconSize: 30,
        ),
        if (value > 0) Text(HumanFormats.humanRedableNumber(value.toDouble())),
      ],
    );
  }
}
