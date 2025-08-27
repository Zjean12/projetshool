import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppbarPharma extends StatefulWidget {
  final double logoSize; // 👈 taille personnalisable
  final double textSize; // 👈 taille du texte

  const AppbarPharma({
    super.key,
    this.logoSize = 50, // 👈 valeur par défaut
    this.textSize = 20, // 👈 valeur par défaut
  });

  @override
  State<AppbarPharma> createState() => _AppbarPharmaState();
}

class _AppbarPharmaState extends State<AppbarPharma> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(
            "assets/logo/pharma.png",
            width: widget.logoSize,  // 👈 utilisation du paramètre
            height: widget.logoSize, // 👈 utilisation du paramètre
          ),
        ),
        const SizedBox(width: 15),
        Column(
          children: [
            Row(
              children: [
                Text(
                  "PHARMA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.textSize, // 👈 utilisation du paramètre,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                Text(
                  "GARDE",
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: widget.textSize,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 3,
              width: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    AppColors.secondary,
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
