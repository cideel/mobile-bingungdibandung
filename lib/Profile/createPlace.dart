import 'dart:io';

import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/controller/addPlaceController.dart';
import 'package:bingung_di_bandung/controller/dropdownController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePlace extends StatelessWidget {
  final DropdownController dropdownController = Get.put(DropdownController());
  final TempatWisataController tempatWisataController = Get.put(TempatWisataController());

  final TextEditingController namaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final List<XFile> _images = [];

  Future<void> _pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      _images.addAll(selectedImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buat Tempat",
          style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Nama Tempat",
                  prefixIcon: Icon(Icons.store_mall_directory_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Tempat wajib diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: lokasiController,
                decoration: InputDecoration(
                  labelText: "Lokasi",
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lokasi wajib diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: dropdownController.selectedLabel.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    labelText: 'Label',
                    prefixIcon: Icon(Icons.auto_awesome),
                  ),
                  onChanged: (newValue) {
                    dropdownController.setSelectedLabel(newValue!);
                  },
                  items: dropdownController.labels.map((label) {
                    return DropdownMenuItem<String>(
                      value: label,
                      child: Text(label),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Deskripsi",
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: deskripsiController,
                minLines: 6,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  alignLabelWithHint: false,
                  hintText: "Tulis deskripsi disini...",
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi wajib diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: linkController,
                decoration: InputDecoration(
                  labelText: "Tautan (Google Maps)",
                  prefixIcon: Icon(Icons.link),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Pilih Foto",
                          style: TextStyle(fontSize: 16, color: Color(0xff0D6EFD)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _pickImages,
                        ),
                      ],
                    ),
                  ),
                ),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              SizedBox(height: 30),
              if (_images.isNotEmpty)
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(File(_images[index].path)),
                      );
                    },
                  ),
                ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_validateForm()) {
                    List<String> fotoUrls = await tempatWisataController.uploadImages(_images);
                    var tempatWisata = TempatWisata(
                      id: '',
                      nama: namaController.text,
                      alamat: lokasiController.text,
                      deskripsi: deskripsiController.text,
                      fotoUrls: fotoUrls,
                      rating: 0.0,
                      uptrend: 0,
                      label: dropdownController.selectedLabel.value,
                      link: linkController.text, // Include the optional link
                    );
                    await tempatWisataController.addTempatWisata(tempatWisata);
                    Get.back();
                  }
                },
                child: Text("Simpan", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(50, 56)),
                  backgroundColor: MaterialStateProperty.all(Color(0xff0D6EFD)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    if (namaController.text.isEmpty) {
      Get.snackbar('Error', 'Nama Tempat wajib diisi');
      return false;
    }
    if (lokasiController.text.isEmpty) {
      Get.snackbar('Error', 'Lokasi wajib diisi');
      return false;
    }
    if (deskripsiController.text.isEmpty) {
      Get.snackbar('Error', 'Deskripsi wajib diisi');
      return false;
    }
    return true;
  }
}
