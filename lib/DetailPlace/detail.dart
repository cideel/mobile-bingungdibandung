import 'package:bingung_di_bandung/DetailPlace/commentBottomSheet.dart';
import 'package:bingung_di_bandung/Explore/counter_contoller.dart';
import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/controller/commentController.dart';
import 'package:bingung_di_bandung/controller/favoritController.dart';
import 'package:bingung_di_bandung/controller/placeDetailController.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TempatWisata tempatWisata = Get.arguments;
    final DetailController detailController = Get.put(DetailController());
    final FavoriteController favoriteController = Get.put(FavoriteController());
    final CommentController commentController = Get.put(CommentController());

    detailController.fetchTempatWisataDetail(tempatWisata.id);
    commentController.setTempatWisata(tempatWisata); 
    commentController.fetchComments(tempatWisata.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Tempat",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 18),
        ),
      ),
      body: Obx(() {
        if (detailController.tempatWisata.value.id.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          final tempat = detailController.tempatWisata.value;
          return detailPlace(
            imagePlaces: tempat.fotoUrls,
            namePlace: tempat.nama,
            locationPlace: tempat.alamat,
            ratingPlace: tempat.rating.toString(),
            distancePlace: "Lokasi", 
            uptrendPlace: tempat.uptrend.toString(),
            commentPlace: "Forum", 
            deskripsi: tempat.deskripsi,
            link: tempat.link ?? '',
            onRatingPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Berikan Rating'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return ListTile(
                          leading: Icon(Icons.star, color: index < tempat.rating ? Colors.amber : Colors.grey),
                          title: Text('${index + 1}'),
                          onTap: () {
                            detailController.updateRating(tempat.id, (index + 1).toDouble());
                            Get.back();
                          },
                        );
                      }),
                    ),
                  );
                },
              );
            },
            onLocationPressed: () async {
              final url = Uri.parse(tempat.link!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                Get.snackbar('Error', 'Could not launch $url');
              }
            },
            onUptrendPressed: () {
              detailController.toggleUptrend(tempat.id);
            },
            onCommentPressed: () {
              Get.bottomSheet(
                CommentView(placeId: tempat.id),
                backgroundColor: Colors.white, 
                isScrollControlled: true,
              );
            },
            onFavoritePressed: () {
              if (favoriteController.isFavorite(tempat.id)) {
                favoriteController.removeFavorite(tempat.id);
              } else {
                favoriteController.addFavorite(tempat.id);
              }
            },
          );
        }
      }),
    );
  }
}

class detailPlace extends StatelessWidget {
  final List<String> imagePlaces;
  final String namePlace;
  final String locationPlace;
  final String ratingPlace;
  final String distancePlace;
  final String uptrendPlace;
  final String commentPlace;
  final String deskripsi;
  final String link;
  final VoidCallback onRatingPressed;
  final VoidCallback onLocationPressed;
  final VoidCallback onUptrendPressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onFavoritePressed;

  const detailPlace({
    Key? key,
    required this.imagePlaces,
    required this.namePlace,
    required this.locationPlace,
    required this.ratingPlace,
    required this.distancePlace,
    required this.uptrendPlace,
    required this.commentPlace,
    required this.deskripsi,
    required this.link,
    required this.onRatingPressed,
    required this.onLocationPressed,
    required this.onUptrendPressed,
    required this.onCommentPressed,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    return ListView(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: imagePlaces.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(image, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Obx(() {
                final isFavorite = favoriteController.isFavorite(namePlace);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_rounded,
                    color: isFavorite ? Colors.red : Colors.red,
                  ),
                  onPressed: onFavoritePressed,
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 16),
        Center(
          child: Column(
            children: [
              Text(
                namePlace,
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Text(
                  locationPlace,
                  style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              iconInfo(
                dataIcon: ratingPlace,
                ikon: Icons.star,
                onPressed: onRatingPressed,
                warna: Colors.red,
              ),
              SizedBox(width: 60),
              iconInfo(
                dataIcon: distancePlace,
                ikon: Icons.place,
                onPressed: onLocationPressed,
                warna: Colors.blue,
              ),
              SizedBox(width: 60),
              iconInfo(
                dataIcon: uptrendPlace,
                ikon: Icons.trending_up_sharp,
                onPressed: onUptrendPressed,
                warna: Colors.green,
              ),
              SizedBox(width: 60),
              iconInfo(
                dataIcon: commentPlace,
                ikon: Icons.forum,
                onPressed: onCommentPressed,
                warna: Colors.grey,
              )
            ],
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Deskripsi Tempat",
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            child: Text(
              deskripsi,
              style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        SizedBox(height: 70,)
      ],
    );
  }
}

class iconInfo extends StatelessWidget {
  final String dataIcon;
  final IconData ikon;
  final VoidCallback onPressed;
  final Color warna;

  const iconInfo({
    Key? key,
    required this.dataIcon,
    required this.ikon,
    required this.onPressed,
    required this.warna,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 36,
          width: 36,
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(ikon, color: warna),
              color: warna,
              iconSize: 20,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(dataIcon),
      ],
    );
  }
}