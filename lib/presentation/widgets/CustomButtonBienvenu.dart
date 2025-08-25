import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma/core/constants/app_colors.dart';

class CustomButtonButton extends StatelessWidget {
  final double? HautCustom;
  final double? BasCustom;
  const CustomButtonButton({super.key ,  required this.HautCustom,  required this.BasCustom});


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: HautCustom,
      height: BasCustom,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 40,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 283,
              height: 66.65,
              decoration: ShapeDecoration(
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            left: 56,
            top: 18.35,
            child: SizedBox(
              width: 171,
              height: 66.65,
              child: Text(
                ' COMMENCER',
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
