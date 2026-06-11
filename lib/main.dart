import 'package:flutter/material.dart';
import 'package:flutter_design/src/pages/animation_pages.dart';
// import 'package:flutter_design/src/pages/headers_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: AnimationPages(),
    );
  }
}
