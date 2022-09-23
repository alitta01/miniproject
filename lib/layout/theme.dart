import 'dart:ui';
import 'package:flutter/material.dart';

class AppColours {
  const AppColours();

  static const Color colorStart = const Color(0xFF80CBC4);
  static const Color colorEnd = const Color(0xFF00695C);

  static const buttonGradient = const LinearGradient(
    colors: const [colorStart, colorEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}