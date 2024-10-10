import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 95,height: 86,),
            SizedBox(height: 12),
            Text('DailySync',style: TextStyle(color: Colors.white,fontSize: 40,fontFamily:'Lato',fontWeight: FontWeight.w500,),),
          ],
          ),
        ),
    );
  }
}
