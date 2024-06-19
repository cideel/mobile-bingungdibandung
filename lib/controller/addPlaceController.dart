

import 'dart:io';

import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/Model/user.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TempatWisataController extends GetxController {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final DatabaseReference _tempatWisataRef = FirebaseDatabase.instance.ref().child('tempat_wisata');
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var tempatWisataList = <TempatWisata>[].obs;

  @override
  void onInit() {
    super.onInit();
    _tempatWisataRef.onValue.listen((event) {
      tempatWisataList.clear();
      if (event.snapshot.value != null) {
        final data = Map<dynamic, dynamic>.from(event.snapshot.value as Map);
        data.forEach((key, value) {
          tempatWisataList.add(TempatWisata.fromMap(Map<String, dynamic>.from(value)));
        });
      }
    });
  }

  Future<void> addTempatWisata(TempatWisata tempatWisata) async {
    var id = _tempatWisataRef.push().key;
    tempatWisata.id = id!;
    await _tempatWisataRef.child(id).set(tempatWisata.toMap());
  }

  Future<List<String>> uploadImages(List<XFile> images) async {
    List<String> downloadUrls = [];
    for (var image in images) {
      var ref = _storage.ref().child('tempat_wisata').child(DateTime.now().millisecondsSinceEpoch.toString() + "_" + image.name);
      await ref.putFile(File(image.path));
      String downloadUrl = await ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  }
}

