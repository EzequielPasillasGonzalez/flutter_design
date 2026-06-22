import 'package:flutter/material.dart';
import 'package:flutter_design/src/routes/routes.dart';
import 'package:flutter_design/src/themes/theme_changer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diseños en Flutter')),
      body: _ListaOpciones(),
      drawer: _MenuPrincipal(),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: appTheme.currentTheme.primaryColor,
                child: Text(
                  'CH',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
          ),

          Expanded(child: const _ListaOpciones()),

          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.lightbulb,
              color: appTheme.currentTheme.primaryColor,
            ),
            title: const Text('DarkMode'),
            trailing: Switch.adaptive(
              value: appTheme.darkTheme,
              onChanged: (value) => appTheme.darkTheme = value,
              activeThumbColor: appTheme.currentTheme.primaryColor,
            ),
          ),

          SafeArea(
            bottom: true,
            top: false,
            right: false,
            left: false,
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.themeisle,
                color: appTheme.currentTheme.primaryColor,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                onChanged: (value) => appTheme.customTheme = value,
                activeThumbColor: appTheme.currentTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>
          Divider(color: appTheme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.primaryColorLight,
        ),
        title: Text(pageRoutes[index].title),
        trailing: FaIcon(
          FontAwesomeIcons.arrowRight,
          color: appTheme.primaryColorLight,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[index].page),
          );
        },
      ),
    );
  }
}
