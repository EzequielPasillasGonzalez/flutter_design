import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.icon,
    required this.title,
    this.color1 = Colors.purple,
    this.color2 = Colors.purpleAccent,
    required this.onPress,
  });

  final FaIconData icon;
  final String title;
  final Color color1;
  final Color color2;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _ButtonBackground(color1: color1, color2: color2, icon: icon),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(icon, size: 40, color: Colors.white),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonBackground extends StatelessWidget {
  const _ButtonBackground({
    required this.color1,
    required this.color2,
    required this.icon,
  });
  final Color color1;
  final Color color2;
  final FaIconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [color1, color2]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
