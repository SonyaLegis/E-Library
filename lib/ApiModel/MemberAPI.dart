import 'dart:convert';
import 'package:http/http.dart' as http;

class MemberResult {
  bool status;
  String message;
  String id;
  String nama_lengkap;
  String jenis_kelamin;
  String no_telephone;
  String tempat_tanggal_lahir;
  String email;
  String alamat;

  MemberResult({
    required this.status,
    required this.message,
    required this.id,
    required this.nama_lengkap,
    required this.jenis_kelamin,
    required this.no_telephone,
    required this.tempat_tanggal_lahir,
    required this.email,
    required this.alamat,
  });

  static String url = "http://192.168.0.102:8000";

  factory MemberResult.createPostResult(Map<String, dynamic> object) {
    return MemberResult(
      status: object['status'],
      message: object['massage'],
      id: object['id'].toString(),
      nama_lengkap: object['nama_lengkap'],
      jenis_kelamin: object['jenis_kelamin'],
      no_telephone: object['no_telephone'],
      tempat_tanggal_lahir: object['tempat_tanggal_lahir'],
      email: object['email'],
      alamat: object['alamat'],
    );
  }

  static Future<List<MemberResult>> show() async {
    String apiURL = url + "/android/member";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listMember = (jsonObject as Map<String, dynamic>)['data'];

    List<MemberResult> members = [];
    for (int i = 0; i < listMember.length; i++) {
      members.add(MemberResult.createPostResult(listMember[i]));
    }

    return members;
  }

  static Future<MemberResult> create(
    String nama_lengkap,
    String jenis_kelamin,
    String no_telephone,
    String tempat_tanggal_lahir,
    String email,
    String alamat,
  ) async {
    String apiURL = url + "/android/member/create";

    var apiResult = await http.post(apiURL, body: {
      "nama_lengkap": nama_lengkap,
      "jenis_kelamin": jenis_kelamin,
      "no_telephone": no_telephone,
      "tempat_tanggal_lahir": tempat_tanggal_lahir,
      "email": email,
      "alamat": alamat,
    });
    var jsonObject = json.decode(apiResult.body);

    return MemberResult.createPostResult(jsonObject);
  }

  static Future<MemberResult> update(
    String id,
    String nama_lengkap,
    String jenis_kelamin,
    String no_telephone,
    String tempat_tanggal_lahir,
    String email,
    String alamat,
  ) async {
    String apiURL = url + "/android/member/update";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
      "nama_lengkap": nama_lengkap,
      "jenis_kelamin": jenis_kelamin,
      "no_telephone": no_telephone,
      "tempat_tanggal_lahir": tempat_tanggal_lahir,
      "email": email,
      "alamat": alamat,
    });
    var jsonObject = json.decode(apiResult.body);

    return MemberResult.createPostResult(jsonObject);
  }

  static Future<MemberResult> delete(
    String id,
  ) async {
    String apiURL = url + "/android/member/destroy";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
    });
    var jsonObject = json.decode(apiResult.body);

    return MemberResult.createPostResult(jsonObject);
  }
}
