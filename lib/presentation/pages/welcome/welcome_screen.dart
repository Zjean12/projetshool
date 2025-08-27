import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:gif/gif.dart';
import '../../../core/constants/app_colors.dart';
import 'welcome_animations.dart';
import 'welcome_widgets.dart';
import 'welcome_constants.dart';

class Bienvenu extends StatefulWidget {
  const Bienvenu({super.key});

  @override
  State<Bienvenu> createState() => _BienvenuState();
}

class _BienvenuState extends State<Bienvenu> with TickerProviderStateMixin {
  late WelcomeAnimations _animations;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animations = WelcomeAnimations(this);
    _startEntryAnimations();
  }

  void _startEntryAnimations() async {
    await Future.delayed(WelcomeConstants.entryDelay);
    _animations.logoController.forward();

    await Future.delayed(WelcomeConstants.logoDelay);
    _animations.textController.forward();

    await Future.delayed(WelcomeConstants.textDelay);
    _animations.buttonController.forward();
  }

  @override
  void dispose() {
    _animations.dispose();
    super.dispose();
  }

  void _startTransition() {
    setState(() {
      _isAnimating = true;
    });

    _animations.mainController.forward().then((_) {
      Navigator.pushNamed(context, '/register');

      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _animations.mainController.reset();
          setState(() {
            _isAnimating = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          BackgroundGradient(),
          DecorativeCircles(),

          Column(
            children: [
              // Section principale avec logo
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withOpacity(0.9),
                      AppColors.primary.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: WelcomeConstants.containerBorderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 520,
                child: Stack(
                  children: [
                    // Motifs décoratifs
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 30,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    // Contenu principal
                    Column(
                      children: [
                        const SizedBox(height: 60),

                        // Logo avec animation
                        AnimatedBuilder(
                          animation: _animations.logoController,
                          builder: (context, child) {
                            return AnimatedLogo(
                              scaleAnimation: _animations.logoScaleAnimation,
                              rotationAnimation: _animations.logoRotationAnimation,
                            );
                          },
                        ),

                        const SizedBox(height: 40),
                        MainImage(),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // Section texte avec animation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AnimatedBuilder(
                  animation: _animations.textController,
                  builder: (context, child) {
                    return AnimatedTextSection(
                      slideAnimation: _animations.textSlideAnimation,
                      fadeAnimation: _animations.textFadeAnimation,
                    );
                  },
                ),
              ),

              const SizedBox(height: 16.28),

              // Bouton avec animation
              AnimatedBuilder(
                animation: _animations.buttonController,
                builder: (context, child) {
                  return AnimatedButton(
                    scaleAnimation: _animations.buttonScaleAnimation,
                    fadeAnimation: _animations.buttonFadeAnimation,
                    onTap: _startTransition,
                  );
                },
              ),

              const SizedBox(height: 40),
            ],
          ),

          // Overlay d'animation - transition améliorée
          AnimatedBuilder(
            animation: _animations.mainAnimation,
            builder: (context, child) {
              if (!_isAnimating) return const SizedBox.shrink();

              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      _animations.mainAnimation.value * 0.85,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.background.withOpacity(0.9),
                        AppColors.background,
                        AppColors.background,
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkText.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, -10),
                      ),
                    ],
                  ),
                  child: _animations.mainAnimation.value > 0.5
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo/pharmacy.png",
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Préparation en cours...",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: 100,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: _animations.mainAnimation.value,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.secondary,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}