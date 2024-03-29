import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessStorage extends GetxController {
  String? _imageUrl;
  File? _image;

  String? get imageUrl => _imageUrl;

  Future<void> getAccess(context) async {
    final access = await [Permission.camera, Permission.storage].request();
    final cameraStatus = access[Permission.camera];
    final storageStatus = access[Permission.storage];
    if (storageStatus != PermissionStatus.granted ||
        cameraStatus != PermissionStatus.granted) {
      throw SnackBar(content: Text('error'));
    }

    update();
  }

  void chooseFromStorage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);

      try {
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('Chat Room');
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceImageToUpload = referenceDirImages.child(fileName);

        await referenceImageToUpload.putFile(File(_image!.path));
        _imageUrl = await referenceImageToUpload.getDownloadURL();
        print(_imageUrl);
      } catch (error) {
        // Handle error
      }
    }
    print('The image path: ${_image?.path}');
    update();
  }
}
