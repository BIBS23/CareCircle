import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //sign up function

  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      // Handle sign-in error

      const GetSnackBar(
        title: 'error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        duration: Duration(seconds: 1),
      );
    }

    update();
  }

  // sign in function

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found with that email address.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'An error occurred, please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle other exceptions
      Get.snackbar('Error', 'please try again later');
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut().then((value) {
         Navigator.of(context).pushNamedAndRemoveUntil('/signout', (route) => false);
      });
    } catch (e) {
      print(e);
    }
  }
}
