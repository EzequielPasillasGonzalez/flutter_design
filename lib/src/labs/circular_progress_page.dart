import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double porcentaje = 0.0;
  double newPorcentaje = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);

    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          porcentaje = newPorcentaje;
          newPorcentaje += 10;

          if (newPorcentaje > 100) {
            newPorcentaje = 0;
            porcentaje = 0;
          }

          _animation = Tween<double>(begin: porcentaje, end: newPorcentaje)
              .animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOutCubic,
                ),
              );

          _controller.forward(from: 0.0);

          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(painter: _RadialProgress(animation: _animation)),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final Animation<double> animation;

  // Al pasarle la animación al súper "repaint", el CustomPainter se redibuja
  // solo en cada frame de la animación de forma automática y óptima.
  _RadialProgress({required this.animation}) : super(repaint: animation);

  
  @override
  void paint(Canvas canvas, Size size) {
    // Circulo completado
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);

    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Parte que se debera ir llenando
    double arcAngle = 2 * pi * (animation.value / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
