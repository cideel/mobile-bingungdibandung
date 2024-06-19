import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Lokasi"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.200000, 106.816666),
          zoom: 10,
        ),
        onTap: (LatLng latLng) {
          Navigator.pop(context, "${latLng.latitude}, ${latLng.longitude}");
        },
      ),
    );
  }
}
