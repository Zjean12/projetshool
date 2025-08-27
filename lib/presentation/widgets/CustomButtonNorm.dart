import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomButtonNorm extends StatefulWidget {
  final String text;
  final Future<void> Function()? onPressed; // 👈 support async

  const CustomButtonNorm({
    super.key,
    this.text = "Inscription",
    this.onPressed,
  });

  @override
  State<CustomButtonNorm> createState() => _CustomButtonNormState();
}

class _CustomButtonNormState extends State<CustomButtonNorm> {
  bool isLoading = false;

  void _handlePress() async {
    if (widget.onPressed == null) return;

    setState(() => isLoading = true);

    try {
      await widget.onPressed!(); // exécution de l’action
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : _handlePress, // désactivé si chargement
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.background,
              ),
            ),
          )
              : Text(
            widget.text,
            style: TextStyle(
              color: AppColors.background,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
