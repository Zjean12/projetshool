import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppbarPharma extends StatefulWidget {
  const AppbarPharma({super.key});

  @override
  State<AppbarPharma> createState() => _AppbarPharmaState();
}

class _AppbarPharmaState extends State<AppbarPharma> {
  @override
  Widget build(BuildContext context) {
    return  Row(
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
    );
  }
}
