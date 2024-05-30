import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';




 class Authorization extends StatefulWidget {
  final String verificationId;
  final TextEditingController phoneController;

  Authorization({super.key, required this.verificationId, required this.phoneController});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  bool _isLoading = false;
  void _verifyCode(BuildContext context, String smsCode) async {
    setState(() {
      _isLoading = true;
    });
    try {
      // Create the credential using the verification ID and the SMS code provided by the user
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );

      // Use the credential to sign in
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Successfully signed in
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully signed in!')),
      );

      // Navigate to the next screen or home page
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CalendarScreen(),), (route) => route.isFirst);
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP: $e')),
      );
    }
    setState(() {
      _isLoading = false ;
    });
  }

   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     final TextEditingController codeController = TextEditingController();
     return Scaffold(
       resizeToAvoidBottomInset: false,
       body: Container(
         color: backgroundColor1,
         child: Stack(
           children: [
             Align(
                 alignment: Alignment.bottomCenter,
                 child: Container(
                   height: size.height * 0.50,
                   width: size.width,
                   decoration: BoxDecoration(
                       borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(50),
                         topRight: Radius.circular(50),
                       ),
                       color: primaryColor,
                       image: const DecorationImage(
                           image: AssetImage("assets/images/otp.png"))
                   ),
                 )
             ),
             Stack(
               children: [ SafeArea(child: ListView(
                 children: [
                   SizedBox(height: size.height * 0.03),
                    Text(
                       "Enter the OTP",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 37,
                       color: textColor1,
                     ),
                   ),
                   SizedBox(height: size.height * 0.04),
                   Container(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 25,
                       vertical: 10,
                     ),
                     child: TextField(
                      controller: codeController,
                       textInputAction: TextInputAction.done,
                       maxLength: 6,
                       keyboardType: TextInputType.number,
                     ),
                   ),

                   SizedBox(height: size.height * 0.04),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25),
                       child: Column(
                         children: [
                           GestureDetector(
                             onTap: () {
                               _isLoading?null:
                               _verifyCode(context, codeController.text);
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
                                   "Verify OTP",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 25,
                                       color: Colors.black

                                   ),
                                 )


                             ),


                           )],

                       )

                   ),
                 ],
               )),
                 if (_isLoading)
                   Container(
                     color: Colors.black.withOpacity(0.5),
                     child: Center(
                       child: CircularProgressIndicator(),
                     ),
                   ),

               ],
             )
           ],

         ),
       ),

     );

   }


}