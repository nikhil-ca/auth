import 'package:auth/model/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser?>(context);
    bool userLoggedIn = user != null;
    if(userLoggedIn){
      return Container();
    }else{
      return Container();
    }
  }
}

