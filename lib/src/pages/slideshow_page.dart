import 'package:flutter/material.dart';
import 'package:flutter_design/src/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        puntosArriba: true,
        colorPrimario: Colors.amber,
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          const Center(child: Text('Holi')),
          Container(width: 200, height: 200, color: Colors.redAccent),
        ],
      ),
    );
  }
}
