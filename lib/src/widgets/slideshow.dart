import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    super.key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.redAccent,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  });

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SlideshowModel()
        .._colorPrimario = colorPrimario
        .._colorSecundario = colorSecundario
        .._bulletPrimario = bulletPrimario
        .._bulletSecundario = bulletSecundario,
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (puntosArriba) _Dots(dots: slides.length),
              Expanded(child: _Slides(slides)),
              if (!puntosArriba) _Dots(dots: slides.length),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.dots});
  final int dots;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(dots, (index) => _Dot(index: index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({required this.index});

  @override
  Widget build(BuildContext context) {
    final slideshowModel = context.watch<_SlideshowModel>();

    final bool isSelected =
        (slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5);

    final double size = isSelected
        ? slideshowModel.bulletPrimario
        : slideshowModel.bulletSecundario;

    final Color color = isSelected
        ? slideshowModel.colorPrimario
        : slideshowModel.colorSecundario;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: size,
      width: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.redAccent;
  Color _colorSecundario = Colors.grey;

  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;

    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color) {
    _colorPrimario = color;
    notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario(Color color) {
    _colorSecundario = color;
    notifyListeners();
  }

  double get bulletPrimario => _bulletPrimario;

  set bulletPrimario(double bullet) {
    _bulletPrimario = bullet;
    notifyListeners();
  }

  double get bulletSecundario => _bulletSecundario;

  set bulletSecundario(double bullet) {
    _bulletSecundario = bullet;
    notifyListeners();
  }
}
