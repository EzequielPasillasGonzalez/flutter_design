import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;

  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimario = Colors.red,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double porcentajeAnterior = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(
      begin: widget.porcentaje,
      end: widget.porcentaje,
    ).animate(_controller);
    porcentajeAnterior = widget.porcentaje;
  }

  @override
  void didUpdateWidget(covariant RadialProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Solo si el porcentaje cambia por fuera, recalculamos el Tween y animamos
    if (oldWidget.porcentaje != widget.porcentaje) {
      porcentajeAnterior = oldWidget.porcentaje;

      _animation =
          Tween<double>(
            begin: porcentajeAnterior, // Inicia donde se quedó
            end: widget.porcentaje, // Va hacia el nuevo valor
          ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
          );

      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialProgress(
        animation: _animation,
        colorPrimario: widget.colorPrimario,
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final Animation<double> animation;
  final Color colorPrimario;

  // Al pasarle la animación al súper "repaint", el CustomPainter se redibuja
  // solo en cada frame de la animación de forma automática y óptima.
  _RadialProgress({required this.animation, required this.colorPrimario})
    : super(repaint: animation);

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
      ..color = colorPrimario
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
