import 'package:flutter/material.dart';
import 'colors.dart';
import 'login_page.dart';
import 'package:animations/animations.dart';

class Firstscreen extends StatelessWidget{
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: backgroundColor1,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: primaryColor,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/final.png"),
                  )

                ),
              ),
            ),
        Positioned(
          top: size.height * 0.6,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              children: [
                Text(
                  "Manage your\nleaves and events",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: textColor2,
                    height: 1.2,
                  ),
                ),

                Text(
                  "Effortlessly handle your employees \n leaves with user-friendly tools",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColor1,
                    height: 1,
                  ),
                ),

                SizedBox(height: size.height * 0.04,),
                Padding(padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
               child: Column(
                 children: [OpenContainer(
                   transitionType: ContainerTransitionType.fade,
                   transitionDuration: const Duration(seconds: 1),
                   openBuilder: (context, _) => const SignIn(),
                   closedElevation: 0,
                   closedShape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(32),
                       side: const BorderSide(color: Colors.white, width: 1)),
                   closedColor: primaryColor,
                   closedBuilder: (context, _) => Container(
                     alignment: Alignment.center,
                     width: size.width * 0.8,
                     child: const Padding(
                       padding: EdgeInsets.all(8),
                         child: Text(
                           "Get started",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 25,
                               color: Colors.black

                           ),
                         )
                     ),
                   ),
                 )

                   /*GestureDetector(
                     onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                     },
               child: Container(
               width: size.width * 0.5,
                 padding: const EdgeInsets.symmetric(vertical: 20),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   color: primaryColor,
                   border: Border.all(
                     color: Colors.white,
                   ),

                 ),
                   child: const Text(
                     "Get started",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 25,
                         color: Colors.black

                     ),
                   )


                 ),


               )*/
                 ],

               )




                  ),
                ]),
                ),


        )],
            ),
          ),
        );

  }

}