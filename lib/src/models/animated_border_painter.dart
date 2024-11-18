import 'package:animated_text_field/src/models/extract_animation_path.dart';
import 'package:flutter/material.dart';

class AnimatedBorderPainter extends CustomPainter {
  /// Border color
  ///
  final Color? borderColor;

  /// stroke width
  ///
  final double? strokeWidth;

  /// Animation Value ranging from 0.0 to 1.0
  ///
  final double animationValue;

  /// Class which paints the animated border around the textfield
  ///
  const AnimatedBorderPainter({
    this.borderColor,
    this.strokeWidth,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth ?? 2.0
      ..style = PaintingStyle.stroke
      ..color = borderColor ?? Colors.deepPurple;

    // final paint2 = Paint()
    //   ..strokeWidth = 2.0
    //   ..style = PaintingStyle.stroke
    //   ..color = Colors.deepOrange;

    final path1 =
        Path(); // this path start from left border's half height all the way to right border's half height from the top
    path1.moveTo(0, size.height / 2);
    path1.lineTo(0, 8);
    path1.quadraticBezierTo(0, 0, 8, 0);
    path1.lineTo(size.width - 8, 0);
    path1.quadraticBezierTo(size.width, 0, size.width, 8);
    path1.lineTo(size.width, size.height / 2);

    // this path start from left border's half height all the way to right border's half height from the bottom
    final path2 = Path();
    path2.moveTo(0, size.height / 2);
    path2.lineTo(0, size.height - 8);
    path2.quadraticBezierTo(0, size.height, 8, size.height);
    path2.lineTo(size.width - 8, size.height);
    path2.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 8);
    path2.lineTo(size.width, size.height / 2);

    // Extract the required path based on animation value or percent
    final p1 = ExtractAnimationPath.createAnimatedPath(
        originalPath: path1, animationPercent: animationValue);
    final p2 = ExtractAnimationPath.createAnimatedPath(
        originalPath: path2, animationPercent: animationValue);

    // finally draw both paths
    canvas.drawPath(p1, paint);
    canvas.drawPath(p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
