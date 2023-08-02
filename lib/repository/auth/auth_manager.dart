import 'package:opinarti/helpers/endpoints.dart';
import 'package:opinarti/models/user/user_model.dart';
import 'package:opinarti/repository/auth/auth_errors.dart' as authErrors;
import 'package:opinarti/repository/auth/auth_result.dart';
import 'package:opinarti/services/http_manager.dart';

class AuthManager {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> createUser(
    UserModel user, {
    required String email,
    required String password,
    required String name,
    required String cnpj,
    required String phone,
    required String username,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.createUser,
      method: HttpMethods.post,
      body: {
        "name": name,
        "email": email,
        "password": password,
        "username": username,
        "cnpj": cnpj,
        "phone": phone,
        "admin": false,
        "block": false,
        "messageBlock": false,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        "X-Parse-Session-Token": token,
      },
    );

    if (result["result"] != null) {
      final user = UserModel.fromJson(result["result"]);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<void> resetPassword(String email) async {
    await _httpManager.restRequest(
      url: Endpoints.resetPassword,
      method: HttpMethods.post,
      body: {'email': email},
    );
  }

  Future<bool> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.changePassword,
      method: HttpMethods.post,
      body: {
        'email': email,
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return result['error'] == null;
  }

  Future<bool> updateUser({
    required String name,
    required String lastName,
    required String phone,
    required String token,
    required String userId,
    bool manager = false,
    bool owner = false,
    bool admin = false,
    bool blocked = false,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.updateUser,
      method: HttpMethods.post,
      body: {
        "userId": userId,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "manager": manager,
        "owner": owner,
        "admin": admin,
        "blocked": blocked
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return result['error'] == null;
  }
}
