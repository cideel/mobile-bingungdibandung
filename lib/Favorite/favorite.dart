import 'package:bingung_di_bandung/Favorite/FavoriteController.dart';
import 'package:bingung_di_bandung/Favorite/screenTerjadwal.dart';
import 'package:bingung_di_bandung/Favorite/screenTersimpan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatelessWidget {
  @override
  MyTabs tabs = Get.put(MyTabs());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabs.controller,
          tabs: tabs.myTabs,
        ),
      ),
      body: TabBarView(
        controller: tabs.controller,
        children: [
          ScreenTersimpan(),
          ScreenTerjadwal()
      ],),
    );
  }
}
