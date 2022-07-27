import 'dart:convert';
import 'package:http/http.dart' as http;

class AdminResult {
  bool status;
  String message;
  String id;
  String nama_petugas;
  String jenis_kelamin;
  String no_telephone;
  String jabatan;
  String alamat;

  AdminResult({
    required this.status,
    required this.message,
    required this.id,
    required this.nama_petugas,
    required this.jenis_kelamin,
    required this.no_telephone,
    required this.jabatan,
    required this.alamat,
  });

  static String url = "http://192.168.0.102:8000";

  factory AdminResult.createPostResult(Map<String, dynamic> object) {
    return AdminResult(
      status: object['status'],
      message: object['massage'],
      id: object['id'].toString(),
      nama_petugas: object['nama_petugas'],
      jenis_kelamin: object['jenis_kelamin'],
      no_telephone: object['no_telephone'],
      jabatan: object['jabatan'],
      alamat: object['alamat'],
    );
  }

  static Future<List<AdminResult>> show() async {
    String apiURL = url + "/android/admin";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listAdmin = (jsonObject as Map<String, dynamic>)['data'];

    List<AdminResult> admins = [];
    for (int i = 0; i < listAdmin.length; i++) {
      admins.add(AdminResult.createPostResult(listAdmin[i]));
    }

    return admins;
  }

  static Future<AdminResult> create(
    String nama_petugas,
    String jenis_kelamin,
    String no_telephone,
    String jabatan,
    String alamat,
  ) async {
    String apiURL = url + "/android/admin/create";

    var apiResult = await http.post(apiURL, body: {
      "nama_petugas": nama_petugas,
      "jenis_kelamin": jenis_kelamin,
      "no_telephone": no_telephone,
      "jabatan": jabatan,
      "alamat": alamat,
    });
    var jsonObject = json.decode(apiResult.body);

    return AdminResult.createPostResult(jsonObject);
  }

  static Future<AdminResult> update(
    String id,
    String nama_petugas,
    String jenis_kelamin,
    String no_telephone,
    String jabatan,
    String alamat,
  ) async {
    String apiURL = url + "/android/admin/update";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
      "nama_petugas": nama_petugas,
      "jenis_kelamin": jenis_kelamin,
      "no_telephone": no_telephone,
      "jabatan": jabatan,
      "alamat": alamat,
    });
    var jsonObject = json.decode(apiResult.body);

    return AdminResult.createPostResult(jsonObject);
  }

  static Future<AdminResult> delete(
    String id,
  ) async {
    String apiURL = url + "/android/admin/destroy";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
    });
    var jsonObject = json.decode(apiResult.body);

    return AdminResult.createPostResult(jsonObject);
  }
}
