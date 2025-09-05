import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/AppbarPharma.dart';
import '../../widgets/EmergencyCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body:
        Padding(padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Service", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.primary),),
                    Text("Trouver l'urgence les pharmacies de garde", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.secondary),)
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EmergencyCard(),
                    EmergencyCard(),
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EmergencyCard(),
                    EmergencyCard()
                  ],
                )
              ],
            )
          ],
        )
          ,)

    );
  }
}
