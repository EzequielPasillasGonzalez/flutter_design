import 'package:flutter/material.dart';
import 'package:flutter_design/src/models/layout_model.dart';
import 'package:flutter_design/src/pages/launcher_tablet_page.dart';
import 'package:provider/provider.dart';

import 'package:flutter_design/src/pages/launcher_page.dart';
import 'package:flutter_design/src/themes/theme_changer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
        ChangeNotifierProvider(create: (_) => LayoutModel()),
      ],

      child: const MainApp(),
    ),
  );
}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => ThemeChanger(2),
//       child: const MainApp(),
//     ),
//   );
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (context, orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPhonePage();
          }
        },
      ),
    );
  }
}
