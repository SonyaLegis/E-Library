import 'dart:convert';
import 'package:http/http.dart' as http;

class PinjamBukuResult {
  bool status;
  String message;
  String id;
  String nim_anggota;
  String nama_anggota;
  String kategory;
  String nama_buku;
  String tanggal_pinjam;
  String tanggal_kembali;

  PinjamBukuResult({
    required this.status,
    required this.message,
    required this.id,
    required this.nim_anggota,
    required this.nama_anggota,
    required this.kategory,
    required this.nama_buku,
    required this.tanggal_pinjam,
    required this.tanggal_kembali,
  });

  static String url = "http://192.168.0.102:8000";

  factory PinjamBukuResult.createPostResult(Map<String, dynamic> object) {
    return PinjamBukuResult(
      status: object['status'],
      message: object['massage'],
      id: object['id'].toString(),
      nim_anggota: object['nim_anggota'],
      nama_anggota: object['nama_anggota'],
      kategory: object['kategory'],
      nama_buku: object['nama_buku'],
      tanggal_pinjam: object['tanggal_pinjam'],
      tanggal_kembali: object['tanggal_kembali'],
    );
  }

  static Future<List<PinjamBukuResult>> show() async {
    String apiURL = url + "/android/borrowbook";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listPinjamBuku = (jsonObject as Map<String, dynamic>)['data'];

    List<PinjamBukuResult> borrowBooks = [];
    for (int i = 0; i < listPinjamBuku.length; i++) {
      borrowBooks.add(PinjamBukuResult.createPostResult(listPinjamBuku[i]));
    }

    return borrowBooks;
  }

  static Future<PinjamBukuResult> create(
    String nim_anggota,
    String nama_anggota,
    String kategory,
    String nama_buku,
    String tanggal_pinjam,
    String tanggal_kembali,
  ) async {
    String apiURL = url + "/android/borrowbook/create";

    var apiResult = await http.post(apiURL, body: {
      "nim_anggota": nim_anggota,
      "nama_anggota": nama_anggota,
      "kategory": kategory,
      "nama_buku": nama_buku,
      "tanggal_pinjam": tanggal_pinjam,
      "tanggal_kembali": tanggal_kembali,
    });
    var jsonObject = json.decode(apiResult.body);

    return PinjamBukuResult.createPostResult(jsonObject);
  }

  static Future<PinjamBukuResult> update(
    String id,
    String nim_anggota,
    String nama_anggota,
    String kategory,
    String nama_buku,
    String tanggal_pinjam,
    String tanggal_kembali,
  ) async {
    String apiURL = url + "/android/borrowbook/update";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
      "nim_anggota": nim_anggota,
      "nama_anggota": nama_anggota,
      "kategory": kategory,
      "nama_buku": nama_buku,
      "tanggal_pinjam": tanggal_pinjam,
      "tanggal_kembali": tanggal_kembali,
    });
    var jsonObject = json.decode(apiResult.body);

    return PinjamBukuResult.createPostResult(jsonObject);
  }

  static Future<PinjamBukuResult> delete(
    String id,
  ) async {
    String apiURL = url + "/android/borrowbook/destroy";

    var apiResult = await http.post(apiURL, body: {
      "id": id,
    });
    var jsonObject = json.decode(apiResult.body);

    return PinjamBukuResult.createPostResult(jsonObject);
  }
}
