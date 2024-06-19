import 'package:bingung_di_bandung/DetailPlace/detail.dart';
import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/controller/favoritController.dart';
import 'package:bingung_di_bandung/controller/placeDetailController.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorit",
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (favoriteController.favoritePlaces.isEmpty) {
          return Center(child: Text("Tidak ada tempat favorit"));
        } else {
          return ListView.builder(
            itemCount: favoriteController.favoritePlaces.length,
            itemBuilder: (context, index) {
              final placeId = favoriteController.favoritePlaces[index];
              return FutureBuilder<DataSnapshot>(
                future: FirebaseDatabase.instance.ref('tempat_wisata/$placeId').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError || !snapshot.hasData || snapshot.data?.value == null) {
                    return Center(child: Text("Error loading data"));
                  }
                  final placeData = Map<String, dynamic>.from(snapshot.data!.value as Map);
                  final place = TempatWisata.fromMap(placeData);

                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        place.fotoUrls.isNotEmpty ? place.fotoUrls[0] : 'assets/default.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(place.nama, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                      subtitle: Text(place.alamat, style: GoogleFonts.inter(fontSize: 12)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.trending_up, color: Colors.green),
                          Text(place.uptrend.toString(), style: TextStyle(fontSize: 12)),
                          SizedBox(width: 8),
                          Icon(Icons.star,color: const Color.fromARGB(255, 245, 221, 10),),
                          Text(place.rating.toString(),style: TextStyle(fontSize: 12),),
                          
                        ],
                      ),
                      onTap: () {
                        Get.to(() => Detail(), arguments: place);
                      },
                    ),
                  );
                },
              );
            },
          );
        }
      }),
    );
  }
}