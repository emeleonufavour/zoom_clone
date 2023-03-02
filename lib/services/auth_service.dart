import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/utils/utilities.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authChange => _auth.authStateChanges();

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool success = false;
    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication userAuth = await user!.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: userAuth.accessToken, idToken: userAuth.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credentials);
      User? thisUser = userCredential.user;
      if (thisUser != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(thisUser.uid).set({
            'user': thisUser.displayName,
            'uid': thisUser.uid,
            'profilePhoto': thisUser.photoURL
          });
        }
        success = true;
      }
    } on FirebaseAuthException catch (e) {
      success = false;
      showSnackBar(context, e.message!);
    }
    return success;
  }

  Future<void> signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
