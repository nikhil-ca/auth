import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AuthService().signOut();
        },
        child: const Icon(
          Icons.logout
        ),
      ),
    );
  }
}
