import 'dart:convert';
import 'package:http/http.dart' as http;

class UserResult {
  bool status;
  String message;

  UserResult({required this.status, required this.message});

  static String url = "http://192.168.0.102:8000";

  factory UserResult.createPostResult(Map<String, dynamic> object) {
    return UserResult(status: object['status'], message: object['message']);
  }

  static Future<UserResult> login(String email, String password) async {
    String apiURL = url + "/android/login";

    var apiResult =
        await http.post(apiURL, body: {"email": email, "password": password});
    var jsonObject = json.decode(apiResult.body);

    return UserResult.createPostResult(jsonObject);
  }

  static Future<UserResult> register(String name, String email, String password,
      String konfirmasiPassword) async {
    String apiURL = url + "/android/register";

    var apiResult = await http.post(apiURL, body: {
      "name": name,
      "email": email,
      "password": password,
      "konfirmasi_password": konfirmasiPassword
    });
    var jsonObject = json.decode(apiResult.body);

    return UserResult.createPostResult(jsonObject);
  }
}
