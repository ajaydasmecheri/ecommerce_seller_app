import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easybuyseller/screens/homepage.dart';
import 'package:easybuyseller/screens/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splashIconSize: 1000,
          duration: 3600,
          splash: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                  child: LottieBuilder.asset(
                    'assets/images/Animation - 1714113547914.json',
                    height: 250,
                    width: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                const Text(
                  "EsayBuy-seller",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          pageTransitionType: PageTransitionType.fade,
          nextScreen: FirebaseAuth.instance.currentUser?.email==null ? const Loginpage() : const Homepage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}