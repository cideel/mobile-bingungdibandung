
import 'package:bingung_di_bandung/Model/user.dart';
import 'package:bingung_di_bandung/routes/page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();


  var isLoading = false.obs;
  var userModel = UserModel().obs;

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DatabaseReference userRef = _database.child('users').child(user.uid);
        DatabaseEvent event = await userRef.once();

        DataSnapshot snapshot = event.snapshot;

        if (snapshot.exists && snapshot.value != null) {
          final userData = Map<String, dynamic>.from(snapshot.value as Map);
          userModel.value = UserModel.fromMap(userData);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> register(String email, String password, String name) async {
  if (email.isEmpty || password.isEmpty || name.isEmpty) {
    Get.snackbar('Error', 'Semua form harus diisi.', snackPosition: SnackPosition.BOTTOM);
    return;
  }

  try {
    isLoading(true);
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      UserModel newUser = UserModel(
        uid: user.uid,
        email: email,
        name: name,
        imageUrl: '',
      );

      await _database.child('users').child(user.uid).set(newUser.toMap());
      Get.snackbar('Sukses', 'Registrasi berhasil');
    }
  } catch (e) {
    Get.snackbar('Error', e.toString());
  } finally {
    isLoading(false);
  }
}


  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password harus diisi .', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading(true);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Sukses', 'Login berhasil', snackPosition: SnackPosition.BOTTOM);
      Get.offNamed(MyPage.navbar); 
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

   Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.snackbar('Sukses', 'Logout berhasil', snackPosition: SnackPosition.BOTTOM);
      Get.offAll(MyPage.login); 
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}




