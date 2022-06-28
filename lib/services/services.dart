import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';

class Services {

   
  Future createUser(Account user) async {
    final docUser = FirebaseFirestore.instance.collection(user.email).doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
  
}