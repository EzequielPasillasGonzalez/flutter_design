import 'package:flutter/material.dart';
import 'package:flutter_design/src/widgets/button.dart';
import 'package:flutter_design/src/widgets/headers_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button(
          icon: FontAwesomeIcons.carBurst,
          onPress: () {},
          title: 'Motor Accident',
          color1: Color(0xff6989f5),
          color2: Color(0xff906ef5),
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subTitle: 'Asistencia Médica',
      title: 'Haz solicitado',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
