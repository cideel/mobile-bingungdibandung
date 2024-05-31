import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Daftar Tempat Favorit",
                    style: GoogleFonts.roboto(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.black38,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  _cardFavorit(pic: 'assets/favorit-ice-skating.png',name: "Gardenice Skating",loc: "Jln. Sukajadi No.137 Paris Van Java",comment: "58",uptrend: "123",rating: "4.8",distance: "7.2 km",),
                  SizedBox(height: 25,),
                  _cardFavorit(pic: 'assets/favorit-orchid.png', name: "Orchid Forest Cikole", loc: "Genteng, Cikole, Kec Lembang", uptrend: "109", comment: "77", rating: "4.9", distance: "11 km"),
                  SizedBox(height: 25,),
                  _cardFavorit(pic: 'assets/favorit-green.png', name: "Green Canyon", loc: "Bojongsoang, Cikole, Bandung Kota", uptrend: "109", comment: "35", rating: "3.5", distance: "12 km"),
                  
                  SizedBox(height: 25,),
                  _cardFavorit(pic: 'assets/favorit-ice-skating.png',name: "Gardenice Skating",loc: "Jln. Sukajadi No.137 Paris Van Java",comment: "58",uptrend: "123",rating: "4.8",distance: "7.2 km",),
                  SizedBox(height: 25,),
                  _cardFavorit(pic: 'assets/favorit-green.png', name: "Green Canyon", loc: "Bojongsoang, Cikole, Bandung Kota", uptrend: "109", comment: "35", rating: "3.5", distance: "12 km"),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _cardFavorit extends StatelessWidget {
  const _cardFavorit({
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
          Image.asset(
            pic,
            colorBlendMode: BlendMode.clear,
          ),
          Positioned(
              top: 105,
              left: 8,
              child: Text(
                name,
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              )),
          Positioned(
              top: 130,
              left: 8,
              child: Text(
                loc,
                overflow: TextOverflow.clip,
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          Positioned(
            right: 8,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_sharp),
              color: Colors.red,
              iconSize: 40,
    
            ),
          ),
          Positioned(
            bottom: 5,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.trending_up,color: Colors.green,size: 25,),
                SizedBox(width: 5,),
                Text(uptrend,style: TextStyle(fontSize: 14,color: Colors.green,),),
                SizedBox(width: 12,),
                Image.asset('assets/chat-icon.png'),
                SizedBox(width: 5,),
                Text(comment,style: TextStyle(fontSize:14,color: Colors.grey,),),
                SizedBox(width: 12,),
                Image.asset('assets/star-icon.png'),
                SizedBox(width: 5,),
                Text(rating,style: TextStyle(fontSize: 14,color: Color(0xffF7B809),),),
                SizedBox(width: 12,),
                Image.asset('assets/location-icon.png'),
                SizedBox(width: 5,),
                Text(distance,style: TextStyle(color: Color(0xffC42D2D),fontSize: 14,),)
                
    
              ],
            ),
          )
        ],
      ),
      width: 335,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 1)
          ]),
    );
  }
}
