import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingNavigationBarButton {
  final VoidCallback onPressed;
  final IconData icon;

  FloatingNavigationBarButton({required this.onPressed, required this.icon});
}

class FloatingNavigationBar extends StatelessWidget {
  FloatingNavigationBar({super.key, this.show = true});

  final bool show;

  final List<FloatingNavigationBarButton> items = [
    FloatingNavigationBarButton(
      onPressed: () {
        debugPrint('Icons.pie_chart_outline');
      },
      icon: Icons.pie_chart_outline,
    ),
    FloatingNavigationBarButton(
      onPressed: () {
        debugPrint('Icons.call');
      },
      icon: Icons.call,
    ),

    FloatingNavigationBarButton(
      onPressed: () {
        debugPrint('Icons.notification_add');
      },
      icon: Icons.notification_add,
    ),
    FloatingNavigationBarButton(
      onPressed: () {
        debugPrint('Icons.no_meals');
      },
      icon: Icons.no_meals,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('$show');
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: show ? 1 : 0,
        child: _MenuBackground(child: _MenuItems(menuItems: items)),
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  const _MenuBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({required this.menuItems});

  final List<FloatingNavigationBarButton> menuItems;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _MenuItem(index: index, item: menuItems[index]),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.index, required this.item});

  final int index;
  final FloatingNavigationBarButton item;

  @override
  Widget build(BuildContext context) {
    final int itemSeleccionado = Provider.of<_MenuModel>(
      context,
    ).itemSeleccionado;

    final bool isSeleccionado = (itemSeleccionado == index);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: isSeleccionado ? 30 : 25,
        color: isSeleccionado ? Colors.black : Colors.blueGrey,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
