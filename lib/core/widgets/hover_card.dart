import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final double scaleFactor;
  final Duration duration;
  final BorderRadius? borderRadius;
  final Color? hoverBorderColor;

  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.scaleFactor = 1.02,
    this.duration = const Duration(milliseconds: 200),
    this.borderRadius,
    this.hoverBorderColor,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? widget.scaleFactor : 1.0,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: widget.duration,
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: (widget.hoverBorderColor ?? Colors.cyan).withValues(alpha: 0.2),
                        blurRadius: 24,
                        spreadRadius: 1,
                        offset: const Offset(0, 8),
                      )
                    ]
                  : [],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
