import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ActivityLogger {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logActivity(String activityType, String placeId, String placeName, {String imageUrl = 'https://via.placeholder.com/150', int uptrend = 0, double rating = 0.0}) async {
    User? user = _auth.currentUser;
    if (user != null) {
      String userId = user.uid;
      String userName = user.displayName ?? 'Unknown';
      String timestamp = DateTime.now().toIso8601String();

      print('Logging activity: $activityType at $placeName by $userName'); // Log for debugging
      print('User ID: $userId'); // Log user ID
      print('Timestamp: $timestamp'); // Log timestamp

      try {
        await _database.child('activity_log').push().set({
          'userId': userId,
          'userName': userName,
          'activityType': activityType,
          'placeId': placeId,
          'placeName': placeName,
          'imageUrl': imageUrl,
          'uptrend': uptrend,
          'rating': rating,
          'timestamp': timestamp,
        }).then((_) {
          print('Activity logged successfully');
        }).catchError((error) {
          print('Failed to log activity: $error');
        });
      } catch (error) {
        print('Exception while logging activity: $error');
      }
    } else {
      print('No authenticated user found.'); // Log when user is not authenticated
    }
  }
}
