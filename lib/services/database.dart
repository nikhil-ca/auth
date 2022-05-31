import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uId;
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  DatabaseService({required this.uId});

  //Upload user details during registration
  Future uploadUserInfo(String name, String email) async{
    return await users.doc(uId).set(
        {
          'name': name,
          'email': email,
        });
  }
}