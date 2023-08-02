const String baseUrl = 'https://parseapi.back4app.com/parse/functions';

abstract class Endpoints {
  static const String signin = '$baseUrl/login';
  static const String createUser = '$baseUrl/create-user';
  static const String validateToken = '$baseUrl/validate-token';
  static const String resetPassword = '$baseUrl/reset-password';
  static const String changePassword = '$baseUrl/change-password';
  static const String updateUser = '$baseUrl/update-user';
  static const String sendSupport = '$baseUrl/send-support';
  static const String listUsers = '$baseUrl/list-users';
  static const String changeStatus = '$baseUrl/change-status';
  static const String deleteUser = '$baseUrl/delete-user';
  static const String manageUser = '$baseUrl/manage-user';
}
