import 'package:bingung_di_bandung/controller/autController.dart';
import 'package:bingung_di_bandung/controller/profileController.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfil extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profil",
          style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          
          children: [
            SizedBox(
              height: 65,
            ),
            Obx(() => CircleAvatar(
              backgroundImage: profileController.imageUrl.value.isNotEmpty
                  ? NetworkImage(profileController.imageUrl.value)
                  : AssetImage("assets/profil-face.png") as ImageProvider,
              radius: 50,
            )),
            SizedBox(
              height: 20,
            ),
            Obx(() => Text(
              profileController.userModel.value.name ?? '',
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 5,
            ),
            RichText(
                text:
                    TextSpan(style: TextStyle(color: Colors.black), children: [
              TextSpan(
                  text: "Ganti foto profil",
                  style: TextStyle(fontSize: 16, color: Color(0xff0D6EFD)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _showImageSourceDialog(context);
                    }),
            ])),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => TextFormField(
                initialValue: profileController.userModel.value.name,
                decoration: InputDecoration(labelText: "Username"),
                onChanged: (value) => profileController.userModel.value.name = value,
              )),
            ),
            SizedBox(height:25 ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => TextFormField(
                initialValue: profileController.userModel.value.email,
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) => profileController.userModel.value.email = value,
              )),
            ),
            SizedBox(height: 25,),
            ElevatedButton(onPressed: () {
              profileController.updateProfile(
                profileController.userModel.value.name ?? '',
                profileController.userModel.value.email ?? '',
              );
            }, child: Text("Save",style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(360, 56)),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff0D6EFD)),
                          ),
            )
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  profileController.pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  profileController.pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
