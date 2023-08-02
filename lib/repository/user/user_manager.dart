import '../../helpers/endpoints.dart';
import '../../models/user/user_model.dart';
import '../../services/http_manager.dart';

class UserManager {
  final HttpManager _httpManager = HttpManager();

  Future<List<UserModel>?> listUsers({
    required String? search,
    required String? page,
    required String? itemsPerPage,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.listUsers,
      method: HttpMethods.post,
      body: {
        "search": search,
        "page": page,
        "itemsPerPage": itemsPerPage,
      },
    );

    if (result != null) {
      List<UserModel> listUsers = [];

      for (var user in result['result']) {
        listUsers.add(UserModel.fromJson(user));
      }

      return listUsers;
    } else {
      return null;
    }
  }

  Future<bool> changeStatus({
    required String? userId,
    required bool? userBlocked,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.changeStatus,
      method: HttpMethods.post,
      body: {
        "userId": userId,
        "blocked": userBlocked,
      },
    );

    return result["result"];
  }

  Future<bool> deleteUser({
    required String? userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.deleteUser,
      method: HttpMethods.post,
      body: {
        "userId": userId,
      },
    );

    return result["result"];
  }

  Future<bool> updateUser({
    required String id,
    required String name,
    required String lastName,
    required String cnpj,
    required bool admin,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.manageUser,
      method: HttpMethods.post,
      body: {
        "userId": id,
        "name": name,
        "lastName": lastName,
        "cnpj": cnpj,
        "admin": admin,
        "manager": !admin,
      },
    );

    return result["result"];
  }
}
