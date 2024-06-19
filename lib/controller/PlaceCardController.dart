import 'package:bingung_di_bandung/Model/tempatWisata.dart';
import 'package:bingung_di_bandung/log/activityLog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class TempatWisataController extends GetxController {
  final ActivityLogger activityLogger = ActivityLogger();
  var tempatWisataList = <TempatWisata>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTempatWisata();
  }

  void fetchTempatWisata() {
    DatabaseReference ref = FirebaseDatabase.instance.ref('tempatWisata');
    ref.onValue.listen((event) {
      var data = event.snapshot.value as Map<dynamic, dynamic>;
      tempatWisataList.clear();
      data.forEach((key, value) {
        var tempatWisata = TempatWisata.fromMap(Map<String, dynamic>.from(value));
        tempatWisataList.add(tempatWisata);
      });
    });
  }
}
