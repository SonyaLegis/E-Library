// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:e_library/Model/DaftarBukuModel.dart';
import 'package:e_library/CustomListItem/CustomListDaftarBuku.dart';
import 'package:e_library/Page/InputDaftarBuku.dart';
import 'package:flutter/material.dart';

class DaftarBuku extends StatelessWidget {
  static List<String> judul = [
    "Pengetahuan IT",
    "Doraemon",
    "Tentang Kamu",
    "Pengetahuan Tentang Islam",
    "Dunia Yang Disembunyikan",
  ];

  static List<String> penulis = [
    "Dr. Daryanto",
    "Fujiko Fujio",
    "Tere Liye",
    "Dr. H Abuddin",
    "Jonathan Black",
  ];

  static List<String> jenis = [
    "Edukasi",
    "Komik",
    "Novel",
    "Agama",
    "Sejarah",
  ];

  static List<int> stok = [
    5,
    3,
    9,
    6,
    8,
  ];

  static List gambar = [
    'assets/BukuKomputer.jpeg',
    'assets/BukuDoraemon.jpeg',
    'assets/BukuNovel.jpeg',
    'assets/BukuAgama.jpeg',
    'assets/BukuDunia.jpeg',
  ];

  final List<DaftarBukuModel> DaftarBukuData = List.generate(
    judul.length,
    (index) => DaftarBukuModel('${judul[index]}', '${penulis[index]}',
        '${jenis[index]}', stok[index], '${gambar[index]}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InputDaftarBuku();
              },
            ),
          );
        },
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BerandaBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: CustomListDaftarBuku(
                user: DaftarBukuData[index].penulis,
                stok: DaftarBukuData[index].stok,
                jenis: DaftarBukuData[index].jenis,
                thumbnail: Image(
                  image: AssetImage(DaftarBukuData[index].gambar),
                ),
                title: DaftarBukuData[index].judul,
              ),
              color: Color.fromRGBO(242, 238, 238, 1),
            );
          },
          itemCount: judul.length,
        ),
      ),
    );
  }
}
