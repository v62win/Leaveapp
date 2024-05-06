import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final user = FirebaseAuth.instance.currentUser;

  signout()async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: AnimationLimiter(
          child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(seconds: 1),
          child: SlideAnimation(
            verticalOffset: 44.0,
            child: FadeInAnimation(
              child: Card(
                child: ListTile(
                  title: Text('$index item'),
                ),
              ),
            ),
          ),
        );
      },
    ),
    ),
    ),
    );

  }
}
