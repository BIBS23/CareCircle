import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  CollectionReference chatRoomRef =
      FirebaseFirestore.instance.collection('chatroom');
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  Future addMessage(String message, String username, BuildContext context,
      String sender, String chatdoc, String imgurl, String caption) async {
      String currentuseruid = FirebaseAuth.instance.currentUser!.uid;

    chatRoomRef.doc(chatdoc).collection('messages').add({
      'message': message,
      'receiver': username,
      'sender': sender,
      'useruid': currentuseruid,
      'timestamp': DateTime.now(),
      'imageurl': imgurl,
      'caption': caption
    });

    update();
  }

}