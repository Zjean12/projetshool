import 'package:flutter/material.dart';

class WelcomeConstants {
  static const Duration entryDelay = Duration(milliseconds: 300);
  static const Duration logoDelay = Duration(milliseconds: 500);
  static const Duration textDelay = Duration(milliseconds: 700);

  static const Duration mainAnimationDuration = Duration(milliseconds: 800);
  static const Duration logoAnimationDuration = Duration(milliseconds: 1200);
  static const Duration textAnimationDuration = Duration(milliseconds: 800);
  static const Duration buttonAnimationDuration = Duration(milliseconds: 600);

  static const double initialLogoScale = 0.5;
  static const double initialButtonScale = 0.8;

  static const List<double> gradientStops = [0.0, 0.7, 1.0];
  static const BorderRadius containerBorderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50)
  );
}