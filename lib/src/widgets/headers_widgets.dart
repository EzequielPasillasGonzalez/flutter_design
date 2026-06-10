import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 300, color: Color(0xff615AAB));
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  const _HeaderDiagonalPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Lapiz
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    // lapiz.style = PaintingStyle.stroke; // Bordes
    lapiz.style = PaintingStyle.fill; // Rellena la figura
    // lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderTriangularPainter()),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  const _HeaderTriangularPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Lapiz
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // Rellena la figura

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderPicoPainter()),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  const _HeaderPicoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Lapiz
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // Rellena la figura

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvoPainter()),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  const _HeaderCurvoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Lapiz
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // Rellena la figura
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    // El punto de las primeras coordenadas indican el inicio de la curvatura
    //  Las ultimas dos coordenadas apuntan a donde quiere llegar la linea
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.5,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavePainter()),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  const _HeaderWavePainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Lapiz
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // Rellena la figura
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.30);
    // El punto de las primeras coordenadas indican el inicio de la curvatura
    //  Las ultimas dos coordenadas apuntan a donde quiere llegar la linea
    // path.lineTo(size.width * .5, size.height * 0.35);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.40,
      size.width * 0.50,
      size.height * 0.30,
    );

    path.quadraticBezierTo(
      size.width * 0.70,
      size.height * 0.20,
      size.width,
      size.height * 0.30,
    );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // Rellena la figura

    path.moveTo(0, size.height);

    path.lineTo(0, size.height * 0.70);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.80,
      size.width * 0.50,
      size.height * 0.60,
    );

    path.quadraticBezierTo(
      size.width * .80,
      size.height * 0.4,
      size.width,
      size.height * 0.60,
    );

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
