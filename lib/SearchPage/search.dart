import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: Center(
                  child: Text(
                "Filter Berdasarkan",
                style: GoogleFonts.inter(
                    fontSize: 17, fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(color: Colors.white),
            ),
            Divider(
              height: 0,
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kategori",
                    style: GoogleFonts.inter(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _drawerKategoriButton(
                    name: "Pantai",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  _drawerKategoriButton(
                    name: "Gunung",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _drawerKategoriButton(
                    name: "Museum",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  _drawerKategoriButton(
                    name: "Kuliner",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rekomendasi",
                    style: GoogleFonts.inter(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _drawerKategoriButton(
                    name: "Rating",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  _drawerKategoriButton(
                    name: "Trending",
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _drawerKategoriButton(
                    name: "Terbaru",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  _drawerKategoriButton(
                    name: "Terkait",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Pencarian",
          style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            _searchBarHomePage(),
            SizedBox(
              height: 40,
            ),
            Text("Kategori Pencarian",
                style: GoogleFonts.roboto(
                    fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Gunung",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Pantai",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Hutan",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Makanan",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Mall",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Samudra",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Bola",
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  _searchLabel(
                    pic: "assets/search-gunung.png",
                    name: "Game",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _drawerKategoriButton extends StatelessWidget {
  const _drawerKategoriButton({
    required this.name,
    super.key,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(name),
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.black),
          minimumSize: MaterialStateProperty.all(
            Size(122, 32),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.white54),
          textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
    );
  }
}

class _searchLabel extends StatelessWidget {
  const _searchLabel({
    required this.pic,
    required this.name,
    super.key,
  });

  final String pic;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage(pic))),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          name,
          style: GoogleFonts.roboto(fontSize: 14),
        )
      ],
    );
  }
}

class _searchBarHomePage extends StatelessWidget {
  const _searchBarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      //LOGIC SEARCH BAR COY

      decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
          prefixIcon: Icon(Icons.search),
          labelText: "Mau jalan kemana hari ini?",
          labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w300),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
