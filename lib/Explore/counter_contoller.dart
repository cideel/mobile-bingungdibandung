

import 'package:get/get.dart';

class CounterController extends GetxController {
  // Define an observable variable
  var counter = 0.obs;

  // Increment method
  void increment() {
    counter++;
  }

  // Decrement method
  void decrement() {
    counter--;
  }
}
