import 'package:flutter/material.dart';

class DottedLinesContainer extends StatelessWidget {
  final int lineCount;
  final double lineSpacing;
  final Color lineColor;
  final double lineWidth;

  DottedLinesContainer({
    required this.lineCount,
    required this.lineSpacing,
    required this.lineColor,
    required this.lineWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        lineCount,
        (index) => DottedLine(
          height: lineWidth,
          color: lineColor,
        ),
      ),
    );
  }
}

class DottedLine extends StatelessWidget {
  final double height;
  final Color color;

  DottedLine({required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(2.0, height), // Adjust the width of the dotted line
      painter: DottedLinePainter(color: color),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;

  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0; // Adjust the thickness of the dotted line

    final dashWidth = 2.0; // Adjust the width of each dash
    final dashSpace = 5.0; // Adjust the space between dashes

    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, size.height / 2),
        Offset(currentX + dashWidth, size.height / 2),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
