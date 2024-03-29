import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hackxite/controller/access_storage.dart';

class AddPost extends GetxController {
  CollectionReference postRef = FirebaseFirestore.instance.collection('posts');
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  AccessStorage access = Get.find();

  Future<void> addPost(String postImg, String desc, String userUid) async {
    String userProfileImageUrl = '';
    DocumentSnapshot userDoc = await usersRef.doc(userUid).get();
    try {
      userProfileImageUrl =
          userDoc['profImg'] ?? ''; // Assuming 'profImg' is the field name
    } catch (e) {
      print("Error fetching user's profile image: $e");
    }
    await postRef.add({
      'postImg': access.imageUrl,
      'description': desc,
      'uid': userUid,
      'userProfileImageUrl': userProfileImageUrl,
      'authon': userDoc['name']
    });

    update();
  }
}
