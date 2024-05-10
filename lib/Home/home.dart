import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,), label: "Beranda",),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favorit"),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel_outlined),label:"Explore!"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment),label: "Riwayat"),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_circle_outlined),label: "Profil")
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset("assets/iklan1.png"),
              Column(
                children: [
                  Text("",
                      style:
                          GoogleFonts.inter(fontSize: 10, color: Colors.white)),
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
          SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.5),
            child: Row(
              children: [
                _iconAlam(
                  pic: "assets/icon-wisata-alam.png",
                  nama: "Wisata Alam",
                  warna: 0xFF0AA210,
                ),
                SizedBox(
                  width: 8,
                ),
                _iconAlam(
                    pic: "assets/icon-wisata-buatan.png",
                    nama: "Wisata Buatan",
                    warna: 0xFF2485FE),
                SizedBox(
                  width: 8,
                ),
                _iconAlam(
                    pic: "assets/icon-wisata-kuliner.png",
                    nama: "Wisata Kuliner",
                    warna: 0xFFF7B809),
                SizedBox(
                  width: 8,
                ),
                _iconAlam(
                    pic: "assets/icon-wisata-lainnya.png",
                    nama: "Tempat Lainnya",
                    warna: 0xFFC42D2D)
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      constraints:
                          BoxConstraints.expand(height: 50), // Anggito Setoadji
                      decoration: BoxDecoration(
                          color: Colors.white, // 1301213077
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4), // IF4505
                            topRight: Radius.circular(4),
                          )),
                      child: TabBar(tabs: [
                        Tab(text: "Lagi Rame"),
                        Tab(
                          text: "Lagi Sepi",
                        )
                      ]),
                    ),
                    Expanded(
                        child: Container(
                      child: TabBarView(children: [
                        ListView(
                          children: [
                            _ListLagiRame(
                              pic: "assets/ex-tempat-wisata-1.png",
                              nama: "Gradience Skating",
                              address:
                                  "Jln. Sukajadi No.137 Paris Van Java Sky Level",
                              icon: Icons.keyboard_double_arrow_up,
                            ),
                            _ListLagiRame(
                                pic: "assets/ex-tempat-wisata-2.png",
                                nama: "Orchid Forest Cikole",
                                address:
                                    "Genteng,Cikole,Kec Lembang, Kabupaten Bandung Barat",
                                icon: Icons.keyboard_double_arrow_down),
                            _ListLagiRame(
                                pic: "assets/ex-tempat-wisata-4.png",
                                nama: "Green Canyon Bandung",
                                address:
                                    "Bojongsoang,Cikole,Kec Bandung, Kabupaten Bandung Barat",
                                icon: Icons.keyboard_double_arrow_down),
                            _ListLagiRame(
                                pic: "assets/ex-tempat-wisata-2.png",
                                nama: "Green Canyon Bandung",
                                address:
                                    "Genteng,Cikole,Kec Lembang, Kabupaten Bandung Barat",
                                icon: Icons.keyboard_double_arrow_down)
                          ],
                        ),
                        ListView(
                          children: [
                            _ListLagiRame(
                              pic: "assets/ex-tempat-wisata-1.png",
                              nama: "Citylight of Punclut",
                              address:
                                  "Jln. Punclut No.120 Cimbeluit, Cidadap, Bandung",
                              icon: Icons.keyboard_double_arrow_up,
                            ),
                            _ListLagiRame(
                                pic: "assets/ex-tempat-wisata-2.png",
                                nama: "Museum Geologi",
                                address:
                                    "Genteng,Cikole,Kec Lembang, Kabupaten Bandung Barat",
                                icon: Icons.keyboard_double_arrow_down),
                            _ListLagiRame(
                                pic: "assets/ex-tempat-wisata-4.png",
                                nama: "Green Canyon Bandung",
                                address:
                                    "Bojongsoang,Cikole,Kec Bandung, Kabupaten Bandung Barat",
                                icon: Icons.keyboard_double_arrow_down),
                            _ListLagiRame(
                                pic: "assets/ex-tempat-wisata-2.png",
                                nama: "The Great Asia Africa",
                                address:
                                    "Genteng,Cikole,Kec Lembang, Kabupaten Bandung Barat",
                                icon: Icons.keyboard_double_arrow_down)
                          ],
                        )
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
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Rekomendasi Untuk Kamu",
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.rocket_launch,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Lihat Semua",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      color: Color(0xFF0D8BFF),
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _cardWisata(
                    pic: "assets/rabbit-town.png",
                    name: "Rabbit Town",
                    loc: "Jln. Rancabentang No.31",
                    uptrend: "57",
                    comment: "99",
                    rating: "3.6",
                    distance: "5.2",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  _cardWisata(
                      pic: "assets/grafika-cikole.png",
                      name: "Grafika Cikole",
                      loc: "Jln. Raya Tangkuban Perahu",
                      uptrend: "28",
                      comment: "78",
                      rating: "4.0",
                      distance: "13"),
                  SizedBox(
                    width: 20,
                  ),
                  _cardWisata(
                      pic: "assets/ranca-upas.png",
                      name: "Ranca Upas ",
                      loc: "Jln. Camp Ranca Upas",
                      uptrend: "10",
                      comment: "49 ",
                      rating: "3.9",
                      distance: "18"),
                  SizedBox(
                    width: 20,
                  ),
                  _cardWisata(
                      pic: "assets/little-korea.png",
                      name: "Little Korea",
                      loc: "Jln. Purwakarta No.178 Setiabudi",
                      uptrend: "51",
                      comment: "48",
                      rating: "4.8",
                      distance: "9.7")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _cardWisata extends StatelessWidget {
  const _cardWisata({
    required this.pic,
    required this.name,
    required this.loc,
    required this.uptrend,
    required this.comment,
    required this.rating,
    required this.distance,
    super.key,
  });

  final String pic;
  final String name;
  final String loc;
  final String uptrend;
  final String comment;
  final String rating;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(pic),
          Positioned(
            top: 115,
            left: 8,
            child: Text(
              name,
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
              loc,
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
                      uptrend,
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0Xff0AA210)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset("assets/chat-icon.png"),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      comment,
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xff525252)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset("assets/star-icon.png"),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      rating,
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xffF7B809)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset("assets/location-icon.png"),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      distance,
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xffC42D2D)),
                    ),
                  ],
                ),
              ))
        ],
      ),
      width: 220,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
          ]),
    );
  }
}

class _ListLagiRame extends StatelessWidget {
  const _ListLagiRame({
    required this.pic,
    required this.nama,
    required this.address,
    required this.icon,
    super.key,
  });

  final String pic;
  final String nama;
  final String address;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
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
        ));
  }
}

class _iconAlam extends StatelessWidget {
  const _iconAlam({
    required this.pic,
    required this.nama,
    required this.warna,
    super.key,
  });

  final String pic;
  final String nama;
  final int warna;

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
                Icon(Icons.search),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Mau jalan kemana hari ini?",
                  style: TextStyle(fontWeight: FontWeight.w300),
                )
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
