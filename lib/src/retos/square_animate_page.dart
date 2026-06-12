import 'package:flutter/material.dart';

class CuadradoanimadoPage extends StatelessWidget {
  const CuadradoanimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _CuadradoAnimado()));
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado();

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverIzquierda;
  late Animation<double> moverArriba;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        // Inicia en el porcentaje 0% y termina al 25% del tiempo total
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        // Inicia justo cuando el otro termina (del 25% al 50%)
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut),
      ),
    );

    moverIzquierda = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        // Inicia justo cuando el otro termina (del 50% al 75%)
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut),
      ),
    );

    moverAbajo = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        // Inicia justo cuando el otro termina (del 75% al 100%)
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            moverDerecha.value - moverIzquierda.value,
            moverArriba.value - moverAbajo.value,
          ),

          child: child,
        );
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
