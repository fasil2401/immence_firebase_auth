import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  final String email;
  final String phone;
  final String password;




  Account(
      {this.id = '',
      
      required this.email,
      required this.phone,
      required this.password,
      });
      

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'phone': phone, 'password': password, };
  }

  Account.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
  :  id = doc['id'],
        email = doc['email'],
      phone = doc['phone'],
      password = doc['password'];
      
}