import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  var favoritePlaces = <String>[].obs; // List of favorite place IDs

  @override
  void onInit() {
    super.onInit();
    fetchFavoritePlaces();
  }

  void fetchFavoritePlaces() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DatabaseReference favRef = _database.child('favorites').child(user.uid);
        favRef.onValue.listen((DatabaseEvent event) {
          if (event.snapshot.value != null) {
            final data = Map<String, dynamic>.from(event.snapshot.value as Map<dynamic, dynamic>);
            favoritePlaces.assignAll(data.keys.toList());
          } else {
            favoritePlaces.clear();
          }
        });
      }
    } catch (e) {
      print('Failed to load favorite places: $e');
    }
  }

  void addFavorite(String placeId) async {
    User? user = _auth.currentUser;
    if (user != null && !favoritePlaces.contains(placeId)) {
      favoritePlaces.add(placeId);
      await _database.child('favorites').child(user.uid).update({placeId: true});
    }
  }

  void removeFavorite(String placeId) async {
    User? user = _auth.currentUser;
    if (user != null && favoritePlaces.contains(placeId)) {
      favoritePlaces.remove(placeId);
      await _database.child('favorites').child(user.uid).child(placeId).remove();
    }
  }

  bool isFavorite(String placeId) {
    return favoritePlaces.contains(placeId);
  }
}
