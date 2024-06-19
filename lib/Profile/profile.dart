import 'package:bingung_di_bandung/controller/autController.dart';
import 'package:bingung_di_bandung/controller/profileController.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    authController
        .fetchUserData(); 

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, 
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      size: 30,
                    )),
                SizedBox(
                  width: 110,
                ),
                Text(
                  "Profile",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B1E28)),
                ),
                SizedBox(
                  width: 100,
                ),
                IconButton(
                    onPressed: () {}, // Icon Button Edit Profile
                    icon: Icon(
                      Icons.edit,
                      size: 30,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Obx(() {
            final user = authController.userModel.value;

            return Center(
              child: Column(
                children: [
                  Obx(() => CircleAvatar(
                        backgroundImage:
                            profileController.imageUrl.value.isNotEmpty
                                ? NetworkImage(profileController.imageUrl.value)
                                : AssetImage("assets/profil-face.png")
                                    as ImageProvider,
                        radius: 50,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    user.name ?? "Katsuhiko",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ), //text nama
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.email ?? "jinedinjidun@gmail.com",
                    style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                ],
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text(
                    "Ubah Profil",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    Get.toNamed(MyPage.editPage);
                  },
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border_outlined),
                  title: Text(
                    "Favorit",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {},
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.history_outlined),
                  title:
                      Text("Riwayat", style: GoogleFonts.roboto(fontSize: 16)),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {},
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text("Pengaturan",
                      style: GoogleFonts.roboto(fontSize: 16)),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {},
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.place_outlined),
                  title: Text("Daftarkan Tempat",
                      style: GoogleFonts.roboto(fontSize: 16)),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    Get.toNamed(MyPage.createPage);
                  },
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    "Logout",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  onTap: () {
                    authController.logout();
                    Get.offAllNamed(MyPage.login);
                  },
                ),
                Divider(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
