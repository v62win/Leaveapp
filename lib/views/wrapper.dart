import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'prelogin_page.dart';
import 'dashboard.dart';

class authwrapper extends StatelessWidget {
  const authwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return const CalendarScreen();
        }
        return const Firstscreen();
      },
    );
  }
}

