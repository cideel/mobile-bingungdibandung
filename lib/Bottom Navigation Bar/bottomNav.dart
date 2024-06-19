import 'package:bingung_di_bandung/Explore/explore.dart';
import 'package:bingung_di_bandung/Favorite/favorite.dart';
import 'package:bingung_di_bandung/History/history.dart';
import 'package:bingung_di_bandung/Home/home.dart';
import 'package:bingung_di_bandung/Profile/profile.dart';
import 'package:bingung_di_bandung/controller/NavBarController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarBot extends StatelessWidget {
  final c = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      builder: (context) {
        return Scaffold(
          body: IndexedStack(
            index: c.tabIndex,
            children:  [
              Home(),
              Favorite(),
              History(),
              Profile()
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            currentIndex: c.tabIndex,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            
            onTap: c.changeTabIndex,
            items: [
              _bottomBarItem(Icons.home, "Beranda"),
              _bottomBarItem(Icons.favorite_border, "Favorit"),
              _bottomBarItem(Icons.assignment, "Riwayat"),
              _bottomBarItem(Icons.person_pin_circle, "Profil")
            ]),
        );
      },
    );
  }
  
}



_bottomBarItem(IconData icon,String label){
  return BottomNavigationBarItem(icon:Icon(icon),label: label,backgroundColor: Colors.white);
}


