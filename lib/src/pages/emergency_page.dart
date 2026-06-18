import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/src/widgets/button.dart';
import 'package:flutter_design/src/widgets/headers_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final FaIconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  EmergencyPage({super.key});

  final items = <ItemBoton>[
    ItemBoton(
      FontAwesomeIcons.carBurst,
      'Motor Accident',
      Color(0xff6989F5),
      Color(0xff906EF5),
    ),
    ItemBoton(
      FontAwesomeIcons.plus,
      'Medical Emergency',
      Color(0xff66A9F2),
      Color(0xff536CF6),
    ),
    ItemBoton(
      FontAwesomeIcons.masksTheater,
      'Theft / Harrasement',
      Color(0xffF2D572),
      Color(0xffE06AA3),
    ),
    ItemBoton(
      FontAwesomeIcons.personBiking,
      'Awards',
      Color(0xff317183),
      Color(0xff46997D),
    ),
    ItemBoton(
      FontAwesomeIcons.carBurst,
      'Motor Accident',
      Color(0xff6989F5),
      Color(0xff906EF5),
    ),
    ItemBoton(
      FontAwesomeIcons.plus,
      'Medical Emergency',
      Color(0xff66A9F2),
      Color(0xff536CF6),
    ),
    ItemBoton(
      FontAwesomeIcons.masksTheater,
      'Theft / Harrasement',
      Color(0xffF2D572),
      Color(0xffE06AA3),
    ),
    ItemBoton(
      FontAwesomeIcons.personBiking,
      'Awards',
      Color(0xff317183),
      Color(0xff46997D),
    ),
    ItemBoton(
      FontAwesomeIcons.carBurst,
      'Motor Accident',
      Color(0xff6989F5),
      Color(0xff906EF5),
    ),
    ItemBoton(
      FontAwesomeIcons.plus,
      'Medical Emergency',
      Color(0xff66A9F2),
      Color(0xff536CF6),
    ),
    ItemBoton(
      FontAwesomeIcons.masksTheater,
      'Theft / Harrasement',
      Color(0xffF2D572),
      Color(0xffE06AA3),
    ),
    ItemBoton(
      FontAwesomeIcons.personBiking,
      'Awards',
      Color(0xff317183),
      Color(0xff46997D),
    ),
  ];

  late final List<Widget> itemMap = items
      .map(
        (e) => FadeInLeft(
          duration: const Duration(milliseconds: 250),
          child: Button(
            icon: e.icon,
            onPress: () {},
            title: e.texto,
            color1: e.color1,
            color2: e.color1,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Buttons(itemMap: itemMap),
          _PageHeader(),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({required this.itemMap});

  final List<Widget> itemMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [SizedBox(height: 80), ...itemMap],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          subTitle: 'Asistencia Médica',
          title: 'Haz solicitado',
          color1: Color(0xff526bf6),
          color2: Color(0xff67acf2),
        ),

        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsetsGeometry.all(15),
            child: FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
