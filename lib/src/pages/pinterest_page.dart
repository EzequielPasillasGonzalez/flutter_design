import 'package:flutter/material.dart';
import 'package:flutter_design/src/widgets/floating_navigation_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _PinterestGrid()),
      bottomNavigationBar: FloatingNavigationBar(),
    );
  }
}

class _PinterestGrid extends StatelessWidget {
  _PinterestGrid();

  final List<int> items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,

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
