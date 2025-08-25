import 'package:flutter/material.dart';
import 'package:pharma/presentation/pages/splash/Bienvenu.dart';

import 'auth/Register.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Bienvenu());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Register());
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
