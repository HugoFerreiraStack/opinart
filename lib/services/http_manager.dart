import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../controllers/auth_controller.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}

class HttpManager {
  Future restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        "X-Parse-Application-Id": "RhEcnzYJ4rcjMX8iAiZTcG4bIjBgO3LDgtGVLWKc",
        "X-Parse-REST-API-Key": "E7CJiHISwv6B51Od2DfFALwFmeMPSlNsIHSYSOwa",
        "Content-Type": "application/json",
        "accept": "application/json",
      });

    Dio dio = Dio();

    try {
      final authController = Get.find<AuthController>();
      defaultHeaders.addIf(
        authController.user.value?.token != null,
        'X-Parse-Session-Token',
        authController.user.value!.token!,
      );
    } catch (_) {}

    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
        data: body,
      );

      return response.data;
    } on DioError catch (error) {
      return error.response?.data ?? {};
    } catch (error) {
      return {};
    }
  }
}
