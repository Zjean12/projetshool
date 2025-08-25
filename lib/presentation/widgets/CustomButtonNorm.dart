import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class Custombuttonnorm extends StatefulWidget {
  const Custombuttonnorm({super.key});

  @override
  State<Custombuttonnorm> createState() => _CustombuttonnormState();
}

class _CustombuttonnormState extends State<Custombuttonnorm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50), bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
      ),

      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Inscription",style: TextStyle(color: AppColors.background,fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      )

    );
  }
}
