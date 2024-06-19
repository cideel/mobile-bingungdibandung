import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class Search extends GetxController {
  var searchResults = <Map<String, dynamic>>[].obs;

  void searchPlaces(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    DatabaseReference placesRef = FirebaseDatabase.instance.ref('tempat_wisata');
    placesRef.orderByChild('nama').startAt(query).endAt('$query\uf8ff').onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        var data = Map<String, dynamic>.from(event.snapshot.value as Map<dynamic, dynamic>);
        var results = data.values.map((e) => Map<String, dynamic>.from(e as Map<dynamic, dynamic>)).toList();
        searchResults.assignAll(results);
      } else {
        searchResults.clear();
      }
    });
  }
}
