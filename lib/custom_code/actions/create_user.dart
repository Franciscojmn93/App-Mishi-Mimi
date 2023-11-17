// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

Future<DocumentReference> createUser(
  String emailAddres,
  String nameUser,
  String direction,
  String phoneNumber,
  String passWord,
  String radomDocGen,
) async {
  DateTime createdTime = DateTime.now();

  FirebaseApp app = await Firebase.initializeApp();

  UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
      .createUserWithEmailAndPassword(email: emailAddres, password: passWord);

  String? uid = userCredential.user?.uid;

  final CollectionReference<Map<String, dynamic>> userRef =
      FirebaseFirestore.instance.collection('users');

  userRef.doc(uid).set({
    'email': emailAddres,
    'uid': uid,
    'display_name': nameUser,
    'created_time': createdTime,
    'phone_number': phoneNumber,
    'direction': direction,
    'password': passWord
  });

  final firestore = FirebaseFirestore.instance;
  final collectionUserRef = firestore.collection('users');
  final usuarioEncontrado =
      await collectionUserRef.where('uid', isEqualTo: uid).get();
  UsersRecord usuario =
      await UsersRecord.fromSnapshot(usuarioEncontrado.docs[0]);

  DocumentReference userReference =
      FirebaseFirestore.instance.doc('/users/' + usuario.uid);
  return userReference;
}
