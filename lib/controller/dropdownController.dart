import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedLabel = 'Alam'.obs;
  List<String> labels = ['Alam', 'Buatan', 'Kuliner','Lainnya'];

  void setSelectedLabel(String value) {
    selectedLabel.value = value;
  }
}
