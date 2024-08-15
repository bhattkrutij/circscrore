import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashedOvalPainterTop extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dashWidth = 10.0;
    final dashSpace = 5.0;

    // Define the oval path
    final path = Path();
    path.addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    PathMetric pathMetric = path.computeMetrics().first;
    double distance = pathMetric.length / 2;

    while (distance < pathMetric.length) {
      // Only draw the bottom half of the oval
      final metrics = pathMetric.getTangentForOffset(distance);
      final nextMetrics = pathMetric.getTangentForOffset(distance + dashWidth);
      if (metrics != null && nextMetrics != null) {
        canvas.drawLine(metrics.position, nextMetrics.position, paint);
      }
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}