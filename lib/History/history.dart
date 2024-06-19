import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bingung_di_bandung/controller/historyController.dart';
import 'package:cached_network_image/cached_network_image.dart';

class History extends StatelessWidget {
  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat",
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (historyController.activityLog.isEmpty) {
          return Center(child: Text("Tidak ada aktivitas"));
        } else {
          return ListView.builder(
            itemCount: historyController.activityLog.length,
            itemBuilder: (context, index) {
              final log = historyController.activityLog[index];
              final imageUrl = log['imageUrl'] ?? 'https://via.placeholder.com/150';
              final uptrend = log['uptrend'] ?? 0;
              final rating = log['rating'] ?? 0.0;

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
                    "${log['userName']} ${log['activityType']} di tempat ${log['placeName']}",
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log['timestamp'],
                        style: GoogleFonts.inter(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.trending_up, color: Colors.green, size: 20),
                          SizedBox(width: 5),
                          Text(
                            "Uptrend: $uptrend",
                            style: GoogleFonts.inter(),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          SizedBox(width: 5),
                          Text(
                            "Rating: $rating",
                            style: GoogleFonts.inter(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
