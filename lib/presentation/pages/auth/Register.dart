import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/AppbarPharma.dart';
import '../../widgets/CustomButtonBienvenu.dart';
import '../../widgets/CustomButtonNorm.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: AppbarPharma(),
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor:  AppColors.primary,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 800,
            height: 700,
            decoration:BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("Register", style: TextStyle(color: AppColors.primary,fontSize: 25,fontWeight: FontWeight.bold),),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person,color: AppColors.primary,),
                    hintText: 'Votre nom',
                    labelText: 'Nom',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {

                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person,color: AppColors.primary,),
                    hintText: 'Votre prenom',
                    labelText: 'Prenom',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {

                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone,color: AppColors.primary,),
                    hintText: 'Quel est votre numero?',
                    labelText: 'Numero',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },

                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password,color: AppColors.primary,),
                    labelText: 'Mot de passe',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {

                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person,color: AppColors.primary,),

                    labelText: 'Confirmer',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                  },
                ),
                SizedBox(height: 50,),
                Custombuttonnorm(),




              ],
            ),
          ),


        ],
      ),
    );
  }
}
