import 'package:bingung_di_bandung/Model/comment.dart';
import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/log/activityLog.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommentController extends GetxController {
  final ActivityLogger activityLogger = ActivityLogger();
  var comments = <Comment>[].obs;
  late TempatWisata tempatWisata;

  void setTempatWisata(TempatWisata tempat) {
    tempatWisata = tempat;
  }

  void fetchComments(String placeId) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref('comments/$placeId');
      ref.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          var data = Map<String, dynamic>.from(event.snapshot.value as Map);
          var fetchedComments = data.entries.map((e) => Comment.fromMap(Map<String, dynamic>.from(e.value))).toList();
          comments.assignAll(fetchedComments);
        } else {
          comments.clear();
        }
      });
    } catch (error) {
      print('Failed to load comments: $error');
    }
  }

  Future<void> addComment(String placeId, String commentText) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DatabaseReference userRef = FirebaseDatabase.instance.ref('users/${user.uid}');
        DataSnapshot userSnapshot = await userRef.get();

        if (userSnapshot.exists) {
          String userName = userSnapshot.child('name').value as String? ?? 'Unknown';
          String userPhotoUrl = userSnapshot.child('imageUrl').value as String? ?? '';

          DatabaseReference ref = FirebaseDatabase.instance.ref('comments/$placeId').push();
          Comment comment = Comment(
            id: ref.key!,
            userId: user.uid,
            userName: userName,
            userPhotoUrl: userPhotoUrl,
            text: commentText,
          );

          await ref.set(comment.toMap());
          print('Comment added: ${comment.toMap()}'); // Log for debugging

          // Log the activity
          DatabaseReference placeRef = FirebaseDatabase.instance.ref('tempat_wisata/$placeId');
          DataSnapshot placeSnapshot = await placeRef.get();
          if (placeSnapshot.exists) {
            String placeName = placeSnapshot.child('nama').value as String;
            String imageUrl = placeSnapshot.child('fotoUrls/0').value as String? ?? 'https://via.placeholder.com/150';
            int uptrend = placeSnapshot.child('uptrend').value as int? ?? 0;
            double rating = placeSnapshot.child('rating').value as double? ?? 0.0;

            print('Logging comment activity for place: $placeName'); // Log for debugging
            activityLogger.logActivity('commented', placeId, placeName, imageUrl: imageUrl, uptrend: uptrend, rating: rating);
          } else {
            print('Place not found for ID: $placeId'); // Log when place is not found
          }
        } else {
          print('User not found in database'); // Log when user data is not found
        }
      } else {
        print('No authenticated user found.'); // Log when user is not authenticated
      }
    } catch (error) {
      print('Failed to add comment: $error');
    }
  }
}
