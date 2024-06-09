import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAby6hPuvtCh4LPvFeUhjhUCb6Yz46nFNU",
            authDomain: "clubmanagement-1de73.firebaseapp.com",
            projectId: "clubmanagement-1de73",
            storageBucket: "clubmanagement-1de73.appspot.com",
            messagingSenderId: "10935201251",
            appId: "1:10935201251:web:5267dcee684c3a8c3284d6",
            measurementId: "G-4RHC5Y2KMF"));
  } else {
    await Firebase.initializeApp();
  }
}
