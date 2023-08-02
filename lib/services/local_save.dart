import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSave {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
  Future<void> saveLocalToken(String key, String data) async {
    await storage.write(key: key, value: data);
  }

  Future<String?> getLocalToken({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> removeLocalToken({required String key}) async {
    await storage.delete(key: key);
  }
}
