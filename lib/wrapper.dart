import 'package:auth/model/auth_user.dart';
import 'package:auth/screens/authenticate/authenticate.dart';
import 'package:auth/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser?>(context);
    bool isUserLoggedIn = user != null;
    if(isUserLoggedIn){
      return const Home();
    }else{
      return const Authenticate();
    }
  }
}

