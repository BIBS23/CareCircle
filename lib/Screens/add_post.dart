import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackxite/controller/access_storage.dart';
import 'package:hackxite/controller/add_post.dart';
import 'package:hackxite/widgets/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';

class PostImagePage extends StatefulWidget {
  @override
  _PostImagePageState createState() => _PostImagePageState();
}

class _PostImagePageState extends State<PostImagePage> {
  final AccessStorage access = Get.find();
  final TextEditingController _descriptionController = TextEditingController();
 
  String userUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _postImageWithDescription() async {
    AddPost addPost = Get.find();
   
    addPost.addPost(access.imageUrl.toString(), _descriptionController.text, userUid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      access.pickImage(ImageSource.gallery),
                  child: Text('Pick from Gallery'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => access.pickImage(ImageSource.camera),
                  child: Text('Use Camera'),
                ),
              ],
            ),
            SizedBox(height: 50),
           CustomTextField(obscureText: false, hint: 'description', color: Colors.white, txtController: _descriptionController),
            ElevatedButton(
              onPressed: _postImageWithDescription,
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
