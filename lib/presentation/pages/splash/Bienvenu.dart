import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/CustomButtonBienvenu.dart';

class Bienvenu extends StatefulWidget {
  const Bienvenu({super.key});

  @override
  State<Bienvenu> createState() => _BienvenuState();
}

class _BienvenuState extends State<Bienvenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:
      Column(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                ),
                width: 800,
                height: 500,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logo/pharma.png",width: 60,height: 60,),
                        Row(
                          children: [
                            Text("PHARMA",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                            Text("GARDE",style: TextStyle(color: AppColors.secondary,fontSize: 30,fontWeight: FontWeight.bold),),
                          ],
                        )

                      ],
                    ),
                    Image.asset("assets/images/undraw_medicine_hqqg-removebg-preview.png")
                    
                  ],
                )
              ),
             
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Center(
                child: Text( "Cette application vous permet de consulter \n      les médicaments disponibles trouver\n               un médecin en temps réel.",style: TextStyle(color: AppColors.primary,fontSize: 15,fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: 80,),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                  child:
                  CustomButtonButton(
                    HautCustom: 283,
                    BasCustom: 66.65,
                  )
              )

            ]

          ),

        ],
      )
    );
  }
}
