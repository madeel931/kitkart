import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/widgets_common/toast.dart';

class AuthController extends GetxController {
  static String? userName;
  static String? userEmail;
  static String? userId;
  static String? userUrl;

//singUp function

  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

//login function

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  // Future<UserCredential?> loginFunction({email, password}) async {
  //   UserCredential? userCredential;
  //   try {
  //     userCredential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  //   return userCredential;
  // }

  ///singup function
  // Future<UserCredential?> signUpFunction({email, password}) async {
  //   UserCredential? userCredential;
  //   try {
  //     userCredential = await auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  //   return userCredential;
  // }

// data store functio
  storeUserData({name, email, password}) async {
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({'name': name, 'email': email, 'password': password});
  }

// sing out functio

  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e); // Displaying the error message
    }
  }

// google signIn

  Future googleSignIn(BuildContext context) async {
    User? user;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // create new crediential
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;

        userName = user?.displayName;
        userEmail = user?.email;
        userId = user?.uid;
        userUrl = user?.photoURL;
        // if(userCredential.user!=null){
        //   if(userCredential.additionalUserInfo!.isNewUser){}
        // }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return user;
  }

  // google data
  googleUserData() async {
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set(
        {'name': userName, 'email': userEmail, 'uid': userId, 'Url': userUrl});
  }
}
