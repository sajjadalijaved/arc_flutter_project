import 'package:flutter/widgets.dart';

class Myclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(50, size.height - 150);
    var controlPoint2 = Offset(size.width - 50, size.height);
    var endPoint = Offset(size.width, size.height - 50);

    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height - 50)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Myclip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height / 2);
    // path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2 - 140, 0, size.width * .3, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2 - 10, 0, size.width * .6, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2 + 90, 0, size.width * .9, size.height / 2);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // // path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
