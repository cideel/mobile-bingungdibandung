import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {}, // Icon Button Back Profile
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
          Center(
              child: CircleAvatar(
            backgroundImage: AssetImage("assets/little-korea.png"),
            radius: 50,
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Katsuhiko",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.bold),
          ), //text nama
          SizedBox(
            height: 10,
          ),
          Text(
            "jinedinjidun@gmail.com",
            style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text(
                    "Edit Profil",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {},
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
                  onTap: () {
                    
                  },
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.history_outlined),
                  title:
                      Text("Riwayat", style: GoogleFonts.roboto(fontSize: 16)),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    
                  },
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text("Pengaturan",
                      style: GoogleFonts.roboto(fontSize: 16)),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    
                  },
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.verified_outlined),
                  title: Text("Verifikasi",
                      style: GoogleFonts.roboto(fontSize: 16)),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    
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
