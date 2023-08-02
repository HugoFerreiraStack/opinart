import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var isOpen = false.obs;
  void toggleOpen() {
    isOpen.value = !isOpen.value;
  }
}
