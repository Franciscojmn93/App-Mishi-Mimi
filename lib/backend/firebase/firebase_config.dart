import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBi8eAUBSQLn-B3X2sBD9RZwe3l5x8iXeg",
            authDomain: "mishi-mimi.firebaseapp.com",
            projectId: "mishi-mimi",
            storageBucket: "mishi-mimi.appspot.com",
            messagingSenderId: "306036542465",
            appId: "1:306036542465:web:ac69f96f76a6edda364400",
            measurementId: "G-P8GQQSNLYE"));
  } else {
    await Firebase.initializeApp();
  }
}
