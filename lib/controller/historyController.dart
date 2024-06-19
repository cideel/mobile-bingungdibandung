import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  var activityLog = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchActivityLog();
  }

  void fetchActivityLog() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DatabaseReference logRef = _database.child('activity_log');
      logRef.orderByChild('userId').equalTo(user.uid).onValue.listen((DatabaseEvent event) {
        if (event.snapshot.exists) {
          final data = Map<String, dynamic>.from(event.snapshot.value as Map<dynamic, dynamic>);
          activityLog.assignAll(data.values.map((e) => Map<String, dynamic>.from(e as Map<dynamic, dynamic>)).toList());
          print('Fetched activity log: $data'); // Log for debugging
        } else {
          activityLog.clear();
          print('No activity log found'); // Log for debugging
        }
      });
    } else {
      print('No authenticated user found in HistoryController');
    }
  }
}
