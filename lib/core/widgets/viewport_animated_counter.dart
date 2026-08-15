import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ViewportAnimatedCounter extends StatefulWidget {
  final int targetValue;
  final String suffix;
  final TextStyle style;
  final Duration duration;
  final String uniqueId;

  const ViewportAnimatedCounter({
    super.key,
    required this.targetValue,
    this.suffix = '',
    required this.style,
    this.duration = const Duration(milliseconds: 1500),
    required this.uniqueId,
  });

  @override
  State<ViewportAnimatedCounter> createState() => _ViewportAnimatedCounterState();
}

class _ViewportAnimatedCounterState extends State<ViewportAnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  bool _hasTriggered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.targetValue.toDouble(),
    ).animate(curved);

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(curved);

    _fadeAnimation = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(curved);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_hasTriggered && info.visibleFraction > 0.1) {
      setState(() => _hasTriggered = true);
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('animated_counter_${widget.uniqueId}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final int currentValue = _hasTriggered ? _animation.value.toInt() : 0;
          return FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Text(
                '$currentValue${widget.suffix}',
                style: widget.style,
              ),
            ),
          );
        },
      ),
    );
  }
}
