import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddChat extends GetxController {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  void addToChat(String userName,String userUid) {
    userRef.doc(userUid).collection('mychats').doc().set({
      'userName': userName,
     
    });

    update();
  }
}
