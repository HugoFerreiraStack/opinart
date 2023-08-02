import 'package:get/get.dart';
import 'package:opinarti/models/user/user_model.dart';
import 'package:opinarti/repository/user/user_manager.dart';

class AccessManagementController extends GetxController {
  final listUsers = Rxn<List<UserModel>>();
  RxBool isLoading = false.obs;
  List<UserModel>? get users => listUsers.value;

  Future<void> getUsers({
    String? search,
    String? page,
    String? itemsPerPage,
  }) async {
    final userManager = UserManager();
    isLoading.value = true;
    listUsers.value = await userManager.listUsers(
      search: search,
      page: page,
      itemsPerPage: itemsPerPage,
    );
    isLoading.value = false;
  }
}
