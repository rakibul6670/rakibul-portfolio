import 'package:flutter/material.dart';

class AnimatedCountText extends StatelessWidget {
  final int targetValue;
  final String suffix;
  final TextStyle style;
  final Duration duration;

  const AnimatedCountText({
    super.key,
    required this.targetValue,
    this.suffix = '',
    required this.style,
    this.duration = const Duration(milliseconds: 1800),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: targetValue.toDouble()),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Text(
          '${value.toInt()}$suffix',
          style: style,
        );
      },
    );
  }
}
