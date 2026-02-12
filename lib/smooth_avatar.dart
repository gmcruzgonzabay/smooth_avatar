library smooth_avatar;

import 'package:flutter/material.dart';

/// A customizable fade-in circular avatar widget for Flutter.
class SmoothAvatar extends StatelessWidget {
  final ImageProvider image;
  final double radius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Color? borderColor;
  final double borderWidth;

  const SmoothAvatar({
    super.key,
    required this.image,
    this.radius = 40,
    this.placeholder,
    this.errorWidget,
    this.borderColor,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderWidth > 0
            ? Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth,
              )
            : null,
      ),
      child: ClipOval(
        child: Image(
          image: image,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: child,
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ??
                Container(
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Icon(Icons.person, size: 30),
                );
          },
        ),
      ),
    );
  }
}
