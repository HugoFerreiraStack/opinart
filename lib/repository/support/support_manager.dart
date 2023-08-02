import 'package:opinarti/helpers/endpoints.dart';
import 'package:opinarti/services/http_manager.dart';

class SupportManager {
  final HttpManager _httpManager = HttpManager();

  Future<bool> sendSupport({
    required String subject,
    required String body,
    required String token,
    required String userId,
    bool answered = false,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.sendSupport,
      method: HttpMethods.post,
      body: {
        "user": userId,
        "subject": subject,
        "body": body,
        "answered": answered,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return result['error'] == null;
  }
}
