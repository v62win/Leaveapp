import 'dart:async';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'prelogin_page.dart';
 

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const Firstscreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: primaryColor,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Column(
               children: [
                 Image.asset("assets/images/logo.png",
                   height: 150,
                     width: 150,
                 ),
               ],
             ),
             const CircularProgressIndicator(
               valueColor: AlwaysStoppedAnimation(Colors.white),

             )
           ],
         ),
        
      ),
    );

  }
}











