import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedLine({
    Key? key,
    this.height = 1,
    this.width = double.infinity,
    this.color = Colors.black,
    this.dashWidth = 5,
    this.dashSpace = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, (height).toDouble()), // You can specify your own width and height
      painter: _DashedLinePainter(
        color: color,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        direction: Axis.horizontal,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final Axis direction;

  _DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    double startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = direction == Axis.horizontal ? size.height : size.width;

    while (direction == Axis.horizontal ? startX < size.width : startY < size.height) {
      final endX = direction == Axis.horizontal ? startX + dashWidth : startX;
      final endY = direction == Axis.vertical ? startY + dashWidth : startY;

      var path = Path();
        path.addRRect(RRect.fromRectAndRadius(
            Rect.fromPoints(Offset(startX, startY), Offset(endX, endY - size.height)), Radius.circular(5)));
      canvas.drawPath(path, paint);
      //canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
      startX += dashWidth + dashSpace;

    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
