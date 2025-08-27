import 'package:flutter/material.dart';
import 'package:pharma/presentation/pages/welcome/welcome_screen.dart';

import 'auth/Register.dart';
import 'auth/Login.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Bienvenu());

      case '/register':
        return SlideUpPageRoute(
          child: const Register(),
          duration: const Duration(milliseconds: 400), // Plus rapide pour synchroniser
        );

      case '/login':
        return SlideUpPageRoute(
          child: const Login(),
          duration: const Duration(milliseconds: 400),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page non trouvée ❌'),
            ),
          ),
        );
    }
  }
}

// Route personnalisée avec animation de transition
class SlideUpPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Duration duration;

  SlideUpPageRoute({
    required this.child,
    this.duration = const Duration(milliseconds: 600),
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Animation de glissement vers le haut
      var slideAnimation = Tween<Offset>(
        begin: const Offset(0.0, 1.0), // Commence en bas de l'écran
        end: Offset.zero, // Se termine à la position normale
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));

      // Animation de fade
      var fadeAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ));

      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: child,
          ),
        ),
      );
    },
  );
}