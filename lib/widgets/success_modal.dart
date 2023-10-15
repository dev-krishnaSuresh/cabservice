import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:ontransit_app/screens/my_bookings.dart';

class SuccessModal extends StatefulWidget {
  @override
  _SuccessModalState createState() => _SuccessModalState();
}

class _SuccessModalState extends State<SuccessModal> {
  bool isRotating = true;

  @override
  void initState() {
    super.initState();
    // Start rotating the pentagon
    // rotatePentagon();
  }

  void rotatePentagon() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        isRotating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MyBookings();
      }));
    });
    return Dialog(
      backgroundColor: Colors.transparent, // Set the background to transparent
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isRotating
                ? AnimatedContainer(
                    duration: Duration(seconds: 2),
                    transform: Matrix4.rotationZ(0.5 *
                        pi /
                        180.0), // Rotate by 0.5 degrees (converted to radians)
                    child: RotatingPentagon(),
                  )
                : RotatingPentagon(),
            SizedBox(height: 16.0),
            Text(
              'Congrats!',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10.0),
            Text(
              'Payment made successfully',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class RotatingPentagon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150, 150),
      painter: PentagonPainter(),
    );
  }
}

class PentagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xffFFBB00)
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final double rotation = 360 / 16; // Angle between pentagon sides

    Path path = Path();

    for (int i = 0; i < 16; i++) {
      final double x = centerX +
          radius * cos(i * rotation * pi / 180.0); // Convert degrees to radians
      final double y = centerY +
          radius * sin(i * rotation * pi / 180.0); // Convert degrees to radians
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
      Offset(centerX * 0.94 - radius / 200, centerY + radius / 4),
      paint
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7.0,
    );
    canvas.drawLine(
      Offset(centerX * 1.7 - radius / 6, centerY * 0.5),
      Offset(centerX - radius / 14, centerY + radius / 3.4),
      paint
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7.0,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CheckmarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final double startX = size.width * 0.2;
    final double startY = size.height * 0.5;
    final double midX = size.width * 0.4;
    final double midY = size.height * 0.7;
    final double endX = size.width * 0.8;
    final double endY = size.height * 0.3;

    final Path path = Path()
      ..moveTo(startX, startY)
      ..lineTo(midX, midY)
      ..lineTo(endX, endY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
