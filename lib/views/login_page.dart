import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leavemanager/views/auth.dart';
import 'colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _contactcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;


  void clicklogin() {
    setState(() {
      _isLoading = true;
    });
    _auth.verifyPhoneNumber(
      phoneNumber: '+91 ${_contactcontroller.text}',
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _onCodeSent,
      codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
    );
  }

  void _onVerificationCompleted(PhoneAuthCredential credential) {
    // This callback is called when the OTP has been automatically verified.
    // You can sign in the user directly using the credential.
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    // Handle verification failure here
    print('Verification failed: ${e.message}');
  }

  void _onCodeSent(String verificationId, int? resendToken) {
    // Verification code sent, ask the user to enter the code
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Authorization(
          verificationId: verificationId,
          phoneController: _contactcontroller,
        )

        ),
      );
  }

  void _onCodeAutoRetrievalTimeout(String verificationId) {
    // Timeout reached while waiting for the OTP
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Container(
        color: backgroundColor1,
        child: Stack(
          children:[
          Align(
           alignment:Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.47,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
                ),
                color: primaryColor,
                image: const DecorationImage(
                  image: AssetImage("assets/images/loo.png"),
                )

            ),
          ),
        ),
             Stack(
            children:[ SafeArea(
                child: ListView(
                  children: [
                    SizedBox(height: size.height * 0.03),
                    Text(
                      "Hello Again!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 37,
                        color: textColor1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Wellcome back you've\nbeen missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 27, color: textColor2, height: 1.2),
                    ),

                    SizedBox(height: size.height * 0.04),
                    // for username and password
                    myTextField("Enter Phone number", Colors.white),
                    SizedBox(height: size.height * 0.04),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _isLoading?null:
                                clicklogin();
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
                                    "Request Otp",
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
                )
            ),
              if (_isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

            ]
             )]),
        )

      );
  }

  Container myTextField(String hint, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        controller: _contactcontroller,
        keyboardType: TextInputType.phone,
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 22,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 19,
            ),
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: color,
            )),
      ),
    );
  }

}


