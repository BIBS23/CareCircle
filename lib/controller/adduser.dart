import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserData extends GetxController {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  void addUserData(String email, String password, String userUid) {
    userRef
        .doc(userUid)
        .set({'user': email, 'password': password, 'useruid': userUid});
    update();
  }
}