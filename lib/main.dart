import 'package:auth/services/auth.dart';
import 'package:auth/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auth/model/auth_user.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      catchError: (_,__){},
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        home:Wrapper()
      ),
    );
  }
}