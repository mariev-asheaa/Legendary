import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

import '../../../constants.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children:[  TypeWriter.text(
          'Discover the Legends !',
          maintainSize: true,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3.5
                ..color = Colors.black
          ),
          duration: const Duration(milliseconds: 40),
        ),
          TypeWriter.text(
            maintainSize: true,
            textAlign: TextAlign.center,
            'Discover the Legends !',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 45,
              color:ksecondary,
            ), duration:  const Duration(milliseconds: 40),
          ),]
    );
  }
}
