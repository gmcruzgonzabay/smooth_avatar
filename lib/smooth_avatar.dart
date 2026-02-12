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
    final safeBorderWidth = borderWidth.clamp(0, radius).toDouble();
    return Container(
      width: radius * 2,
      height: radius * 2,
      padding: EdgeInsets.all(safeBorderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: safeBorderWidth > 0
            ? Border.all(
                color: borderColor ?? Colors.transparent,
                width: safeBorderWidth,
              )
            : null,
      ),
      child: ClipOval(
        child: Image(
          image: image,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;

            if (frame == null) {
              return placeholder ??
                  Container(
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: radius * 0.4,
                      height: radius * 0.4,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  );
            }

            return AnimatedOpacity(
              opacity: 1,
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
