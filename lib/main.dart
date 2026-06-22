import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_design/src/pages/launcher_page.dart';
import 'package:flutter_design/src/themes/theme_changer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(1),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
    );
  }
}
