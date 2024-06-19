import 'package:bingung_di_bandung/DetailPlace/detail.dart';
import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/controller/addPlaceController.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class Home extends StatelessWidget {
  final TempatWisataController controller = Get.put(TempatWisataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView(
          children: [
            Stack(
              children: [
                Image.asset("assets/iklan1.png"),
                Column(
                  children: [
                    Text("",
                        style: GoogleFonts.inter(
                            fontSize: 10, color: Colors.white)),
                    SizedBox(
                      height: 123,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _searchbar(),
                          SizedBox(
                            width: 8,
                          ),
                          _notification()
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            // (Header with Image and Search Bar)...
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.5),
              child: Row(
                children: [
                  _iconAlam(
                    pic: "assets/icon-wisata-alam.png",
                    nama: "Wisata Alam",
                    warna: 0xFF0AA210,
                  ),
                  SizedBox(width: 8),
                  _iconAlam(
                      pic: "assets/icon-wisata-buatan.png",
                      nama: "Wisata Buatan",
                      warna: 0xFF2485FE),
                  SizedBox(width: 8),
                  _iconAlam(
                      pic: "assets/icon-wisata-kuliner.png",
                      nama: "Wisata Kuliner",
                      warna: 0xFFF7B809),
                  SizedBox(width: 8),
                  _iconAlam(
                      pic: "assets/icon-wisata-lainnya.png",
                      nama: "Tempat Lainnya",
                      warna: 0xFFC42D2D)
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints.expand(height: 50),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            )),
                        child: TabBar(tabs: [
                          Tab(text: "Lagi Rame"),
                          Tab(text: "Lagi Sepi"),
                        ]),
                      ),
                      Expanded(
                          child: Container(
                        child: TabBarView(children: [
                          ListView.builder(
                            itemCount: controller.tempatWisataList.length,
                            itemBuilder: (context, index) {
                              var tempatWisata =
                                  controller.tempatWisataList[index];
                              return _ListLagiRame(
                                tempatWisata: tempatWisata,
                                pic: tempatWisata.fotoUrls.isNotEmpty
                                    ? tempatWisata.fotoUrls[0]
                                    : 'assets/default.png',
                                nama: tempatWisata.nama,
                                address: tempatWisata.alamat,
                                icon: Icons
                                    .keyboard_double_arrow_up, 
                              );
                            },
                          ),
                          ListView(
                             
                              ),
                        ]),
                      ))
                    ],
                  ),
                ),
                height: 260,
                width: 203,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5)
                    ]),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Rekomendasi Untuk Kamu",
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.rocket_launch, color: Colors.red),
                  SizedBox(width: 18),
                  Text(
                    "",
                    style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Color(0xFF0D8BFF),
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.tempatWisataList.length,
                    (index) {
                      return Row(
                        children: [
                          _cardWisata(
                              tempatWisata: controller.tempatWisataList[index]),
                          if (index != controller.tempatWisataList.length - 1)
                            SizedBox(width: 20), 
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _cardWisata extends StatelessWidget {
  final TempatWisata tempatWisata;

  _cardWisata({required this.tempatWisata});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(MyPage.detailPlace, arguments: tempatWisata);
      },
      child: Container(
        width: 220,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
          ],
        ),
        child: Stack(
          children: [
            Image.network(tempatWisata.fotoUrls.isNotEmpty
                ? tempatWisata.fotoUrls[0]
                : 'assets/default.png'),
            Positioned(
              top: 115,
              left: 8,
              child: Text(
                tempatWisata.nama,
                style: GoogleFonts.inter(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
            Positioned(
              top: 138,
              left: 8,
              child: Text(
                tempatWisata.alamat,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: Colors.green,
                      size: 25,
                    ),
                    SizedBox(width: 4),
                    Text(
                      tempatWisata.uptrend.toString(),
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0Xff0AA210)),
                    ),
                    SizedBox(width: 8),
                    Image.asset("assets/chat-icon.png"),
                    SizedBox(width: 4),
                    Text(
                      "", 
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xff525252)),
                    ),
                    SizedBox(width: 8),
                    Image.asset("assets/star-icon.png"),
                    SizedBox(width: 4),
                    Text(
                      tempatWisata.rating.toString(),
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xffF7B809)),
                    ),
                    SizedBox(width: 8),
                    Image.asset("assets/location-icon.png"),
                    SizedBox(width: 3),
                    Text(
                      "", // You can add logic for distance here
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xffC42D2D)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListLagiRame extends StatelessWidget {
  final String pic;
  final String nama;
  final String address;
  final IconData icon;
  final TempatWisata tempatWisata;

  _ListLagiRame({
    required this.pic,
    required this.nama,
    required this.address,
    required this.icon,
    required this.tempatWisata,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        pic,
        height: 42,
        width: 42,
      ),
      title: Text(
        nama,
        style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        address,
        style: GoogleFonts.inter(fontSize: 10),
      ),
      trailing: Icon(
        icon,
        color: Colors.green,
        size: 30,
      ),
      onTap: () {
        Get.toNamed(MyPage.detailPlace, arguments: tempatWisata);
      },
    );
  }
}

class _iconAlam extends StatelessWidget {
  final String pic;
  final String nama;
  final int warna;

  _iconAlam({
    required this.pic,
    required this.nama,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
              child: Image.asset(
            pic,
            width: 26.67,
            height: 24.08,
          )),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
              color: Color(warna), borderRadius: BorderRadius.circular(4)),
        ),
        SizedBox(
          height: 4,
        ),
        Center(
            child: Text(
          nama,
          style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500),
        ))
      ],
    );
  }
}

class _notification extends StatelessWidget {
  const _notification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Stack(
          children: [
            Icon(
              Icons.notifications_none,
              size: 30,
            ),
            Positioned(
              right: 0,
              child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: Color(0xffC42D2D),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "2",
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ))),
            )
          ],
        ),
      ),
      height: 42,
      width: 42,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5)
          ]),
    );
  }
}

class _searchbar extends StatelessWidget {
  const _searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(MyPage.searchPage);
                    },
                    icon: Icon(Icons.search)),
                SizedBox(
                  width: 4,
                ),
                RichText(
                    text: TextSpan(
                        text: "Mau jalan kemana hari ini?",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(MyPage.searchPage);
                            print("search coy");
                          }))
              ],
            ),
          )
        ],
      ),
      height: 42,
      width: 285,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
    );
  }
}
