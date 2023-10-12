import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:animated_rotation/animated_rotation.dart'
    as animatedRotation; // Import with an alias;

class RotatingPentagon extends StatefulWidget {
  @override
  _RotatingPentagonState createState() => _RotatingPentagonState();
}

class _RotatingPentagonState extends State<RotatingPentagon> {
  double turns = 0.0;
  void init() {
    _changeRotation();
  }

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return animatedRotation.AnimatedRotation(
      duration: Duration(seconds: 10),
      angle: 45,
      child: CustomPaint(
        size: Size(100, 100),
        painter: PentagonPainter(),
      ),
    );

    // AnimatedRotation(
    //   duration: Duration(seconds: 2),
    //   turns: turns,
    //   child: CustomPaint(
    //     size: Size(100, 100),
    //     painter: PentagonPainter(),
    //   ),
    // );
  }
}

class PentagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final double rotation = math.radians(72); // Angle between pentagon sides

    Path path = Path();

    for (int i = 0; i < 5; i++) {
      final double x = centerX + radius;
      final double y = centerY + radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    canvas.drawPath(path, paint);
    // Draw a checkmark inside the pentagon
    canvas.drawLine(
      Offset(centerX - radius / 2, centerY),
      Offset(centerX - radius / 6, centerY + radius / 3),
      paint
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5.0,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
