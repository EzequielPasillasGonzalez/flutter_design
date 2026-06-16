import 'package:flutter/material.dart';
import 'package:flutter_design/src/models/slider_model.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    super.key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.redAccent,
    this.colorSecundario = Colors.grey,
  });

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (puntosArriba)
                _Dots(
                  dots: slides.length,
                  colorPrimario: colorPrimario,
                  colorSecundario: colorSecundario,
                ),
              Expanded(child: _Slides(slides)),
              if (!puntosArriba)
                _Dots(
                  dots: slides.length,
                  colorPrimario: colorPrimario,
                  colorSecundario: colorSecundario,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    required this.dots,
    required this.colorPrimario,
    required this.colorSecundario,
  });
  final int dots;
  final Color colorPrimario;
  final Color colorSecundario;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          dots,
          (index) => _Dot(
            index: index,
            colorPrimario: colorPrimario,
            colorSecundario: colorSecundario,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dot({
    required this.index,
    required this.colorPrimario,
    required this.colorSecundario,
  });

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 12,
      width: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? colorPrimario
            : colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      // children: [
      //   _Slide(svg: 'assets/svgs/slide-1.svg'),
      //   _Slide(svg: 'assets/svgs/slide-2.svg'),
      //   _Slide(svg: 'assets/svgs/slide-3.svg'),
      // ],
      children: widget.slides.map((e) => _Slide(slide: e)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({required this.slide});

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
