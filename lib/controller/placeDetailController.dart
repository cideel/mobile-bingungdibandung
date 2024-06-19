import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/log/activityLog.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailController extends GetxController {
  final ActivityLogger activityLogger = ActivityLogger();
  var tempatWisata = TempatWisata(
    id: '',
    nama: '',
    alamat: '',
    deskripsi: '',
    fotoUrls: [],
    rating: 0.0,
    uptrend: 0,
    label: '',
    link: '', // Add the link field
  ).obs;

  void fetchTempatWisataDetail(String id) async {
    try {
      print('Fetching data for ID: $id'); // Log the ID
      DatabaseReference ref = FirebaseDatabase.instance.ref('tempat_wisata/$id');
      DataSnapshot snapshot = await ref.get();

      if (snapshot.exists) {
        print('Data found: ${snapshot.value}'); // Log the data
        var data = Map<String, dynamic>.from(snapshot.value as Map);
        tempatWisata.value = TempatWisata.fromMap(data);
      } else {
        print('No data available for ID: $id'); // Log no data case
      }
    } catch (error) {
      print('Failed to load data: $error');
    }
  }

 void updateRating(String id, double newRating) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    DatabaseReference ref = FirebaseDatabase.instance.ref('tempat_wisata/$id/ratings');
    await ref.child(user.uid).set(newRating);

    // Calculate average rating
    DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      Map<dynamic, dynamic> ratings = snapshot.value as Map<dynamic, dynamic>;
      double totalRating = 0.0;
      int ratingCount = 0;

      ratings.forEach((key, value) {
        totalRating += (value as num).toDouble();
        ratingCount++;
      });

      double averageRating = totalRating / ratingCount;

      DatabaseReference tempatRef = FirebaseDatabase.instance.ref('tempat_wisata/$id');
      await tempatRef.update({'rating': averageRating});
    }

    fetchTempatWisataDetail(id); // Refresh data
  } catch (error) {
    print('Failed to update rating: $error');
  }
}




  void toggleUptrend(String id) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    DatabaseReference ref = FirebaseDatabase.instance.ref('tempat_wisata/$id');
    await ref.runTransaction((Object? currentData) {
      if (currentData == null) {
        return Transaction.abort();
      }

      var data = Map<String, dynamic>.from(currentData as Map<dynamic, dynamic>);
      List<dynamic> uptrendUsers = data['uptrendUsers'] ?? [];

      if (uptrendUsers.contains(user.uid)) {
        // User has already given uptrend
        return Transaction.abort();
      }

      uptrendUsers.add(user.uid);
      data['uptrendUsers'] = uptrendUsers;
      data['uptrend'] = (data['uptrend'] ?? 0) + 1;

      return Transaction.success(data);
    });

    fetchTempatWisataDetail(id); // Refresh data
  } catch (error) {
    print('Failed to toggle uptrend: $error');
  }
}


  
}


  


