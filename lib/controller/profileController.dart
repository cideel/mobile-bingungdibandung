import 'dart:io';
import 'package:bingung_di_bandung/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileController extends GetxController {
  var userModel = UserModel().obs;
  var imageUrl = ''.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference userRef = FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(user.uid);

      userRef.onValue.listen((event) {
        final snapshot = event.snapshot;
        if (snapshot.value != null) {
          final Map<String, dynamic> userData = Map<String, dynamic>.from(snapshot.value as Map);
          userModel.value = UserModel.fromMap(userData);
          imageUrl.value = userModel.value.imageUrl ?? '';
        }
      });
    }
  }
  // Anggito Setoadji - 1301213077
  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        final User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final Reference storageRef = FirebaseStorage.instance
              .ref()
              .child('profile_pictures')
              .child('${user.uid}.jpg');

          // Upload file
          UploadTask uploadTask = storageRef.putFile(File(image.path));
          TaskSnapshot snapshot = await uploadTask;

          // Verify upload success
          if (snapshot.state == TaskState.success) {
            String downloadUrl = await storageRef.getDownloadURL();
            imageUrl.value = downloadUrl;

            // Update Realtime Database
            DatabaseReference userRef = FirebaseDatabase.instance
                .reference()
                .child('users')
                .child(user.uid);

            await userRef.update({'imageUrl': downloadUrl});
          } else {
            print('Upload failed: ${snapshot.state}');
            Get.snackbar('Error', 'Upload failed, please try again.');
          }
        } else {
          print('User is not logged in');
          Get.snackbar('Error', 'User is not logged in.');
        }
      } else {
        print('No image selected');
        Get.snackbar('Error', 'No image selected.');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> updateProfile(String newUsername, String newEmail) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Update Realtime Database
        DatabaseReference userRef = FirebaseDatabase.instance
            .reference()
            .child('users')
            .child(user.uid);

        await userRef.update({
          'name': newUsername,
          'email': newEmail,
        });

        // Update Firebase Auth
        await user.updateEmail(newEmail);

        // Update local userModel
        userModel.value.name = newUsername;
        userModel.value.email = newEmail;
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', e.toString());
    }
  }
}
