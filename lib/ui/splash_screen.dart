import 'package:dailysync/ui/intro_page.dart';
import 'package:dailysync/ui/noInternet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _checkConnectionAndNavigate(BuildContext context) async {
    // Wait for 2 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check the connectivity status
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // If connected to mobile or wifi, navigate to the next page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OnboardingScreen()));
    } else {
      // If not connected, navigate to the no internet page
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NoConnection()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OnboardingScreen()));
    }
  }

  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkConnectionAndNavigate(context);
    });
    return Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 95,height: 86,),
            SizedBox(height: 12),
            Text('کارنامه',style: TextStyle(color: Colors.white,fontSize: 40,fontFamily:'Vazir',fontWeight: FontWeight.w500,),),
          ],
          ),
        ),
    );
  }
}
