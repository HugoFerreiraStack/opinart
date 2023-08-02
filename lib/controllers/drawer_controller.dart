import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DrawerExpandedController extends GetxController {
  RxBool isExpanded = false.obs;

  void expand() {
    isExpanded.value = true;
  }

  void reduce() {
    isExpanded.value = false;
  }
}
