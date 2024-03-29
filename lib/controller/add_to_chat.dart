import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddChat extends GetxController {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  void addToChat(String mail, String autoruid, String recUid) {
    userRef
        .doc(autoruid)
        .collection('mychats')
        .doc()
        .set({'userMail': mail, 'uid': recUid});
    userRef.doc(recUid).collection('mychats').add({
      'userMail': FirebaseAuth.instance.currentUser!.email,
      'uid':autoruid
    });

    update();
  }
}
