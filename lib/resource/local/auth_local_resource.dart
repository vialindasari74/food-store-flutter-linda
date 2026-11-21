import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalResource {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Menyimpan token
  static Future<void> saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  /// Mengambil token
  static Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

  /// Menghapus token
  static Future<void> deleteToken() async {
    await _storage.delete(key: "token");
  }
}
