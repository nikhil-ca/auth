
import 'package:flutter/material.dart';
import 'package:auth/services/auth.dart';
import 'package:auth/shared/constants.dart';
import 'package:auth/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  const Register({Key? key,required this.toggleView}): super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  //Text states:
  String userName = '';
  String email = '';
  String password = '';

  //Form key
  final _formKey = GlobalKey<FormState>();

  //error
  String error = '';

  //loading
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB( 50,50,50,0),
          child: Form(
              key:_formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'user name'
                          ,border: InputBorder.none),
                      onChanged: (val) {
                        setState(() => userName = val);
                      },
                      validator: (val) => val!.isEmpty ? 'enter an User Name' : null,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      style: const TextStyle(
                          color: Colors.black
                      ),
                      decoration: textInputDecoration.copyWith(hintText: 'e-mail'),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      validator: (val) => val!.isEmpty ? 'enter an email' : null,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      style: const TextStyle(
                          color: Colors.black
                      ),
                      decoration: textInputDecoration.copyWith(hintText: 'password'),
                      validator: (val) => val!.length < 6 ? 'password should at least be of length 6' : null,
                      obscureText: true,
                      onChanged: (val){
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            setState(() => loading = true);
                            dynamic user = await _auth.registerWithEmailAndPassword(userName,email,password);
                            if(user == null){
                              setState(()  {
                                error = 'Enter valid email ID';
                                loading = false;
                              }
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                        ),
                        child: const Text('Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    TextButton(
                        onPressed: (){
                          widget.toggleView();
                        },
                        child: const Text('Already registered? Sign In',
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),)
                    ),
                    Text(error,
                      style: const TextStyle(
                        color: Colors.red,
                      ),)
                  ]
              )
          )
      ),
    );

  }
}


