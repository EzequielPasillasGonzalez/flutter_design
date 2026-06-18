import 'package:flutter/material.dart';
import 'package:flutter_design/src/widgets/floating_navigation_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        // body: Center(child: _PinterestGrid()),
        // bottomNavigationBar: FloatingNavigationBar(),
        body: SafeArea(
          child: Stack(children: [_PinterestGrid(), _MenuLocation()]),
        ),
      ),
    );
  }
}

class _MenuLocation extends StatelessWidget {
  const _MenuLocation();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool show = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenSize.width,
        child: Align(child: FloatingNavigationBar(show: show)),
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  const _PinterestGrid();

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  final ScrollController scrollController = ScrollController();

  double scrollAnterior = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > scrollAnterior) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      controller: scrollController,
      itemBuilder: (context, index) => _PinteresItem(index: index),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        pattern: [
          WovenGridTile(1),
          WovenGridTile(
            1,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
    );
  }
}

class _PinteresItem extends StatelessWidget {
  const _PinteresItem({
    required this.index,
    this.extent,
    this.backgroundColor = const Color(0xFF34568B),
    this.bottomSpace,
  });

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      height: extent,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: backgroundColor,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(height: bottomSpace, color: Colors.green),
      ],
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool value) {
    _mostrar = value;
    notifyListeners();
  }
}
