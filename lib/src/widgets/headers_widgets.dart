import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWaveGradientPainter()),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  const _HeaderWaveGradientPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff6D05E8), Color(0xffc012ff), Color(0xff6d05fa)],
      stops: [0, 0.5, 1],
    );

    final Rect rect = Rect.fromCircle(center: Offset(150.0, 55), radius: 180);
    // Lapiz
    final lapiz = Paint()..shader = gradiente.createShader(rect);

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

class IconHeader extends StatelessWidget {
  const IconHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.color1 = Colors.blueGrey,
    this.color2 = Colors.grey,
  });

  final FaIconData icon;
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2),
        _IconHeaderTopLeft(icon: icon),
        _IconHeaderTitle(icon: icon, title: title, subTitle: subTitle),
      ],
    );
  }
}

class _IconHeaderTitle extends StatelessWidget {
  _IconHeaderTitle({
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final Color colorBlanco = Colors.white.withValues(alpha: 0.7);
  final FaIconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80, width: double.infinity),
        Text(title, style: TextStyle(fontSize: 20, color: colorBlanco)),
        SizedBox(height: 20),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 25,
            color: colorBlanco,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        FaIcon(icon, size: 80, color: Colors.white),
      ],
    );
  }
}

class _IconHeaderTopLeft extends StatelessWidget {
  const _IconHeaderTopLeft({required this.icon});
  final FaIconData icon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: -70,
      child: FaIcon(
        icon,
        size: 250,
        color: Colors.white.withValues(alpha: 0.2),
      ),
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({required this.color1, required this.color2});
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[color1, color2],
        ),
      ),
    );
  }
}
