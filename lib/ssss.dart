import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Curved Path',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Circle(),
      ),
    );
  }
}

class Circle extends StatefulWidget {
  const Circle({Key? key}) : super(key: key);

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
  double? _fraction = 0.0;

  late Animation<double> _animation;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomPaint(
            painter: CirclePainter(fraction: _fraction!),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  final double? fraction;

  late Paint _circlePaint;

  CirclePainter({this.fraction}) {
    _circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
  }

  final Paint _paint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    path.addArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: 131.0909090909091),
        _degreesToRadians(-90).toDouble(),
        (_degreesToRadians(269.999 * fraction!).toDouble() -
            _degreesToRadians(-90).toDouble()));

    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: 42.32727272727273),
        _degreesToRadians(269.999 * fraction!).toDouble(),
        _degreesToRadians(-90).toDouble() -
            _degreesToRadians((269.999) * fraction!).toDouble(),
        false);

    path.addArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: 131.0909090909091),
        _degreesToRadians(-90).toDouble(),
        (_degreesToRadians(179.999 * fraction!).toDouble() -
            _degreesToRadians(-90).toDouble()));

    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: 42.32727272727273),
        _degreesToRadians(179.999 * fraction!).toDouble(),
        _degreesToRadians(-90).toDouble() -
            _degreesToRadians((179.999) * fraction!).toDouble(),
        false);

    canvas.drawPath(path, _circlePaint);

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}

num _degreesToRadians(num deg) => deg * (pi / 180);
