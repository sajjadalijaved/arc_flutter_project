import 'dart:math';

import 'package:flutter/material.dart';

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.translate(size.width / 2, size.height / 2);
//     const curveRadius = 50.0;
//     const legLength = 150.0;
//     canvas.rotate(pi / 2);

//     final ovalPaint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 10
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     const fixPoint = Offset.zero;

//     final ovalPath = Path()..moveTo(fixPoint.dx, fixPoint.dy);
//     ovalPath.relativeArcToPoint(
//       const Offset(curveRadius * 2, 0),
//       radius: const Radius.circular(curveRadius),
//     );
//     ovalPath.relativeLineTo(0, legLength);
//     ovalPath.relativeArcToPoint(
//       const Offset(-curveRadius * 2, 0),
//       radius: const Radius.circular(curveRadius),
//     );
//     ovalPath.relativeLineTo(0, -legLength);

//     final holePath = Path();
//     holePath.addArc(Rect.fromCircle(center: fixPoint, radius: 13), 0, 2 * pi);

//     canvas.drawPath(
//       Path.combine(PathOperation.difference, ovalPath, holePath),
//       ovalPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(MyPainter oldDelegate) => false;
// }

class Mypaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    const curveRadius = 100.0;
    const legLength = 130.0;
    canvas.rotate(pi / 2);

    final ovalPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const fixPoint = Offset.zero;

    final ovalPath = Path()..moveTo(fixPoint.dx, fixPoint.dy);
    ovalPath.relativeArcToPoint(
      const Offset(curveRadius * 2, 0),
      radius: const Radius.circular(curveRadius),
    );
    ovalPath.relativeLineTo(0, legLength);
    ovalPath.relativeArcToPoint(
      const Offset(-curveRadius * 2, 0),
      radius: const Radius.circular(curveRadius),
    );
    ovalPath.relativeLineTo(0, -legLength);

    final holePath = Path();
    holePath.addArc(Rect.fromCircle(center: fixPoint, radius: 13), 0, 2 * pi);

    final rectWithCutout = Path.combine(
        PathOperation.difference,
        Path()
          ..addRect(
            Rect.fromCenter(
              center: Offset.zero,
              width: size.width,
              height: size.height,
            ),
          ),
        holePath);

    canvas.clipPath(rectWithCutout);

    canvas.drawPath(
      ovalPath,
      ovalPaint,
    );
  }

  @override
  bool shouldRepaint(Mypaint oldDelegate) => true;
}
