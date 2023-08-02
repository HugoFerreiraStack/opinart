import 'package:get/get.dart';
import 'package:opinarti/models/user/user_model.dart';
import 'package:opinarti/repository/user/user_manager.dart';

class ListTileUserController extends GetxController {
  final _deleteIsLoading = false.obs;
  final _changeIsLoading = false.obs;
  final _updateIsLoading = false.obs;

  final isBlocked = false.obs;

  bool get deleteIsLoading => _deleteIsLoading.value;
  bool get changeIsLoading => _changeIsLoading.value;
  bool get updateIsLoading => _updateIsLoading.value;

  final userManager = UserManager();

  Future<bool> deleteUser({String? userId}) async {
    _deleteIsLoading.value = true;

    final result = await userManager.deleteUser(
      userId: userId,
    );

    _deleteIsLoading.value = false;

    return result;
  }

  Future<bool> changeStatus({String? userId, required bool userBlocked}) async {
    _changeIsLoading.value = true;

    final result = await userManager.changeStatus(
      userId: userId,
      userBlocked: userBlocked,
    );

    _changeIsLoading.value = false;
    isBlocked.value = !userBlocked;

    return result;
  }

  Future<bool> updateUser({
    required String id,
    required String name,
    required String lastName,
    required String cnpj,
    required bool admin,
  }) async {
    _updateIsLoading.value = true;

    final result = await userManager.updateUser(
      id: id,
      name: name,
      lastName: lastName,
      cnpj: cnpj,
      admin: admin,
    );

    _updateIsLoading.value = false;

    return result;
  }

  RxList<UserModel> userList = <UserModel>[].obs;

  void updateUserLocally(UserModel editedUser) {
    int index = userList.indexWhere((user) => user.id == editedUser.id);
    if (index != -1) {
      userList[index] = editedUser;
    }
  }
}
