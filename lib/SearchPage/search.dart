import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bingung_di_bandung/controller/searchController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';

class SearchPage extends StatelessWidget {
  final Search searchController = Get.put(Search());
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cari Tempat Wisata",
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                hintText: 'Cari tempat wisata...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                searchController.searchPlaces(value);
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (searchController.searchResults.isEmpty) {
                return Center(child: Text("Tidak ada hasil pencarian"));
              } else {
                return ListView.builder(
                  itemCount: searchController.searchResults.length,
                  itemBuilder: (context, index) {
                    final place = searchController.searchResults[index];
                    final imageUrl = place['fotoUrls'] != null && place['fotoUrls'].isNotEmpty
                        ? place['fotoUrls'][0]
                        : 'https://via.placeholder.com/150';

                    return Card(
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: CachedNetworkImage(
                          imageUrl: imageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        title: Text(
                          place['nama'],
                          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place['alamat'],
                              style: GoogleFonts.inter(color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.trending_up, color: Colors.green, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  "Uptrend: ${place['uptrend']}",
                                  style: GoogleFonts.inter(),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  "Rating: ${place['rating']}",
                                  style: GoogleFonts.inter(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          final tempatWisata = TempatWisata(
                            id: place['id'],
                            nama: place['nama'],
                            alamat: place['alamat'],
                            deskripsi: place['deskripsi'],
                            fotoUrls: List<String>.from(place['fotoUrls']),
                            rating: place['rating'].toDouble(),
                            uptrend: place['uptrend'],
                            label: place['label'],
                            link: place['link'],
                          );
                          Get.toNamed(MyPage.detailPlace, arguments: tempatWisata);
                        },
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
