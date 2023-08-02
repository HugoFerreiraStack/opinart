import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInternetConnectivity();
    _listenToConnectivityChanges();
  }

  Future<void> _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      isConnected(false);
    } else {
      isConnected(true);
    }
  }

  void _listenToConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        isConnected(false);
      } else {
        isConnected(true);
      }
    });
  }
}
