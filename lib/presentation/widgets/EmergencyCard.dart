import 'package:flutter/material.dart';

class EmergencyCard extends StatelessWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final String? ImageTR;
  final String? textTR;

  const EmergencyCard({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.ImageTR,
    this.textTR,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 150,
        height: height ?? 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône croix médicale
            Container(
              width: 50,
              height: 50,
              /*decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),*/
              child: Center(
                child: Image.asset(
                  ImageTR ?? 'assets/images/emergency.png',
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Texte Emergency
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              /*decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),*/
              child:  Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  textTR ?? "Emergency",
                  style: TextStyle(

                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
