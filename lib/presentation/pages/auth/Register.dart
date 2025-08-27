import 'package:flutter/material.dart';
import 'package:pharma/presentation/widgets/Champdetexte.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/AppbarPharma.dart';
import '../../widgets/CustomButtonNorm.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // Controllers pour récupérer les valeurs saisies
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Démarre les animations après un petit délai
    Future.delayed(const Duration(milliseconds: 200), () {
      _fadeController.forward();
      _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    nameController.dispose();
    firstnameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // AppBar personnalisée avec logo
          Positioned(
            top: 50,
            left: 0,
            right: 10,
            child: const AppbarPharma(logoSize: 30, textSize: 20),
          ),

          // Formulaire animé
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, 50 * (1 - _fadeAnimation.value)),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.85,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              Padding(padding: EdgeInsets.only(right: 20),child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Icon(
                                      Icons.app_registration_rounded,
                                      color: AppColors.primary,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "INSCRIPTION",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              ),
                              const SizedBox(height: 40),

                              // Champs avec Champdetexte
                              Champdetexte(
                                icon: Icons.person,
                                hintText: 'Votre nom',
                                labelText: 'Nom',
                                controller: nameController,
                              ),
                              const SizedBox(height: 5),

                              Champdetexte(
                                icon: Icons.person_outline,
                                hintText: 'Votre prénom',
                                labelText: 'Prénom',
                                controller: firstnameController,
                              ),
                              const SizedBox(height: 5),

                              Champdetexte(
                                icon: Icons.phone,
                                hintText: 'Quel est votre numéro?',
                                labelText: 'Numéro',
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                              ),
                              const SizedBox(height: 5),

                              Champdetexte(
                                icon: Icons.lock,
                                labelText: 'Mot de passe',
                                obscureText: true,
                                controller: passwordController,
                              ),
                              const SizedBox(height: 5),

                              Champdetexte(
                                icon: Icons.lock_outline,
                                labelText: 'Confirmer le mot de passe',
                                obscureText: true,
                                controller: confirmPasswordController,
                              ),
                              const SizedBox(height: 50),

                              CustomButtonNorm(
                                text: "S'inscrire",
                                onPressed: () async {
                                  await Future.delayed(const Duration(seconds: 2)); // simulation API
                                  print("Inscription réussie ✅");
                                },
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Vous avez déjà un compte ?"),
                                  TextButton(onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  }, child: Text("CONNEXION", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16),),)
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
