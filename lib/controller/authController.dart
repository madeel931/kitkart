import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/consts.dart';

class AuthController extends GetxController {
  Future<UserCredential?> loginFunction({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return userCredential;
  }

  Future<UserCredential?> signUpFunction({email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return userCredential;
  }

  storeUserData({name, email, password}) async {
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({'name': name, 'email': email, 'password': password});
  }

  signOutFunction() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
