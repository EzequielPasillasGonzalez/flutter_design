import 'package:flutter/material.dart';
import 'package:flutter_design/src/pages/emergency_page.dart';
// import 'package:flutter_design/src/pages/pinterest_page.dart';
// import 'package:flutter_design/src/labs/slideshow_page.dart';
// import 'package:flutter_design/src/pages/graficas_circulares_page.dart';
// import 'package:flutter_design/src/pages/animation_pages.dart';
// import 'package:flutter_design/src/retos/square_animate_page.dart';
// import 'package:flutter_design/src/pages/headers_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: EmergencyPage(),
    );
  }
}
