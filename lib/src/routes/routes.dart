import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_design/src/pages/animation_pages.dart';
import 'package:flutter_design/src/pages/emergency_page.dart';
import 'package:flutter_design/src/pages/graficas_circulares_page.dart';
import 'package:flutter_design/src/pages/headers_page.dart';
import 'package:flutter_design/src/pages/pinterest_page.dart';
import 'package:flutter_design/src/pages/slider_list_page.dart';
import 'package:flutter_design/src/pages/slideshow_page.dart';

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    title: 'Slideshow',
    page: SlideshowPage(),
  ),

  _Route(
    icon: FontAwesomeIcons.truckMedical,
    title: 'Emergencia',
    page: EmergencyPage(),
  ),

  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Encabezados',
    page: HeadersPage(),
  ),

  _Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    title: 'Cuadro Animado',
    page: CuadradoAnimado(),
  ),

  _Route(
    icon: FontAwesomeIcons.circleNotch,
    title: 'Barra Progreso',
    page: GraficasCircularesPage(),
  ),

  _Route(
    icon: FontAwesomeIcons.pinterest,
    title: 'Pinteres',
    page: PinterestPage(),
  ),

  _Route(
    icon: FontAwesomeIcons.mobile,
    title: 'Sliders',
    page: SliderListPage(),
  ),
];

class _Route {
  final FaIconData icon;
  final String title;
  final Widget page;

  _Route({required this.icon, required this.title, required this.page});
}
