import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'welcome_constants.dart';

class WelcomeAnimations {
  final AnimationController mainController;
  final AnimationController logoController;
  final AnimationController textController;
  final AnimationController buttonController;

  late Animation<double> mainAnimation;
  late Animation<double> logoScaleAnimation;
  late Animation<double> logoRotationAnimation;
  late Animation<Offset> textSlideAnimation;
  late Animation<double> textFadeAnimation;
  late Animation<double> buttonScaleAnimation;
  late Animation<double> buttonFadeAnimation;

  WelcomeAnimations(TickerProvider vsync)
      : mainController = AnimationController(
    duration: WelcomeConstants.mainAnimationDuration,
    vsync: vsync,
  ),
        logoController = AnimationController(
          duration: WelcomeConstants.logoAnimationDuration,
          vsync: vsync,
        ),
        textController = AnimationController(
          duration: WelcomeConstants.textAnimationDuration,
          vsync: vsync,
        ),
        buttonController = AnimationController(
          duration: WelcomeConstants.buttonAnimationDuration,
          vsync: vsync,
        ) {
    _setupAnimations();
  }

  void _setupAnimations() {
    mainAnimation = CurvedAnimation(
      parent: mainController,
      curve: Curves.easeInOut,
    );

    logoScaleAnimation = Tween<double>(
      begin: WelcomeConstants.initialLogoScale,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: logoController,
      curve: Curves.elasticOut,
    ));

    logoRotationAnimation = CurvedAnimation(
      parent: logoController,
      curve: Curves.easeInOut,
    );

    textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: textController,
      curve: Curves.easeOutBack,
    ));

    textFadeAnimation = CurvedAnimation(
      parent: textController,
      curve: Curves.easeIn,
    );

    buttonScaleAnimation = Tween<double>(
      begin: WelcomeConstants.initialButtonScale,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: buttonController,
      curve: Curves.elasticOut,
    ));

    buttonFadeAnimation = CurvedAnimation(
      parent: buttonController,
      curve: Curves.easeIn,
    );
  }

  void dispose() {
    mainController.dispose();
    logoController.dispose();
    textController.dispose();
    buttonController.dispose();
  }
}