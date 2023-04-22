import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future signin(TextEditingController email, TextEditingController password,
    BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return (Center(
        child:
            //     CupertinoActivityIndicator(

            //   animating: true,
            //   color: Colors.blue,
            // )

            CircularProgressIndicator(
          backgroundColor: Color.fromARGB(126, 6, 6, 6),
          color: Color.fromARGB(255, 33, 117, 243),
        ),
      ));
    },
  );
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.toString().trim(), password: password.toString().trim());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.snackbar('no user', 'No user found for that email');
    } else if (e.code == 'wrong-password') {
      Get.snackbar('wrong password', 'wrong password provided for that user');
    } else if (e.code == 'network-request-failed') {
      Get.snackbar(
          'Network error', 'please check your connection and try again');
    }
  }

  Navigator.pop(context);
}
